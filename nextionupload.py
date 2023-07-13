#!/usr/bin/python
# coding=utf-8

# this file has been modified for DVMEGA-Cast by PE1MSZ (ruud@combitronics.nl)
import threading
import time
import os
import sys
import serial

BAUDCOMM = 115200
BAUDUPLOAD = 115200

if len(sys.argv) != 4:
	print('usage: python %s /dev/port file_to_upload.tft' % sys.argv[0])
	exit(-2)

PORT = sys.argv[1]
CHECK_MODEL = sys.argv[2]
file_path = sys.argv[3]

if os.path.isfile(file_path):
	print('uploading %s (%i bytes)...' % (file_path, os.path.getsize(file_path)))
else:
	print('file not found')
	exit(-1)

fsize = os.path.getsize(file_path)
print('Filesize: ' + str(fsize))

ser = serial.Serial(PORT, BAUDCOMM, timeout=.1, )

acked = threading.Event()
stop_thread = threading.Event()

def reader():
    global acked
    global ser
    while stop_thread.is_set() == False:
        r = ser.read(1)
        if r == '':
            continue
        elif b'\x05' in r:
            acked.set()
            continue
        else:
            print('<%r>' % r)
            continue

            
def upload():
    global acked
    global ser
    global stop_thread
    ser.write(b'\xff\xff\xff')
    ser.write(b'whmi-wri %i,%i,0' % (fsize, BAUDUPLOAD))
    ser.write(b'\xff\xff\xff')
    time.sleep(0.01)
    r = ser.read(128)
    ser.flush()
    acked.clear()
    #ser.baudrate = BAUDUPLOAD
    ser.timeout = 1
    threader.start()
    print('Waiting for ACK...')
    #acked.wait()
    print('Uploading...')
    with open(file_path, 'rb') as hmif:
        dcount = 0
        while True:
            time.sleep(.1)
            data = hmif.read(4096)
            if len(data) == 0: break
            dcount += len(data)
            print ('writing %i...' % len(data))
            ser.write(data)
            acked.clear()
            sys.stdout.write('\rDownloading, %3.1f%%...' % (dcount/ float(fsize)*100.0))
            sys.stdout.flush()
            print ('waiting for hmi...')
            acked.wait()
        print('')
    stop_thread.set()
    threader.join(1)


threader = threading.Thread(target = reader)
threader.daemon = True

no_connect = True
for baudrate in ( 115200, 115200, 115200):
    ser.baudrate = baudrate
    ser.timeout = 3000/baudrate + 1.5
    print('Trying with ' + str(baudrate) + '...')
    ser.write(b'\xff\xff\xff')
    ser.write(b'\xe0\x0c\x04\xff\x00\x00\x00\x00\x00\x00\x00\x00')
    time.sleep(1)
    ser.write(b'\xff\xff\xff')
    ser.write(b'connect')
    ser.write(b'\xff\xff\xff')
    time.sleep(0.25)
    r = ser.read(128)
    if b'comok' in r:
        print('Connected with ' + str(baudrate) + '!')
        no_connect = False
        status, unknown1, model, unknown2, version, serial, flash_size = r.strip(b'\xff\x00').split(b',')
        print('Status: ' + str(status))
        print('Model: ' + str(model))
        print('Version: ' + str(version))
        print('Serial: ' + str(serial))
        print('Flash size: ' + str(flash_size))
        if fsize > int(flash_size):
            print('File too big!')
            break
        if not CHECK_MODEL in str(model):
            print('Wrong Display!')
            break
        upload()
        break

if no_connect:
    print('No connection!')
else:
    print('File written to Display!')

ser.close()


#! /bin/bash

sudo mount -o remount,rw /


git_checkUpdateRequired() {
	# Set the function variables
	gitFolder=${1}
	gitRemoteURL=$(git --work-tree=${gitFolder} --git-dir=${gitFolder}/.git config --get remote.origin.url)

	# Git check / update function
	gitStatusRemote=$(git ls-remote --heads ${gitRemoteURL} | grep master | cut -c 1-7)
	gitStatusLocal=$(git --work-tree=${gitFolder} --git-dir=${gitFolder}/.git log --pretty=format:"%h" -1)

	# Return the output
	if [[ ${gitStatusRemote} != ${gitStatusLocal} ]]; then
		echo "1"
	else
		echo "0"
	fi
}

git_update() {
	# Set the function variables
	gitFolder=${1}
	
	if [[ $(git_checkUpdateRequired ${gitFolder}) -gt 0 ]]; then
		echo "Updating ${gitFolder}..."
		git --work-tree=${gitFolder} --git-dir=${gitFolder}/.git pull origin 
		
	fi
}


git_update /var/cast

sudo chmod +x *

cp /var/cast/*.sh /usr/local/sbin





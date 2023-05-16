<?php
// Load the language support
require_once('../config/language.php');
//Load the Pi-Star Release file
$pistarReleaseConfig = '/etc/pistar-release';
$configPistarRelease = array();
$configPistarRelease = parse_ini_file($pistarReleaseConfig, true);
//Load the Version Info
require_once('../config/version.php');




 $fileLocation = getenv("DOCUMENT_ROOT") . "/castmemlist.txt";
 if(file_exists($fileLocation))
 {

 }
 else
 {
   shell_exec('sudo mount -o remount,rw /');
   $nf = fopen($fileLocation, "w");
   fwrite($nf, "DRM,204,Netherlands,\n");
   fclose($nf);

 }






?>

  <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
  <html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml" lang="en">

  <head>
    <meta name="robots" content="index" />
    <meta name="robots" content="follow" />
    <meta name="language" content="English" />
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <meta name="Author" content="Andrew Taylor (MW0MWZ)" />
    <meta name="Description" content="Pi-Star Expert Editor" />
    <meta name="KeyWords" content="Pi-Star" />
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="pragma" content="no-cache" />
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
    <meta http-equiv="Expires" content="0" />
    <title>Pi-Star - Digital Voice Dashboard - Update is Ready</title>
    <link rel="stylesheet" type="text/css" href="../css/pistar-css.php" />
  </head>

  <body>
  <div class="container">
  <?php include './mem_list.inc'; ?>
  <div class="contentwide">  

  <tr><h3>Add item to memory list</h3></tr>

<table style="width:100%">
  <tr>
    <th style="width:33%">D-Star</th>
    <th style="width:33%">DMR</th>
    <th style="width:33%">Fusion</th>
  </tr>

  <tr>
   <form action="add_item.php" method="post" enctype="multipart/form-data">  
    <td><BR>
      Reflector  
      <select name="RTG_ref">
<?php
        $fileLocation =  "/usr/local/etc/DCS_Hosts.txt";
        $names=file($fileLocation);
        foreach($names as $name)
        {
         if(substr($name,0,3) == "DCS")
         {
           $li = substr($name,0,6);
           echo"<option value='".$li."'>". $li . "</option>";
         }
        }

        $fileLocation =  "/usr/local/etc/XLXHosts.txt";
        $names=file($fileLocation);
        foreach($names as $name)
        {
         if(substr($name,0,1) != "#")
         {
           $li = "XLX". substr($name,0,3);
           echo"<option value='".$li."'>". $li . "</option>";
         }
        }

        $fileLocation =  "/usr/local/etc/DPlus_Hosts.txt";
        $names=file($fileLocation);
        foreach($names as $name)
        {
         if(substr($name,0,3) == "REF")
         {
           $li = substr($name,0,6);
           echo"<option value='".$li."'>". $li . "</option>";
         }
        }

        $fileLocation =  "/usr/local/etc/DExtra_Hosts.txt";
        $names=file($fileLocation);
        foreach($names as $name)
        {
         if(substr($name,0,3) == "XRF")
         {
           $li = substr($name,0,6);
           echo"<option value='".$li."'>". $li . "</option>";
         }
        }
?>
      </select>
      <select name="RTG_mod">
        <option value="A">A</option>
        <option value="B">B</option>
        <option value="C">C</option>
        <option value="D">D</option>
        <option value="E">E</option>
        <option value="F">F</option>
        <option value="G">G</option>
        <option value="H">H</option>
        <option value="I">I</option>
        <option value="J">J</option>
        <option value="K">K</option>
        <option value="L">L</option>
        <option value="M">M</option>
        <option value="N">N</option>
        <option value="O">O</option>
        <option value="P">P</option>
        <option value="Q">Q</option>
        <option value="R">R</option>
        <option value="S">S</option>
        <option value="T">T</option>
        <option value="U">U</option>
        <option value="V">V</option>
        <option value="W">W</option>
        <option value="X">X</option>
        <option value="Y">Y</option>
        <option value="Z">Z</option>
      </select> 
   <BR><BR>
     <input type="hidden" id="mode" name="mode" value="DST">
     List name  <input type="text" maxlength="12" size = "11" id="RTG_lab" name="RTG_lab">
   <BR><BR>
   <center><input type="submit" value="Add D-Star reflector" name="submit"><BR><BR></center>
  </td>
  </form>
  



 <form action="add_item.php" method="post" enctype="multipart/form-data">  
    <td><BR>
  Talkgroup  <input type="text" maxlength="9" size = "11" id="RTG_ref" name="RTG_ref">
   <BR><BR>
    <input type="hidden" id="mode" name="mode" value="DMR">
    <input type="hidden" id="RTG_mod" name="RTG_mod" value="0">
     List name  <input type="text" maxlength="12" size = "11" id="RTG_lab" name="RTG_lab">
   <BR><BR>
   <center><input type="submit" value="Add DMR Talkgroup" name="submit"><BR><BR></center>
  </td>
  </form>



 <form action="add_item.php" method="post" enctype="multipart/form-data">
    <td><BR>
      Room
      <select name="RTG_ref" style="width: 200px;">
<?php
        $fileLocation =  "/usr/local/etc/YSFHosts.txt";
        $names=file($fileLocation);
        foreach($names as $name)
        {
         if(substr($name,0,1) != "#")
         {
           $i = 0;
//           $li = "YSF". substr($name,0,5) . " ";
         $li = "";
           do{
           $li .= substr($name,6+$i,1);
           $i += 1; 
          } while(substr($name,6+$i, 1) != ";");

           echo"<option value='".$li."'>". $li . "</option>";
         }
        }

        $fileLocation =  "/usr/local/etc/FCSHosts.txt";
        $names=file($fileLocation);
        foreach($names as $name)
        {
         if(substr($name,0,3) == "FCS")
         {
           $li = substr($name,0,8);
           echo"<option value='".$li."'>". $li . "</option>";
         }
        }


?>
      </select>
   <BR><BR>
     <input type="hidden" id="mode" name="mode" value="YSF">
     <input type="hidden" id="RTG_mod" name="RTG_mod" value="0">
     List name  <input type="text" maxlength="12" size="11" id="RTG_lab" name="RTG_lab">
   <BR><BR>
   <center><input type="submit" value="Add Fusion room" name="submit"><BR><BR></center>
  </td>
  </form>

</table>
  <BR>



<?php

  $fileLocation = getenv("DOCUMENT_ROOT") . "/castmemlist.txt";
  $names=file($fileLocation);
  echo  "<tr><h3>Stored memory list (". count($names) . "/25)";
  if(count($names) > 24) echo " Memory full !";
  copy($names,'/home/pi-star/castmemlist.txt);

  echo "</h3></tr> <BR>";

  echo  "<table style='width:100%'>";
  echo   "<tr>";
  echo    "<th style='width:25%'>Mode</th>";
  echo    "<th style='width:25%'>Refl / TG / Room</th>";
  echo    "<th style='width:25%'>Listname</th>";
  echo    "<th style='width:25%'>Action</th>";
  echo   "</tr>";

  $fileLocation = getenv("DOCUMENT_ROOT") . "/castmemlist.txt";
  $names=file($fileLocation);
  foreach($names as $name)
  {
   if(strlen($name) > 5)
   {
    echo  "<tr><td>";
    for ($i = 0; $i <= strlen($name); $i++)
    {
      if(substr($name, $i, 1) != ',')
      {
       echo substr($name, $i,1);
      }
      else
      {
       echo "</td>";
       if($i < strlen($name)-2) echo "<td>";
      }    
    }





    echo "<td>";

    echo " <form action='act_item.php' method='post' enctype='multipart/form-data'>";
    echo "<input type='hidden' id='memId' name='memId' value='".$name."'>";
    echo "<input type='submit' value='Down' name='submit' style=' width:50px'>";
    echo "<input type='submit' value='Up' name='submit' style=' width:50px'>";
    echo "<input type='submit' value='Delete' name='submit' style=' width:50px'>";

    echo "</form>";

    echo "</td>";
    echo "</tr>";
   }
  }
   
  echo  "</table><BR><BR>";
?>


</div>
<div class="footer">
Pi-Star / Pi-Star Dashboard, &copy; Andy Taylor (MW0MWZ) 2014-<?php echo date("Y"); ?>.<br />
ircDDBGateway Dashboard by Hans-J. Barthen (DL5DI),<br />
MMDVMDash developed by Kim Huebel (DG9VH), <br />
Need help? Click <a style="color: #ffffff;" href="https://www.facebook.com/groups/pistar/" target="_new">here for the Support Group</a><br />
Get your copy of Pi-Star from <a style="color: #ffffff;" href="http://www.pistar.uk/downloads/" target="_new">here</a>.<br />
</div>

</div>
</body>
</html>


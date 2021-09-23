<?php
if (isset($_POST['submit']))
    {     
         shell_exec('sudo /var/cast/CAST.sh');
		shell_exec('sudo /var/cast/upcast.sh');
		 header("Location:finish.php");
 
    }
?>


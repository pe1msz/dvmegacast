<?php
if (isset($_POST['submit']))
    {     
         shell_exec('sudo /var/cast/CAST.sh');
		 header("Location:finish.php");
 
    }
?>


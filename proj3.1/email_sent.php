<? include("header.php");?>

<?php
$emailSubject = 'CRCP 3320 Project 3.1 E-Mail';
$webMaster = 'acgarner@mail.smu.edu';
$name = $_POST ["name"];
$eAddress = $_POST["eAddress"];
$body = $_POST ["body"];
$bodyContent = <<<EOD
<br><hr><br>
Name: $name <br>
Email: $email <br>
Comments: $body <br>
EOD;
$headers = "From: $eAddress\r\n";
$headers .= "Content-type: text/html\r\n";

mail($eAddress, $name, $body, $headers);
echo "email sent!"
?>

<? include("footer.php");?>
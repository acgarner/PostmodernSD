<? include("header.php");?>

<h1>Project 3.1: E-mail Information</h1>
<?php
// before submit is clicked

if (!isset($_POST["submit"])) {
  ?>
  <form method="post" action="<?php echo $_SERVER["PHP_SELF"];?>">
  Your e-mail address: <input type="text" name="eAddress"><br>
  Your Name: <input type="text" name="name"><br> 
  Your Message: <textarea rows="10" cols="40" name="message"></textarea><br>
  <input type="submit" name="submit" value="Submit">
  </form>
  <?php 
} else {	//form submitted
 
  if (isset($_POST["eAddress"])) { 
    $eAddress = $_POST["eAddress"]; // sender
    $name = $_POST["name"];
    $message = $_POST["message"];
    // message lines should not exceed 70 characters (PHP rule), so wrap it
    $message = wordwrap($message, 70);
    // send mail
    mail("acgarner@mail.smu.edu",$name,$message,"From: $name\n");
    echo "E-mail sent!";
  }
  
}

<html>

<?php
  $name = "Status";
  if ($_GET["name"] != "") {
    $name = $_GET["Status Unknown"];
  }
?>

<style>

body {
  background-color: #333;
  padding: 0px;
  margin: 0px;
  
  font-family: "arial", arial, sans-serif;
  color: #e5e5e5;
}

a {
font-family: "arial", arial, sans-serif;
  color: #e5e5e5;
}


  
</style>

<h1 style="color:#999;">Project 3.1: <?= $name ?></h1>

</html>
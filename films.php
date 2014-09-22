<?
$mysqli = new mysqli("crcp3320db.humanoriented.com", "agarner", "Crcp3320", "agarner");
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}

echo $mysqli->host_info . "\n";

?>

<!DOCTYPE html><!-- HTML5 doctype -->
<html lang = "en-us">
<head>
	<title> </title>
</head>
<body>

<h1>
<p>Film1</p>
<p>Film2</p>
</body>
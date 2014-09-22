<?
$mysqli = new mysqli("crcp3320db.humanoriented.com", "agarner", "Crcp3320", "agarner");
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}

echo $mysqli->host_info . "\n";

$id = $_GET["film_id"];
$results = $mysqli->query("SELECT id, title FROM examples WHERE id = " . $id . ";"); 
//$row = $results->fetch_assoc();
$film_title = $row["title"];

?>
<!DOCTYPE html>
<html lang = "en-us">
<head>
	<title>Widget Details</title>
</head>
<body>
<h1><?= $film_title ?></h1>


</body>
</html>
<?$mysqli->close();?>
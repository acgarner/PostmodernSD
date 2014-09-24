<!DOCTYPE html>

<?php
if(isset($_POST['submit'])){


if(empty($errors)) {

	$widget_name = ($_POST["username"]);
	$id = ($_POST["id"]);
	
	$query = "INSERT INTO examples (";
	$query .= " widget_name, id";
	$query .= ") VALUES (";
	$query .= " '{$username}', '{$id}'";
	$query .= ")";
	$result = mysqli_query($connection,$query);
	
	if($result){
	redirect_to(manage_widgets.php);
	
	?>
	
	<?php $layout_context = widget; ?>
	
	<div id = "main">
		<div id = "navigation">
		&nbsp;
	</div>
	<div id = "page">
	
	<h2>Create Widget</h2>
	<form action = new_widget.php" method= "post">
	<p> Widget Name:
		<input type="text" name="widget_name" value="" />
	</p>
	<input type = "submit" name = "submit" value = "Create Widget"/>
	</form>
	<br />
	<a href="manage_widgets.php">Cancel<a/>
	</div>

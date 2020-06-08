<?php
//including the database connection file
include_once("config.php");

//fetching data in descending order (lastest entry first)
//$result = mysql_query("SELECT * FROM users ORDER BY id DESC"); // mysql_query is deprecated
$result = mysqli_query($mysqli, "SELECT * FROM users ORDER BY id DESC"); // using mysqli_query instead
?>

<html>
<head>	
	<title><h2>Homepage</h2></title>
</head>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<body>
<?php 
  session_start(); 

  if (!isset($_SESSION['username'])) {
  	$_SESSION['msg'] = "You must log in first";
  	header('location: login.php');
  }
  if (isset($_GET['logout'])) {
  	session_destroy();
  	unset($_SESSION['username']);
  	header("location: login.php");
  }
?>
<!DOCTYPE html>

 <nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="index.php"><b>Hunt4Jobs</b></a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="index.php">Admin Home</a></li>
      <li><a href="index.php?logout='1'" style="color: red; float: right">Logout</a></li>
    </ul>
  </div>
</nav>

<div class="content">
  	<!-- notification message -->
  	<?php if (isset($_SESSION['success'])) : ?>
      <div class="error success" >
      	<h3>
          <?php 
          	echo $_SESSION['success']; 
          	unset($_SESSION['success']);
          ?>
      	</h3>
      </div>
  	<?php endif ?>

    <!-- logged in user information -->
    <?php  if (isset($_SESSION['username'])) : ?>
    	<!-- <p>Welcome <strong><?php // echo $_SESSION['username']; ?></strong></p> -->
      <h4 style = "padding-left: 50px;">  Welcome <strong>Administrator</strong></h4>
    <?php endif ?>
</div>
<!-- 
<a href="add.html" style="float: left; margin-left: 50px;">Add Personal Details</a>
<a href="add_education.html" style="float: left; margin-left: 100px;">Add Education Details</a>
<a href="add_experience.html" style="float: left; margin-left: 150px;">Add Experience Details</a>
<a href="add_skill.html" style="float: left; margin-left: 200px;">Add Skills</a><br/><br/> -->

	<?php
	echo "<div class='container'>";           
  echo "<table class='table table-condensed'>";
  ?>

	<tr bgcolor='#CCCCCC'>
		<td>First Name</td>
		<td>Last Name</td>
		<td>Date of Birth</td>
		<td>Gender</td>
		<td>E-mail</td>
	</tr>
	<?php 
 // mysql_fetch_array is deprecated, we need to use mysqli_fetch_array 
	while($res = mysqli_fetch_array($result)) { 	
			
		echo "<tr>";
		echo "<td>".$res['first_name']."</td>";
		echo "<td>".$res['last_name']."</td>";
		echo "<td>".$res['date_of_birth']."</td>";
		echo "<td>".$res['gender']."</td>";
		echo "<td>".$res['email']."</td>";	
		echo "<td><a href=\"edit.php?id=$res[id]\">Edit</a> | <a href=\"delete.php?id=$res[id]\" onClick=\"return confirm('Are you sure you want to delete?')\">Delete</a></td>";		
	}
	echo "</table>";
	echo "</div>";
	?> 

</body>
</html>
<!DOCTYPE html>
<html>
<head>
  <title>Add Skill Details</title>
</head>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
  * {
  margin: 0px;
  padding: 0px;
}
body {
  font-size: 120%;
  background: #F8F8FF;
}

.header {
  width: 30%;
  margin: 50px auto 0px;
  color: white;
  background: #5F9EA0;
  text-align: center;
  border: 1px solid #B0C4DE;
  border-bottom: none;
  border-radius: 10px 10px 0px 0px;
  padding: 20px;
}
form, .content {
  width: 30%;
  margin: 0px auto;
  padding: 20px;
  border: 1px solid #B0C4DE;
  background: white;
  border-radius: 0px 0px 10px 10px;
}
.input-group {
  margin: 10px 0px 10px 0px;
}
.input-group label {
  display: block;
  text-align: left;
  margin: 3px;
}
.input-group input {
  height: 30px;
  width: 93%;
  padding: 5px 10px;
  font-size: 16px;
  border-radius: 5px;
  border: 1px solid gray;
}
.btn {
  padding: 10px;
  font-size: 15px;
  color: white;
  background: #5F9EA0;
  border: none;
  border-radius: 5px;
}
.error {
  width: 92%;
  margin: 0px auto;
  padding: 10px;
  border: 1px solid #a94442;
  color: #a94442;
  background: #f2dede;
  border-radius: 5px;
  text-align: left;
}
.success {
  color: #3c763d;
  background: #dff0d8;
  border: 1px solid #3c763d;
  margin-bottom: 20px;
}
  </style>
<body>
  	<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="index.php"><b>Hunt4Jobs</b></a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="index.php">Home</a></li>
      <li><a href="add.html">Add Personal Details</a></li>
      <li><a href="add_education.html">Add Education Details</a></li>
      <li><a href="add_experience.php">Add Experience Details</a></li>
      <li><a href="index.php?logout='1'" style="color: red; float: right">Logout</a></li>
    </ul>
  </div>
</nav>
  <form action="add_skill.php" method="post" text-align="center" name="form4">
     <div class="form-group">
        <div class ="input-group">
              <h4 style ="padding-left: 100px;"><b><center> Add Skills </center></b></h4>
    <?php
    include_once("config.php");

$result = mysqli_query($mysqli, "SELECT * FROM skillset");
foreach($result as $row)
{
  echo "<input type='checkbox' name='skillset[]' value='".$row['Skillset_ID']."'>";
  echo "<h6>";
  echo $row['Skill'];
  echo "</h6>";
  echo "<br><br>";
}

?>
</div>
    </div>

      <input type="submit" class="btn btn-info" name="submit_skill" value="Add">

  </form>
</body>
</html>

<?php
// session_start();
// $username = $_SESSION['username'];

//$user_id = mysqli_query($mysqli, "SELECT 'id' FROM user_login WHERE username = '$username' DESC 1");
$user_id = 6;
if(isset($_POST['submit_skill']))
{
  $all_skills = $_POST['skillset'];
  foreach ($all_skills as $skill)
 	{
    	$result = mysqli_query($mysqli, "INSERT INTO candidate_skillset(User_ID, Skillset_ID) VALUES('$user_id','$skill')");
	}
echo "<font color='green'>Data added successfully.";
echo "<br/><a href='javascript:self.history.back();'>Go Back</a>";
}
?>


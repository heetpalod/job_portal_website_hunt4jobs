<?php
// including the database connection file
include_once("config.php");

if(isset($_POST['update']))
{	

	$id = mysqli_real_escape_string($mysqli, $_POST['id']);
	
	$fname = mysqli_real_escape_string($mysqli, $_POST['fname']);
	$lname = mysqli_real_escape_string($mysqli, $_POST['lname']);
	$dob = mysqli_real_escape_string($mysqli, $_POST['dob']);
	$email = mysqli_real_escape_string($mysqli, $_POST['email']);	
	
	// checking empty fields
	if(empty($fname) || empty($lname) || empty($dob) || empty($email)) {	
			
		if(empty($fname)) {
			echo "<font color='red'>First Name field is empty.</font><br/>";
		}

		if(empty($lname)) {
			echo "<font color='red'>Last Name field is empty.</font><br/>";
		}
		
		if(empty($dob)) {
			echo "<font color='red'>Date of Birth field is empty.</font><br/>";
		}
		
		if(empty($email)) {
			echo "<font color='red'>Email field is empty.</font><br/>";
		}		
	} 

	function checkemail($str) {
	         return (!preg_match("/^([a-z0-9\+_\-]+)(\.[a-z0-9\+_\-]+)*@([a-z0-9\-]+\.)+[a-z]{2,6}$/ix", $str)) ? FALSE : TRUE;
	   }
	   if(!checkemail($email)){
	      echo "Invalid email address.";
	   }
	   
	else {	
		//updating the table
		$result = mysqli_query($mysqli, "UPDATE users SET first_name ='$fname', last_name = '$lname', date_of_birth = '$dob', email='$email' WHERE id=$id");
		
		//redirectig to the display page. In our case, it is index.php
		header("Location: index.php");
	}
}
?>
<?php
//getting id from url
$id = $_GET['id'];

//selecting data associated with this particular id
$result = mysqli_query($mysqli, "SELECT * FROM users WHERE id=$id");

while($res = mysqli_fetch_array($result))
{
	$fname = $res['first_name'];
	$lname = $res['last_name'];
	$dob = $res['date_of_birth'];
	$gender = $res['gender'];
	$email = $res['email'];
}
?>
<html>
<head>	
	<title>Edit Data</title>
</head>

<body>
	<a href="index.php">Home</a>
	<br/><br/>
	
	<form name="form1" method="post" action="edit.php">
		<table border="0">
			<tr> 
				<td>First Name</td>
				<td><input type="text" name="fname" value="<?php echo $fname;?>"></td>
			</tr>
			<tr> 
				<td>Last Name</td>
				<td><input type="text" name="lname" value="<?php echo $lname;?>"></td>
			</tr>
			<tr> 
				<td>Date of Birth</td>
				<td><input type="date" name="dob" value="<?php echo $dob;?>"></td>
			</tr>
			<tr> 
				<td>Email</td>
				<td><input type="text" name="email" value="<?php echo $email;?>"></td>
			</tr>
			<tr>
				<td><input type="hidden" name="id" value=<?php echo $_GET['id'];?>></td>
				<td><input type="submit" name="update" value="Update"></td>
			</tr>
		</table>
	</form>
</body>
</html>

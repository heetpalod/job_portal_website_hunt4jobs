<html>
<head>
	<title><h2>Add Data</h2></title>
</head>

<body>
<?php
//including the database connection file
include_once("config.php");

if(isset($_POST['Submit'])) {	
	$fname = mysqli_real_escape_string($mysqli, $_POST['fname']);
	$lname = mysqli_real_escape_string($mysqli, $_POST['lname']);
	$dob = mysqli_real_escape_string($mysqli, $_POST['dob']);
	$gender = mysqli_real_escape_string($mysqli, $_POST['gender']);
	$email = mysqli_real_escape_string($mysqli, $_POST['email']);
		
	// checking empty fields
	if(empty($fname) || empty($lname) || empty($dob) || empty($gender) || empty($email)) {
				
		if(empty($fname)) {
			echo "<font color='red'>First Name field is empty.</font><br/>";
		}
		
		if(empty($lname)) {
			echo "<font color='red'>Last Name field is empty.</font><br/>";
		}
		
		if(empty($dob)) {
			echo "<font color='red'>Date of Birth field is empty.</font><br/>";
		}

		if(empty($gender)) {
			echo "<font color='red'>Gender field is empty.</font><br/>";
		}

		if(empty($email)) {
			echo "<font color='red'>Email field is empty.</font><br/>";
		}
			  
		//link to the previous page
		echo "<br/><a href='javascript:self.history.back();'>Go Back</a>";
	} 

		function checkemail($str) {
	         return (!preg_match("/^([a-z0-9\+_\-]+)(\.[a-z0-9\+_\-]+)*@([a-z0-9\-]+\.)+[a-z]{2,6}$/ix", $str)) ? FALSE : TRUE;
	   }
	   if(!checkemail($email)){
	      echo "Invalid email address.";
	      echo "<br/><a href='javascript:self.history.back();'>Go Back</a>";
	   }
	else { 
		// if all the fields are filled (not empty) 
			
		//insert data to database	
		$result = mysqli_query($mysqli, "INSERT INTO users(first_name, last_name, date_of_birth, gender, email) VALUES('$fname','$lname','$dob','$gender','$email')");
		
		//display success message
		echo "<font color='green'>Data added successfully.";
		echo "<br/><a href='index.php'>View Result</a>";
	}
}
?>
</body>
</html>

<html>
<head>
	<title><h2>Add Personal Details</h2></title>
</head>

<body>
<?php
//including the database connection file
include_once("config.php");

if(isset($_POST['submit_education'])) {	
	$degree_name = mysqli_real_escape_string($mysqli, $_POST['degree_name']);
	$major_name = mysqli_real_escape_string($mysqli, $_POST['major_name']);
	$university_name = mysqli_real_escape_string($mysqli, $_POST['university_name']);
	$grad_date = mysqli_real_escape_string($mysqli, $_POST['grad_date']);
	$cgpa = mysqli_real_escape_string($mysqli, $_POST['cgpa']);
		
	// checking empty fields
	if(empty($degree_name) || empty($major_name) || empty($university_name) || empty($grad_date) || empty($cgpa)) {
				
		if(empty($degree_name)) {
			echo "<font color='red'>Degree Name field is empty.</font><br/>";
		}
		
		if(empty($major_name)) {
			echo "<font color='red'>Major Name field is empty.</font><br/>";
		}
		
		if(empty($university_name)) {
			echo "<font color='red'>University Name field is empty.</font><br/>";
		}

		if(empty($grad_date)) {
			echo "<font color='red'>Graduation Date field is empty.</font><br/>";
		}

		if(empty($cgpa)) {
			echo "<font color='red'>CGPA field is empty.</font><br/>";
		}
			  
		//link to the previous page
		echo "<br/><a href='javascript:self.history.back();'>Go Back</a>";
	} 

	else { 
		// if all the fields are filled (not empty) 
		
		//insert data to database	
		$result = mysqli_query($mysqli, "INSERT INTO candidate_education(Degree, Major, University, Graduation_Date, CGPA) VALUES('$degree_name', '$major_name','$university_name','$grad_date','$cgpa')");
		
		//display success message

		echo "<font color='green'>Data added successfully.";
		//echo "<br/><a href='index.php'>View Result</a>";
	}
}
?>
</body>
</html>

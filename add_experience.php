<html>
<head>
	<title><h2>Add Personal Details</h2></title>
</head>

<body>
<?php
//including the database connection file
include_once("config.php");

if(isset($_POST['submit_experience'])) {	
	$emp_name = mysqli_real_escape_string($mysqli, $_POST['employer_name']);
	$job_title = mysqli_real_escape_string($mysqli, $_POST['job_title']);
	$location_city = mysqli_real_escape_string($mysqli, $_POST['location_name']);
	$start_date = mysqli_real_escape_string($mysqli, $_POST['start_date']);
	$end_date = mysqli_real_escape_string($mysqli, $_POST['end_date']);
	$description = mysqli_real_escape_string($mysqli, $_POST['desc']);
		
	// checking empty fields
	if(empty($emp_name) || empty($job_title) || empty($location_city) || empty($start_date)) {
				
		if(empty($emp_name)) {
			echo "<font color='red'>Employer Name field is empty.</font><br/>";
		}

		if(empty($job_title)) {
			echo "<font color='red'>Job Title field is empty.</font><br/>";
		}
		
		if(empty($location_city)) {
			echo "<font color='red'>City Name field is empty.</font><br/>";
		}
		
		if(empty($start_date)) {
			echo "<font color='red'>Start Date field is empty.</font><br/>";
		}
		//link to the previous page
		echo "<br/><a href='javascript:self.history.back();'>Go Back</a>";
	} 

	else { 
		// if all the fields are filled (not empty) 
		
		//insert data to database	
		$result = mysqli_query($mysqli, "INSERT INTO candidate_experience(Employer, Job_Title, Location, Start_Date, End_Date, Description) VALUES('$emp_name', '$job_title', '$location_city', '$start_date', '$end_date', '$description')");
		
		//display success message

		echo "<font color='green'>Data added successfully.";
		echo "<br/><a href='javascript:self.history.back();'>Go Back</a>";
		//echo "<br/><a href='index.php'>View Result</a>";
	}
}
?>
</body>
</html>

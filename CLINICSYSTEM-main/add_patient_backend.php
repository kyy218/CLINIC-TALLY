<?php
// Database connection
$servername = "localhost";
$username = "root";
$password = ""; 
$database = "clinic";

$connection = new mysqli($servername, $username, $password, $database);

if ($connection->connect_error) {
    die("Connection failed: " . $connection->connect_error);
}

$last_name = $connection->real_escape_string($_POST['LastName']);
$first_name = $connection->real_escape_string($_POST['FirstName']);
$middle_initial = $connection->real_escape_string($_POST['MiddleInitial']);
$sex = $connection->real_escape_string($_POST['Sex']);
$age = intval($_POST['age']);
$civil_status = $connection->real_escape_string($_POST['civil_status']);
$address = $connection->real_escape_string($_POST['Address']);
$cellphone = $connection->real_escape_string($_POST['ContactNumber']);
$emergency_number = $connection->real_escape_string($_POST['emergency_number']);
$guardian = $connection->real_escape_string($_POST['guardian']);
$height = floatval($_POST['height']);
$weight = floatval($_POST['weight']);

// Ensure $specialcases is an array
$specialcases = isset($_POST['specialcases']) ? (array) $_POST['specialcases'] : [];

// Convert the special cases array into a comma-separated string
$specialcases_list = implode(', ', $specialcases);

// Insert patient into patients table with the special cases list
$sql = "INSERT INTO patients (LastName, FirstName, MiddleInitial, sex, age, civil_status, Address, ContactNumber, emergency_number, guardian, height, weight, specialcases)
        VALUES ('$last_name', '$first_name', '$middle_initial', '$sex', $age, '$civil_status', '$address', '$cellphone', '$emergency_number', '$guardian', $height, $weight, '$specialcases_list')";

if ($connection->query($sql) === TRUE) {
    // Get the patient_id of the newly added patient
    $patient_id = $connection->insert_id;

    // Loop through each selected special case and update tally
    foreach ($specialcases as $specialcase) {
        // Sanitize and escape special case name
        $specialcase = $connection->real_escape_string($specialcase);

        // Get the CaseID from specialcases table based on the CaseName
        $get_case_id_sql = "SELECT CaseID FROM specialcases WHERE CaseName = '$specialcase'";
        $result = $connection->query($get_case_id_sql);
        
        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            $case_id = $row['CaseID'];  // Correctly assigned to $case_id

            // Insert into patientsspecialcases table (linking patient with special case)
            $insert_specialcase_sql = "INSERT INTO patientspecialcases (PatientID, CaseID)
                                       VALUES ($patient_id, $case_id)";  // Use $patient_id and $case_id

            if (!$connection->query($insert_specialcase_sql)) {
                die("Error inserting into patientspecialcases: " . $connection->error);
            }

            // Update the tally in the special_cases_tally table
            $update_tally_sql = "UPDATE special_cases_tally SET tally = tally + 1 WHERE case_name = '$specialcase'";

            if (!$connection->query($update_tally_sql)) {
                die("Error updating tally: " . $connection->error);
            }
        } else {
            echo "No case found for '$specialcase'.<br>";
        }
    }

    echo "<script>alert('New patient added successfully!'); window.location.href='index.php';</script>";
} else {
    echo "Error: " . $sql . "<br>" . $connection->error;
}

$connection->close();
?>

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

// Fetch the special cases tally
$query = "SELECT * FROM special_cases_tally";
$result = $connection->query($query);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Special Case Tally Dashboard</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f7f9fc; /* Light grey background */
        }
        .sidebar {
            background-color: #aad8e6;
        }
        .panel {
            border-radius: 10px;
        }
        .panel-heading {
            background-color: #0066cc;
            color: white;
            padding: 15px;
            border-radius: 10px 10px 0 0;
            text-align: center;
        }
        .panel-body {
            padding: 20px;
        }
        .table th, .table td {
            text-align: center;
            padding: 12px;
        }
        .table {
            border-radius: 10px;
            overflow: hidden;
        }
        .btn-info {
            background-color: #20B2AA;
            border: none;
            color: white;
        }
        .btn-info:hover {
            background-color: #17a999;
        }
        .header {
            background-color: #20B2AA;
            color: white;
            padding: 20px;
            display: flex; /* Use flexbox for alignment */
            align-items: center; /* Center vertically */
            justify-content: flex-start;
            margin-bottom: 30px;
        }
        .logo {
            width: 70px;
            height: auto;
            margin-right: 15px;
        }
        .header h1 {
            display: inline-block;
            margin-left: 20px;
            font-size: 30px;
        }
        .panel .row {
            margin-top: 20px;
        }
        .panel-body .no-data {
            font-style: italic;
            color: #999;
        }
        /* Lighter table header */
        .table thead {
            background-color: #e3f2fd; /* Light blue header */
        }
        .table th {
            color: #0066cc; /* Darker text for readability */
        }
    </style>
</head>
<body>

<!-- Header Section with Logo -->
<div class="header d-flex align-items-center">
    <img src="images/UDMCLINIC_LOGO.png" alt="Logo" class="logo">
    <h1>UDM Clinic</h1>
</div>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-10">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4>Special Case Tally Dashboard</h4>
                </div>
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>Special Case</th>
                                    <th>Tally</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                // Check if there are any rows in the result
                                if ($result->num_rows > 0) {
                                    // Output data of each row
                                    while ($row = $result->fetch_assoc()) {
                                        echo "<tr>
                                            <td>" . $row['case_name'] . "</td>
                                            <td>" . $row['tally'] . "</td>
                                        </tr>";
                                    }
                                } else {
                                    echo "<tr><td colspan='2' class='no-data'>No special cases found.</td></tr>";
                                }
                                ?>
                            </tbody>
                        </table>
                    </div>
                    <a href="add_patient.php" class="btn btn-info btn-block">Add New Patient</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

</body>
</html>

<?php
$connection->close();
?>

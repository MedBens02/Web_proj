<?php


session_start();

if (!isset($_SESSION['logged']) || $_SESSION['role'] !== 'etudiant') {
    // Redirect them to login page or show an error
    header('Location: ../login.php');
    exit;
}

include_once('../../models/user.php');
// Add function to print his courses

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="icon" href="../assets/favicon.ico" type="image/x-icon">
    <title>Prof Dashboard</title>
    <link rel="stylesheet" href="dashboardEtudiant.css">
</head>
<body>
    <div class="container">
        <h1>Prof Dashboard</h1>
        <button class="disconnectBtn" onclick="location.href='../logout.php'">Se seconnecter</button>
        
        <div class="data-section">
            <h2>List des cours</h2>
        </div>
        
    </div>
</body>
</html>
<script type="text/javascript">

//Prints his courses
</script>
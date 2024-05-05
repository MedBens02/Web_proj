<?php


session_start();

if (!isset($_SESSION['logged']) || $_SESSION['role'] !== 'etudiant') {
    // Redirect them to login page or show an error
    header('Location: ../login.php');
    exit;
}



?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="icon" href="../assets/favicon.ico" type="image/x-icon">
    <title>Student Dashboard</title>
    <link rel="stylesheet" href="dashboardEtudiant.css">
</head>
<body>
    <div class="dash-title">
        <h1>Student's Dashboard</h1>
        <button class="disconnectBtn" onclick="location.href='../logout.php'">Se deconnecter</button>
    </div>
    <div class="side-nav">
        <img src="../pfp.png">
        <h2><?php echo $_SESSION['nom_complet']; ?></h2>
        <h4><?php echo $_SESSION['role']; ?></h4>
        <a href="dashboardEtudiant.php" id="dashboard-link">Dashboard</a>
        <a href="myCourses.php" id="manage-cours-link">See your Courses</a>
        <a href="settings.php" id="settings-link">Settings</a>
        <a href="profile.php" id="profile-link">Profile</a>
        <a href="../logout.php">Logout</a>
    </div>
    <div class="tables-cont">
        <div class="contn">
        <h2>List des cours</h2>
        <div id="std" class="table-wrapper"></div>
        </div>
    </div>
        
    <script src="../../scripts/dashboardEtudiant.js"></script>
</body>
<footer class="footer">
    Copyright © 2024 ENSA Tetouan.
</footer>
</html>
<script type="text/javascript">

//Prints his courses
</script>
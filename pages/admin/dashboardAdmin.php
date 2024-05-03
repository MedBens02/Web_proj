<?php


session_start();

if (!isset($_SESSION['logged']) || $_SESSION['role'] !== 'admin') {
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
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="dashboardAdmin.css">
</head>
<body>
    <div class="dash-title">
        <h1>Admin Dashboard</h1>
        <button class="disconnectBtn" onclick="location.href='../logout.php'">Se seconnecter</button>
    </div>

    <!-- Side Navigation Menu -->
    <div class="side-nav">
        <h1>TEST side nav</h1>
        <a href="dashboardAdmin.php">Dashboard</a>
        <a href="manageUsers.php">Manage Users</a>
        <a href="settings.php">Settings</a>
        <a href="help.php">Help</a>
        <a href="logout.php" onclick="location.href='../logout.php'">Logout</a>
    </div>
    
    <div class="tables-cont">
        <div class="contn">
        <h2>List des Étudiants</h2>
        <button class="buttonAdd" onclick="window.location.href='registerEtudiant.php';">Ajouter etudiant</button>
        <div id="students"></div>
        </div>
            
        <div class="contn">
            <h2>List des Professeurs</h2>
            <button class="buttonAdd" onclick="window.location.href='registerProf.php';">Ajouter Prof</button>
            <div id="profs"></div>
        </div>
    </div>
    
    
    <script src="../../scripts/dashboardAdmin.js"></script>
</body>
</html>

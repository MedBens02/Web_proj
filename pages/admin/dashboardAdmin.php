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
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="dashboardAdmin.css">
</head>
<body>
    <div class="container">
        <h1>Admin Dashboard</h1>
        <button class="disconnectBtn" onclick="location.href='../logout.php'">Se seconnecter</button>
        
        <div class="data-section">
            <h2>List des Étudiants</h2>
            <button class="buttonAdd" onclick="window.location.href='registerEtudiant.php';">Ajouter etudiant</button>
            <div id="students"></div>
        </div>
        
        <div class="data-section">
            <h2>List des Professeurs</h2>
            <button class="buttonAdd" onclick="window.location.href='registerProf.php';">Ajouter Prof</button>
            <div id="profs"></div>
        </div>

    </div>
    <script src="../../scripts/dashboardAdmin.js"></script>
</body>
</html>

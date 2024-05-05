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
        <div id="failed" class="error-alert" hidden></div>

    </div>
    <!-- Side Navigation Menu -->
    <div class="side-nav">
        <img src="../pfp.png">
        <h2><?php echo $_SESSION['nom_complet']; ?></h2>
        <h4><?php echo $_SESSION['role']; ?></h4>
        <a href="dashboardAdmin.php" id="dashboard-link">Dashboard</a>
        <a href="manageUsers.php" id="manage-users-link">Manage Users  <span id="notif" hidden>!</span></a>
        <a href="settings.php" id="settings-link">Settings</a>
        <a href="help.php" id="help-link">Help</a>
        <a href="../logout.php">Logout</a>
    </div>
    
    <div class="tables-cont">
        <div class="contn">
        <h2>List des Étudiants</h2>
        <button class="buttonAdd" onclick="window.location.href='registerEtudiant.php';">Ajouter etudiant</button>
        <div id="students" class="table-wrapper"></div>
        </div>
    </div>

            
    <div class="tables-two-cont">
        <div class="contn">
        <h2>List des Professeurs</h2>
        <button class="buttonAdd" onclick="window.location.href='registerProf.php';">Ajouter Prof</button>
        <div id="profs" class="table-wrapper"></div>
        </div>
    </div>
    
    
    
    <script src="../../scripts/dashboardAdmin.js"></script>
</body>

<footer class="footer">
    Copyright © 2024 ENSA Tetouan.
</footer>
</html>


<script type="text/javascript">
    // Get the current page URL
    const currentPageUrl = window.location.href;

    // Get the sidebar links
    const sidebarLinks = document.querySelectorAll('.side-nav a');

    // Loop through the sidebar links
    sidebarLinks.forEach(link => {
        // Check if the link href matches the current page URL
        if (link.href === currentPageUrl) {
            // Add a class to highlight the selected link
            link.classList.add('selected');
        }
    });
</script>
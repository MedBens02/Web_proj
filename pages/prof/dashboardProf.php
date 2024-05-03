<?php


session_start();

if (!isset($_SESSION['logged']) || $_SESSION['role'] !== 'prof') {
    // Redirect them to login page or show an error
    header('Location: ../login.php');
    exit;
}

include_once('../../models/user.php');
// Assuming authentication and user role checks are done
$etudiants = Prof::getAllEtudiants();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="icon" href="../assets/favicon.ico" type="image/x-icon">
    <title>Prof Dashboard</title>
    <link rel="stylesheet" href="dashboardProf.css">
</head>
<body>
    <div class="container">
        <h1>Prof Dashboard</h1>
        <button class="disconnectBtn" onclick="location.href='../logout.php'">Se seconnecter</button>
        
        <div class="data-section">
            <h2>List des Étudiants</h2>
            <div id="students"></div>
        </div>
    </div>
</body>
</html>
<script type="text/javascript">

document.addEventListener('DOMContentLoaded', function() {
    fetchStudents();
});

function fetchStudents() {
    fetch('../../controllers/fetchStudents.php')
    .then(response => response.json())
    .then(students => {
        const container = document.getElementById('students');
        let html = `<table>`;
        html += `<tr><th>ID</th><th>Nom</th><th>Prénom</th><th>Email</th><th>Adresse</th></tr>`;
        students.forEach(student => {
            html += `<tr>
                        <td>${student.id}</td>
                        <td>${student.nom}</td>
                        <td>${student.prenom}</td>
                        <td>${student.email}</td>
                        <td>${student.adresse}</td>
                     </tr>`;
        });
        html += `</table>`;
        container.innerHTML = html;
    });

function confirmDeleteStudent(stdId) {
    if (confirm('Are you sure you want to delete this student?')) {
        removeStudent(stdId);
    }
}

function removeStudent(stdId) {
    fetch('../../controllers/removeStudent.php', {
        method: 'POST',
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        body: `stdId=${stdId}`
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            // Refresh the students list
            fetchStudents();
        } else {
            alert('Failed to delete student.');
        }
    });
}
}
</script>
<?php


session_start();

if (!isset($_SESSION['logged']) || $_SESSION['role'] !== 'prof') {
    // Redirect them to login page or show an error
    header('Location: ../login.php');
    exit;
}

include_once('../../models/user.php');
include_once('../../models/cours.php');
// Assuming authentication and user role checks are done
$etudiants = Prof::getAllEtudiants();
$Courses = Cours::getAllCourses();
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
        <div class="data-section">
            <h2>List des cours</h2>
            <div id="cours"></div>
        </div>
    </div>
   
        <section class="login-container">
            <form id="courseForm" class="login-form" novalidate>
                <fieldset class="login-fieldset">
                    <legend class="form-title">Ajouter un cours</legend>

                    <div id="failed" class="error-alert" hidden></div>

                    <input type="hidden" id="userRole" value="">

                    

                    <div class="form-group">
                        <label for="nom">Nom:</label>
                        <input id="nom" type="text" name="nom" class="form-input" placeholder="nom du cours" required>
                        <small id="loginError" class="error-message" hidden></small>
                    </div>
                    <div class="form-group">
                        <label for="description">Desc:</label>
                        <input id="description" type="text" name="description" class="form-input" placeholder="description du cours" required>
                        <small id="loginError" class="error-message" hidden></small>
                    </div>

                    

                    <div class="form-group">
                        <button type="submit" class="submit-btn">Ajouter cours</button>
                    </div>
                    
                </fieldset>
            </form>
        </section>
    
    <div id="response"></div>
</body>
</html>
<script src="../../scripts/Cours.js" type="module"></script>
<script type="text/javascript">

document.addEventListener('DOMContentLoaded', function() {
    fetchStudents();
    fetchCourses();
});
function fetchCourses() {
    fetch('../../controllers/fetchAllcourses.php')
    .then(response => response.text()) // Get the response as text first to check it
    .then(text => {
        try {
            const cours = JSON.parse(text); // Try to parse text as JSON
            const container = document.getElementById('cours');
            let html = `<table>`;
            html += `<tr><th>ID</th><th>Cours</th><th>Description</th></tr>`;
            cours.forEach(course => {
                html += `<tr>
                            <td>${course.id}</td>
                            <td>${course.nom}</td>
                            <td>${course.description}</td>
                         </tr>`;
            });
            html += `</table>`;
            container.innerHTML = html;
        } catch (error) {
            console.error('Error parsing JSON:', error, 'Received text:', text);
        }
    })
    .catch(error => {
        console.error('Error fetching the courses:', error);
    });
}



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
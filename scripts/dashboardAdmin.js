
document.addEventListener('DOMContentLoaded', function() {
    fetchProfs();
    fetchStudents();
});

function fetchProfs() {
    fetch('../../controllers/fetchProfs.php')
    .then(response => response.json())
    .then(profs => {
        const container = document.getElementById('profs');
        let html = `<table>`;
        html += `<tr><th>ID</th><th>Nom</th><th>Prénom</th><th>Email</th><th>Adresse</th><th>Action</th></tr>`;
        profs.forEach(prof => {
            html += `<tr>
                        <td>${prof.id}</td>
                        <td>${prof.nom}</td>
                        <td>${prof.prenom}</td>
                        <td>${prof.email}</td>
                        <td>${prof.adresse}</td>
                        <td><button class='delete-btn' onclick='removeProf(${prof.id})'>Delete</button></td>
                     </tr>`;
        });
        html += `</table>`;
        container.innerHTML = html;
    });
}

function fetchStudents() {
    fetch('../../controllers/fetchStudents.php')
    .then(response => response.json())
    .then(students => {
        const container = document.getElementById('students');
        let html = `<table>`;
        html += `<tr><th>ID</th><th>Nom</th><th>Prénom</th><th>Email</th><th>Adresse</th><th>Action</th></tr>`;
        students.forEach(student => {
            html += `<tr>
                        <td>${student.id}</td>
                        <td>${student.nom}</td>
                        <td>${student.prenom}</td>
                        <td>${student.email}</td>
                        <td>${student.adresse}</td>
                        <td><button class='delete-btn' onclick='deleteStudent(${student.id})'>Delete</button></td>
                     </tr>`;
        });
        html += `</table>`;
        container.innerHTML = html;
    });
}


function removeProf(profId) {
    fetch('../../controllers/removeProf.php', {
        method: 'POST',
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        body: `profId=${profId}`
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            // Refresh the profs list
            fetchProfs();
        } else {
            alert('Failed to delete professor.');
        }
    });
}
document.addEventListener('DOMContentLoaded', function() {
    fetchCourses();
    fetchAllStudents();  // You might need to pass an initial courseId if applicable.

    document.getElementById('enrollButton').addEventListener('click', enrollStudents);
});

document.getElementById('cours').addEventListener('change', function() {
    fetchStudents(this.value);
});



function fetchAllStudents() {
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
}


function fetchCourses() {
    fetch('../../controllers/fetchAllCourses.php')
        .then(response => response.json())
        .then(data => {
            const select = document.getElementById('cours');
            select.innerHTML = data.map(course => `<option value="${course.id}">${course.nom}</option>`).join('');
        });
}
const errorMsg = document.getElementById('failed');
const successMsg = document.getElementById('success');

function fetchStudents(courseId) {
    // Clear previous messages
    errorMsg.hidden = true;
    successMsg.hidden = true;

    fetch(`../../controllers/fetchStudentsWithEnrollment.php?courseId=${courseId}`)
    .then(response => response.json())
    .then(data => {
        const container = document.getElementById('students');
        let html = `<table><tr><th></th><th>ID</th><th>Nom</th><th>Prénom</th><th>Email</th><th>Adresse</th></tr>`;
        data.forEach(student => {
            html += `<tr>
                        <td>${student.is_enrolled ? '' : `<input type="checkbox" name="student" value="${student.id}">`}</td>
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
}


function enrollStudents() {
    const selectedStudents = Array.from(document.querySelectorAll('input[name="student"]:checked')).map(input => input.value);
    const courseId = document.getElementById('cours').value;

    // Check if any students are selected
    if (selectedStudents.length === 0) {
        errorMsg.textContent = 'No students selected for enrollment.';
        errorMsg.hidden = false;
        return;  // Stop the function if no students are selected
    }

    fetch('../../controllers/enrollEtudiant.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ courseId: courseId, students: selectedStudents })
    })
    .then(response => response.text())
    .then(result => {
        if (result === "Success") {
            successMsg.textContent = "Etudiant ajoute avec succees";
            successMsg.hidden = false;
        }
    })
    .catch(error => console.error('Error:', error));
    fetchStudents(courseId);
}

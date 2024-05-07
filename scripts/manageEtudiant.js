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
    fetch(`../../controllers/fetchStudentsWithEnrollment.php?courseId=${courseId}`)
    .then(response => response.json())
    .then(data => {
        const container = document.getElementById('students');
        let html = `<table class="check-table"><tr><th>Action</th><th>ID</th><th>Nom</th><th>Prénom</th><th>Email</th><th>Adresse</th></tr>`;
        data.forEach(student => {
            let actionHtml = student.is_enrolled ?
                `<span class="remove-enrollment" data-student-id="${student.id}" title="Remove enrollment">×</span>` :
                `<input type="checkbox" name="student" value="${student.id}">`;

            html += `<tr>
                        <td>${actionHtml}</td>
                        <td>${student.id}</td>
                        <td>${student.nom}</td>
                        <td>${student.prenom}</td>
                        <td>${student.email}</td>
                        <td>${student.adresse}</td>
                     </tr>`;
        });
        html += `</table>`;
        container.innerHTML = html;

        // Add click event listeners for removing enrollment
        document.querySelectorAll('.remove-enrollment').forEach(item => {
            item.addEventListener('click', function() {
                removeEnrollment(courseId, this.getAttribute('data-student-id'));
            });
        });
    });
}



function enrollStudents() {
    const selectedStudents = Array.from(document.querySelectorAll('input[name="student"]:checked')).map(input => input.value);
    const courseId = document.getElementById('cours').value;
    errorMsg.hidden = true;
    successMsg.hidden = true;

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

function removeEnrollment(courseId, studentId) {
    fetch('../../controllers/removeEnrollment.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ courseId: courseId, studentId: studentId })
    })
    .then(response => response.json())
    .then(result => {
        if (result.success) {
            fetchStudents(courseId); // Refresh the list to reflect changes
            successMsg.textContent = "Etudiant enlove avec succees";
            successMsg.hidden = false;
        } else {
            errorMsg.textContent = "Erreur lors la supression de l'etudiant";
            errorMsg.hidden = false;
        }
    })
    .catch(error => console.error('Error:', error));
}

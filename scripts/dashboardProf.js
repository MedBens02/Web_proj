document.addEventListener('DOMContentLoaded', function() {
    fetchStudents();
    fetchCourses();
});


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
                        <td><button class='delete-btn' onclick='confirmDeleteStudent(${student.id})'>Delete</button></td>
                     </tr>`;
        });
        html += `</table>`;
        container.innerHTML = html;
    });
}


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
document.addEventListener('DOMContentLoaded', function() {
    fetchCourses();
});



function fetchCourses() {
    fetch('../../controllers/fetchMycours.php')
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

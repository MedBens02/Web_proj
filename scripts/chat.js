document.addEventListener('DOMContentLoaded', function() {
    fetchCourses();
});

document.getElementById('cours').addEventListener('change', function() {
    const selectedOption = this.options[this.selectedIndex];
    const profId = selectedOption.getAttribute('data-prof-id');
    fetchProfName(profId);
    loadChat(profId);
});


function fetchCourses() {
    const select = document.getElementById('cours');
    select.innerHTML += `<option value="" disabled selected>Cours</option>`;
    fetch('../../controllers/fetchMyCours.php')
        .then(response => response.json())
        .then(data => {
            select.innerHTML += data.map(course => `<option data-prof-id="${course.prof_id}" name="${course.prof_id}" value="${course.id}">${course.nom}</option>`).join('');

    });
}

function fetchProfName(profID) {
    const profName = document.getElementById('profName');
    const chatWith = document.getElementById('chatWith');
    fetch(`../../controllers/fetchProfName.php?profID=${profID}`)
    .then(response => response.json())
    .then(data => { profName.innerHTML = `${data.nom} ${data.prenom}`;
                    chatWith.innerHTML = `Chat avec: <span>${data.nom} ${data.prenom}</span>`; })
}

function loadChat(secondParty) {
	fetch(`../../controllers/fetchChat.php?secondParty=${secondParty}`)
	.then(response => response.json())
}

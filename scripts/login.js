import getXhr from "./XHR.js";

const form = document.getElementById("loginForm");

const login = document.getElementById("identifiant");
const mdp = document.getElementById("mdp");
const userType = document.getElementById("userType");

const loginError = document.getElementById("loginError");
const mdpError = document.getElementById("mdpError");

document.addEventListener("DOMContentLoaded", function() {
	userType.dispatchEvent(new Event('change'));
});

userType.addEventListener("change", () => {
	if (userType.value === "admin")
		login.placeholder = "Username";
	else
		login.placeholder = "Email";
});

login.addEventListener("blur", () => {
	if (login.value === "") {
		loginError.textContent = "Ce champs est obligatoire";
		loginError.hidden = false;
		console.log("No identifiant Error");
	}
});

mdp.addEventListener("blur", () => {
	if (mdp.value === "") {
		mdpError.textContent = "Ce champs est obligatoire";
		mdpError.hidden = false;
		console.log("No password Error");
	}
});

// Add input event listeners to hide error messages when the user starts typing
login.addEventListener("input", () => {
	if (login.value !== "") {
		loginError.textContent = ""; // Clear the error message
		loginError.hidden = true; // Hide the error message
	}
});

mdp.addEventListener("input", () => {
	if (mdp.value !== "") {
		mdpError.textContent = ""; // Clear the error message
		mdpError.hidden = true; // Hide the error message
	}
});



form.addEventListener("submit", function(event) {
    event.preventDefault();  // Prevent the default form submission
    console.log("Handling form submission via JavaScript");

    let isValid = form.checkValidity();
    if (isValid)
        sendXHR();
    else
        displayError("Please fill out all fields correctly.");
});

function sendXHR() {
	const xhr = getXhr();       //get the xhr response using 
	xhr.open(
		/* Method:       */ "POST",
		/* target URL :  */ "../controllers/LoginController.php",
		/* Async flag :  */ true
	);
	xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            const res = xhr.responseText;
            console.log(res);
            handleResponse(res);
        }
    };
    xhr.send(new FormData(form));
}

function handleResponse(response) {
	const errorMsg = document.getElementById("failed");
	if (response == "okAdmin") {
		//Redirection page Admin
		console.log("Admin found");
		errorMsg.textContent =
		  "";
		errorMsg.hidden = true;
		//window.location.href = "./pages/admin/dashboard.php";
	}
	else if (response == "okEtudiant") {
		//Redirection page Etudiant
		console.log("Etudiant found");
		errorMsg.textContent =
		  "";
		errorMsg.hidden = true;
		//window.location.href = "./views/etudiant/welcome.php";
	}
	else if (response == "okProf") {
		//Redirection page Prof
		console.log("Prof found");
		errorMsg.textContent =
		  "";
		errorMsg.hidden = true;
		window.location.href = './prof/dashboardProf.php';
	}
	else if (response === "error") {
		//Mot de passe incorrect
		errorMsg.textContent =
		  "identifiant ou mot de passe incorrect";
		errorMsg.hidden = false;
	}
	else {
		console.log(response);
	}
}

function displayError(message) {
    const errorMsg = document.getElementById("failed");
    errorMsg.textContent = message;
    errorMsg.hidden = false;
}

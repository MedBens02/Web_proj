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
  if (userType.value === "admin") {
    login.placeholder = "Username";
  } else {
    login.placeholder = "Email";
  }
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


form.addEventListener("submit", logUser);

function logUser(event) {   //event: the event the function is called with
  const errorMsg = document.getElementById("failed");
  event.preventDefault();   //Prevent the default request method
  let xhr = getXhr();       //get the xhr response using 
  xhr.open(
    /* Method:       */ "POST",
    /* target URL :  */ "../controllers/LoginController.php",
    /* Async flag :  */ true
  );
  xhr.addEventListener("readystatechange", function () {
    if (xhr.readyState == 4 && xhr.status == 200) {
      let res = xhr.responseText;
      console.log(res);
      if (res == "okAdmin") {
        //Redirection page Admin
        console.log("Admin found");
        errorMsg.textContent =
          "";
        errorMsg.hidden = true;
        //window.location.href = "./pages/admin/dashboard.php";
      } else if (res == "okEtudiant") {
        //Redirection page Etudiant
        console.log("Etudiant found");
        errorMsg.textContent =
          "";
        errorMsg.hidden = true;
        //window.location.href = "./views/etudiant/welcome.php";
      } else if (res == "okProf") {
        //Redirection page Prof
        console.log("Prof found");
        errorMsg.textContent =
          "";
        errorMsg.hidden = true;
        window.location.href = './prof/dashboardProf.php';
      } else if (res === "error") {
        //login incorrect
        if (userType.value === "admin") {
          errorMsg.textContent = "Username incorrect";
        }
        else {
          errorMsg.textContent = "Email incorrect";
        }
        errorMsg.hidden = false;
      } else if (res === "errorMdp") {
        //Mot de passe incorrect
        errorMsg.textContent =
          "mot de passe incorrect";
        errorMsg.hidden = false;
      } else {
        console.log(res);
      }

    }
  });

  let data = new FormData(form);
  xhr.send(data);
}


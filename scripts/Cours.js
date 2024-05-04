import getXhr from "./XHR.js";
let test = document.getElementById("response");
const form = document.getElementById("courseForm");

form.addEventListener("submit", function(event){
event.preventDefault();
sendXHR();


});

function sendXHR() {
	const xhr = getXhr();      
	xhr.open("POST", "/proj/controllers/CourseController.php", true);

    
    const formData = new FormData(form);
	xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            const res = xhr.responseText;
            console.log(res);
            handleResponse(res);
        }
    };
    xhr.send(formData);
}
function handleResponse(response) {
    const cleanResponse = response.trim().toLowerCase();  
   

    if (cleanResponse === "ok") {
        test.innerHTML = "cours ajouté";
    } else if (cleanResponse === "already exist") {
        test.innerHTML = "cours déjà existant";
    } else {
        test.innerHTML = "Erreur inattendue: " + cleanResponse; 
    }
}


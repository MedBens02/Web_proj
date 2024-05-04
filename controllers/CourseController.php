<?php


require_once('../models/cours.php');
$nom = isset($_POST['nom']) ? $_POST['nom'] : NULL;
$description = isset($_POST['description']) ? $_POST['description'] : NULL;
$data = array(
    'nom' =>  $nom,
    'description' =>  $description
);
if (Cours::check($nom)) {
    echo "already exist";
    return;
}
$res = Cours::ajouterCours($data);
if ($res === "ok") {
    echo "ok";
} else {
    echo "erreur";
}

<?php

session_start();

if (!isset($_SESSION['logged']) || $_SESSION['role'] !== 'prof') {
    echo json_encode(['error' => 'Unauthorized']);
    exit;
}

require_once('../models/cours.php');

$nom = isset($_POST['nom']) ? $_POST['nom'] : NULL;
$description = isset($_POST['description']) ? $_POST['description'] : NULL;
$prfid = isset($_POST['id_prf']) ? $_POST['id_prf'] : NULL;
$data = array(
    'nom' =>  $nom,
    'description' =>  $description,
    'prfid' => $prfid
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

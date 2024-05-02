<?php
session_start();

require_once('../models/LoginAdmin.php');
require_once('../models/user.php');

    $login = isset($_POST['identifiant']) ? $_POST['identifiant'] : NULL;
    $mdp = isset($_POST['mdp']) ? $_POST['mdp'] : NULL;
    $role = isset($_POST['userType']) ? $_POST['userType'] : NULL;

    if ($role === "admin") {
        $admin = LoginAdmin::logAdmin($login);
        if($admin != false){
            if($mdp == $admin->mot_de_passe){
                $_SESSION['logged'] = true;
                $_SESSION['login'] = $admin->login;
                $_SESSION['nom'] = $admin->nom;
                $_SESSION['prenom'] = $admin->prenom;
                $_SESSION['nom_complet'] = $admin->nom." ".$admin->prenom;
                echo 'okAdmin';
            }else{
                echo 'errorMdp';
            }
        }else{
            echo 'error';
        }
      
    } else if ($role === "etudiant") {
        $etd = Etudiant::loginUser($login);
        if($etd !== false) {
            if($mdp == $etd->mot_de_passe) {
                $_SESSION['logged'] = true;
                $_SESSION['id_etd'] = $etd->id;
                $_SESSION['email'] = $etd->email;
                $_SESSION['nom'] = $etd->nom;
                $_SESSION['prenom'] = $etd->prenom;
                $_SESSION['mdp'] = $etd->mot_de_passe;
                $_SESSION['adresse'] = $etd->adresse;
                $_SESSION['nom_complet'] = $etd->nom." ".$etd->prenom;
                echo 'okEtudiant';
            } else {
                    echo 'errorMdp';
              }
        } else {
            echo 'error';
         }
    } else if ($role === "prof") {
        $prf = Prof::loginUser($login);
        if($prf !== false) {
            if($mdp == $prf->mot_de_passe) {
                $_SESSION['logged'] = true;
                $_SESSION['id_prf'] = $prf->id;
                $_SESSION['email'] = $prf->email;
                $_SESSION['nom'] = $prf->nom;
                $_SESSION['prenom'] = $prf->prenom;
                $_SESSION['mdp'] = $prf->mot_de_passe;
                $_SESSION['adresse'] = $prf->adresse;
                $_SESSION['nom_complet'] = $prf->nom." ".$prf->prenom;
                echo 'okProf';
            } else {
                    echo 'errorMdp';
              }
        } else {
            echo 'error';
         }
    } else {
        echo "role non reconnue";
    }
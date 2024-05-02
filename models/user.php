<?php
include_once($_SERVER['DOCUMENT_ROOT'] . '/proj/database/DB.php');

class User {

    protected $nom;
    protected $prenom;
    protected $email;
    protected $adresse;
    protected $mot_de_passe;

	public static function loginUser($email) {
        $stmt = DB::connect()->prepare('SELECT * FROM ' . static::$tableName . ' WHERE email = ?');
        $stmt->execute([$email]);
        $user = $stmt->fetch(PDO::FETCH_OBJ);
        return $user;
        $stmt->close();
        $stmt = null; // Closing connection
    }

    public static function checkEmailExists($email) {
        $stmt = DB::connect()->prepare('SELECT COUNT(*) FROM ' . static::$tableName . ' WHERE email = ?');
        $stmt->execute([$email]);
        $count = $stmt->fetchColumn();
        $stmt = null; // Closing connection
        return $count > 0;
    }

	public static function addUser($data) {
        $stmt = DB::connect()->prepare('INSERT INTO ' . static::$tableName . ' (nom, prenom, adresse, email, mot_de_passe) VALUES (:nom, :prenom, :adresse, :email, :mot_de_passe)');
        foreach ($data as $key => $value) {
            $stmt->bindParam(':'.$key, $data[$key]);
        }
        
        if ($stmt->execute()) {
            return 'ok';
        } else {
            return 'error';
        }
        $stmt->close();
        $stmt = null;
    }
}

class Etudiant extends User {
    protected static $tableName = 'etudiant';

    // Additional methods specific to Etudiant can be added here
}

class Prof extends User {
    protected static $tableName = 'professeurs';

    public static function getAllEtudiants() {
        $stmt = DB::connect()->prepare('SELECT * FROM etudiant');
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_OBJ);  // Fetch all students as objects
    }

    // Additional methods specific to Prof can be added here
}



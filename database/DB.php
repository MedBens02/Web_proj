<?php
class DB{
    static public function connect(){
        $pdo = new PDO('mysql:host=localhost;dbname=gestion_platforme_scolaire', 'root', '');
        $pdo->exec("set names utf8");
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        return $pdo;
    }
}
?>
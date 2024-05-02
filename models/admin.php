<?php


require_once("../database/DB.php");


    class Admin {

        static public function loginAdmin($login){
            $stmt = DB::connect()->prepare('SELECT * FROM admin WHERE login = ?');
            $stmt->execute([$login]);
            $user = $stmt->fetch(PDO::FETCH_OBJ);  //returns an object with each column as attribute and value.
            return $user; //object from table
            $stmt->close();
            $stmt = null;
        }

    }
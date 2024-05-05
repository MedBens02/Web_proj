<?php

require_once("../database/DB.php");
class stdCourses
{

    static public function getCourses($id)
    {
        $stmt = DB::connect()->prepare(
            'SELECT m.id, m.nom, m.description
        FROM modules m
        JOIN etudiant_modules em ON m.id = em.module_id
        WHERE em.etudiant_id = ?'
        );
        $stmt->execute([$id]);
        $courses = $stmt->fetchAll(PDO::FETCH_OBJ); //returns an object with each column as attribute and value.
       
        return $courses; 
    }
}

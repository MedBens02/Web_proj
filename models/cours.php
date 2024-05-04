<?php
include_once($_SERVER['DOCUMENT_ROOT'] . '/proj/database/DB.php');

class Cours {

    
  
    public static function check($login){
        $conn = DB::connect();
        $stmt = $conn->prepare('SELECT * FROM modules WHERE nom = ?');
        $stmt->execute([$login]);
        $count = $stmt->rowCount();
        $stmt = null; 
        return $count > 0;
        
    }
	public static function ajouterCours($data) {
        $conn = DB::connect();
        $stmt = $conn->prepare('INSERT INTO modules (nom, description) VALUES (:nom, :description)');
    
       
            $stmt->bindParam(':nom', $data['nom']);
            $stmt->bindParam(':description', $data['description']);
            if ($stmt->execute()) {
                return 'ok';
            } else {
                return 'error';
            }
        } 
        static public function getAllCourses() {
            $stmt = DB::connect()->prepare('SELECT * FROM modules');
            $stmt->execute();
            return $stmt->fetchAll(PDO::FETCH_OBJ);
        }
    
    
}
?>



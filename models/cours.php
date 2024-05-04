<?php
include_once($_SERVER['DOCUMENT_ROOT'] . '/proj/database/DB.php');

class Cours {

    
  
    public static function check($login, $prfid){
        $conn = DB::connect();
        $stmt = $conn->prepare('SELECT * FROM modules WHERE nom = :nom AND prof_id = :id');
        $stmt->bindParam(':nom', $login);
        $stmt->bindParam(':id', $prfid);
        $stmt->execute();
        $count = $stmt->rowCount();
        $stmt = null; 
        return $count > 0;
        
    }
	public static function ajouterCours($data) {
        $conn = DB::connect();
        $stmt = $conn->prepare('INSERT INTO modules (nom, description, prof_id) VALUES (:nom, :description, :id)');
    
       
            $stmt->bindParam(':nom', $data['nom']);
            $stmt->bindParam(':description', $data['description']);
            $stmt->bindParam(':id', $data['prfid']);
            if ($stmt->execute()) {
                return 'ok';
            } else {
                return 'error';
            }
        } 
    static public function getAllCourses($prfid) {
        $stmt = DB::connect()->prepare('SELECT * FROM modules WHERE prof_id = ?');
        $stmt->execute([$prfid]);
        return $stmt->fetchAll(PDO::FETCH_OBJ);
    }

    static public function removeCours($crsId) {
        $stmt = DB::connect()->prepare('DELETE FROM modules WHERE id = :id');
        $stmt->bindParam(':id', $crsId);
        return $stmt->execute();
    }
    
    
}
?>



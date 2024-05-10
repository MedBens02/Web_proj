<?php
include_once($_SERVER['DOCUMENT_ROOT'] . '/proj/database/DB.php');

class Chat {
	public static function getMsgs($secondParty, $firstParty) {
		$db = DB::connect();
        $sql = "SELECT * FROM prof_to_etd WHERE
        (recepient_id = :first AND sender_id = :second)
        OR (recepient_id = :second AND sender_id = :first)
        ORDER BY time_stamp DESC";

        $stmt = $db->prepare($sql);
        $stmt->bindParam(':first', $firstParty, PDO::PARAM_INT);
        $stmt->bindParam(':second', $secondParty, PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);	
	}
}
?>
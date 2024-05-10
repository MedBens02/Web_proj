<?php
session_start();
require_once("../database/DB.php");
require_once("../models/chat.php");

// Check if the user is logged in and is a prof
if (!isset($_SESSION['logged']) || ($_SESSION['role'] !== 'prof' && $_SESSION['role'] !== 'etudiant')) {
    http_response_code(403);
    echo json_encode(['error' => 'Unauthorized access']);
    exit;
}

$secondParty = isset($_GET['secondParty']) ? intval($_GET['secondParty']) : 0;

$userType = $_SESSION['role'];


try {
	$chat = Chat::getMsgs($secondParty, $firstParty);
    echo json_encode($chat);
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(['error' => 'Server error while fetching students']);
}

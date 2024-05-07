<?php
session_start();
require_once('../models/Cours.php');

if (!isset($_SESSION['logged']) || $_SESSION['role'] !== 'prof') {
    http_response_code(403);
    echo json_encode(['error' => 'Unauthorized access']);
    exit;
}

$courseId = isset($_GET['courseId']) ? intval($_GET['courseId']) : 0;

if (!$courseId) {
    echo json_encode(['error' => 'No course ID provided']);
    exit;
}

try {
    $parts = Cours::getPartsByCourseId($courseId);
    echo json_encode($parts);
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(['error' => $e->getMessage()]);
}

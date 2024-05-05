<?php
session_start();
require_once("../database/DB.php");
require_once("../models/cours-module.php");

if (!isset($_SESSION['logged']) || $_SESSION['role'] !== 'etudiant') {
    http_response_code(403);
    echo json_encode(['error' => 'Unauthorized access']);
    exit;
}
try {
    $stdCourses = stdCourses::getCourses($_SESSION['id_etd']);
    echo json_encode($stdCourses);
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(['error' => 'Server error while fetching courses']);
}


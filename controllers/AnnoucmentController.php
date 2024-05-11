<?php
session_start();
require_once "./models/chat.php";

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(400);
    echo json_encode(['error' => 'Request method not allowed']);
    exit;
}

if (!isset($_SESSION["logged"])) {
    http_response_code(401);
    echo json_encode(['error' => 'UnAuthenticated']);
    exit;
}

$userRole = $_SESSION['role'];

if (!in_array($userRole, ["prof", "etudiant"])) {
    http_response_code(403);
    echo json_encode(['error' => 'Unauthorized access']);
    exit;
}


try {
    $data =  json_decode(file_get_contents("php://input"), true);

    $firstParty;
    switch ($userRole) {
        case "prof":
            $firstParty = $_SESSION["id_prf"];
            break;
        case "etudiant":
            $firstParty = $_SESSION["id_etd"];
            break;
    }

    if(Chat::SendMessage($firstParty, -1, $data["message"])){
        http_response_code(201);
        exit;
    }else{
        http_response_code(500);
        echo json_encode(['error' => "Oops. smthg went wrong", 'details' => $ex]);
        exit;
    };
} catch (Exception $ex) {
    http_response_code(500);
    echo json_encode(['error' => "internal Server error", 'details' => $ex]);
    exit;
}

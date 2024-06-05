<?php
// En-têtes CORS
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

session_start();

// Supposons que l'ID utilisateur soit stocké dans la session
if (isset($_SESSION['user_id'])) {
    $user_id = $_SESSION['user_id'];
    
    if ($user_id == 5) {    
        echo json_encode(['success' => true, 'userId' => 5]);
    } else {
        echo json_encode(['success' => false, 'message' => 'Accès refusé']);
    }
} else {
    echo json_encode(['success' => false, 'message' => 'Utilisateur non connecté']);
}
?>

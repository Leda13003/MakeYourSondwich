<?php
// En-têtes CORS
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

// Gérer les requêtes OPTIONS (prévol)
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(204);
    exit;
}

// Connexion à la base de données
$servername = "localhost";
$username = "root";
$password = ""; // Votre mot de passe MySQL
$dbname = "make_your_sandwich";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die(json_encode(["success" => false, "message" => "Connection failed: " . $conn->connect_error]));
}

$data = json_decode(file_get_contents("php://input"), true);

if (!isset($data['email']) || !isset($data['password'])) {
    die(json_encode(["success" => false, "message" => "Invalid input data"]));
}

$email = $data['email'];
$password = $data['password'];

$sql = "SELECT id, username, password FROM users WHERE email = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $email);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows === 0) {
    die(json_encode(["success" => false, "message" => "User not found"]));
}

$user = $result->fetch_assoc();

if (password_verify($password, $user['password'])) {
    echo json_encode(["success" => true, "message" => "Login successful", "user" => ["id" => $user['id'], "username" => $user['username']]]);
} else {
    echo json_encode(["success" => false, "message" => "Invalid password"]);
}

$stmt->close();
$conn->close();
?>

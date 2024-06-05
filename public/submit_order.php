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

if (!isset($data['sandwiches'])) {
    die(json_encode(["success" => false, "message" => "Invalid input data"]));
}

$user_id = 1; // Vous devez récupérer l'ID de l'utilisateur connecté d'une manière sécurisée
$order_id = null;

$conn->begin_transaction();

try {
    $sql = "INSERT INTO orders (user_id) VALUES (?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $user_id);
    $stmt->execute();
    $order_id = $stmt->insert_id;
    $stmt->close();

    foreach ($data['sandwiches'] as $sandwich) {
        $sql = "INSERT INTO sandwiches (order_id, base, base_price, cheese, cheese_price, drink, drink_price, dessert, dessert_price, total_price) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("issdssdsdd", $order_id, $sandwich['base'], $sandwich['basePrice'], $sandwich['cheese'], $sandwich['cheesePrice'], $sandwich['drink'], $sandwich['drinkPrice'], $sandwich['dessert'], $sandwich['dessertPrice'], $sandwich['total']);
        $stmt->execute();
        $sandwich_id = $stmt->insert_id;
        $stmt->close();

        foreach ($sandwich['proteins'] as $protein) {
            $sql = "INSERT INTO sandwich_proteins (sandwich_id, name, quantity, price) VALUES (?, ?, ?, ?)";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("isid", $sandwich_id, $protein['name'], $protein['quantity'], $protein['price']);
            $stmt->execute();
            $stmt->close();
        }

        foreach ($sandwich['veggies'] as $veggie) {
            $sql = "INSERT INTO sandwich_veggies (sandwich_id, name, price) VALUES (?, ?, ?)";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("isd", $sandwich_id, $veggie['name'], $veggie['price']);
            $stmt->execute();
            $stmt->close();
        }

        foreach ($sandwich['sauces'] as $sauce) {
            $sql = "INSERT INTO sandwich_sauces (sandwich_id, name, price) VALUES (?, ?, ?)";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("isd", $sandwich_id, $sauce['name'], $sauce['price']);
            $stmt->execute();
            $stmt->close();
        }

        foreach ($sandwich['extras'] as $extra) {
            $sql = "INSERT INTO sandwich_extras (sandwich_id, name, price) VALUES (?, ?, ?)";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("isd", $sandwich_id, $extra['name'], $extra['price']);
            $stmt->execute();
            $stmt->close();
        }
    }

    $conn->commit();
    echo json_encode(["success" => true, "message" => "Order submitted successfully"]);
} catch (Exception $e) {
    $conn->rollback();
    echo json_encode(["success" => false, "message" => "Error: " . $e->getMessage()]);
}

$conn->close();
?>

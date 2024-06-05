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

if (!isset($data['order_id'])) {
    die(json_encode(["success" => false, "message" => "Invalid input data"]));
}

$order_id = $data['order_id'];

$conn->begin_transaction();

try {
    // Copier la commande et les sandwichs vers les tables traitées
    $sql = "INSERT INTO processed_orders (user_id, created_at)
            SELECT user_id, created_at FROM orders WHERE id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $order_id);
    if (!$stmt->execute()) {
        throw new Exception("Erreur lors de l'insertion dans processed_orders: " . $stmt->error);
    }
    $processed_order_id = $stmt->insert_id;
    $stmt->close();

    $sql = "INSERT INTO processed_sandwiches (order_id, base, base_price, cheese, cheese_price, drink, drink_price, dessert, dessert_price, total_price)
            SELECT ?, base, base_price, cheese, cheese_price, drink, drink_price, dessert, dessert_price, total_price FROM sandwiches WHERE order_id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ii", $processed_order_id, $order_id);
    if (!$stmt->execute()) {
        throw new Exception("Erreur lors de l'insertion dans processed_sandwiches: " . $stmt->error);
    }
    $stmt->close();

    $sql = "INSERT INTO processed_sandwich_proteins (sandwich_id, name, quantity, price)
            SELECT ps.id, sp.name, sp.quantity, sp.price
            FROM sandwich_proteins sp
            JOIN sandwiches s ON sp.sandwich_id = s.id
            JOIN processed_sandwiches ps ON s.id = ps.id
            WHERE s.order_id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $order_id);
    if (!$stmt->execute()) {
        throw new Exception("Erreur lors de l'insertion dans processed_sandwich_proteins: " . $stmt->error);
    }
    $stmt->close();

    $sql = "INSERT INTO processed_sandwich_veggies (sandwich_id, name, price)
            SELECT ps.id, sv.name, sv.price
            FROM sandwich_veggies sv
            JOIN sandwiches s ON sv.sandwich_id = s.id
            JOIN processed_sandwiches ps ON s.id = ps.id
            WHERE s.order_id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $order_id);
    if (!$stmt->execute()) {
        throw new Exception("Erreur lors de l'insertion dans processed_sandwich_veggies: " . $stmt->error);
    }
    $stmt->close();

    $sql = "INSERT INTO processed_sandwich_sauces (sandwich_id, name, price)
            SELECT ps.id, ss.name, ss.price
            FROM sandwich_sauces ss
            JOIN sandwiches s ON ss.sandwich_id = s.id
            JOIN processed_sandwiches ps ON s.id = ps.id
            WHERE s.order_id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $order_id);
    if (!$stmt->execute()) {
        throw new Exception("Erreur lors de l'insertion dans processed_sandwich_sauces: " . $stmt->error);
    }
    $stmt->close();

    $sql = "INSERT INTO processed_sandwich_extras (sandwich_id, name, price)
            SELECT ps.id, se.name, se.price
            FROM sandwich_extras se
            JOIN sandwiches s ON se.sandwich_id = s.id
            JOIN processed_sandwiches ps ON s.id = ps.id
            WHERE s.order_id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $order_id);
    if (!$stmt->execute()) {
        throw new Exception("Erreur lors de l'insertion dans processed_sandwich_extras: " . $stmt->error);
    }
    $stmt->close();

    // Suppression des sandwichs liés à la commande des tables dépendantes
    $sql = "DELETE FROM sandwich_extras WHERE sandwich_id IN (SELECT id FROM sandwiches WHERE order_id = ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $order_id);
    if (!$stmt->execute()) {
        throw new Exception("Erreur lors de la suppression des sandwich_extras: " . $stmt->error);
    }
    $stmt->close();

    $sql = "DELETE FROM sandwich_sauces WHERE sandwich_id IN (SELECT id FROM sandwiches WHERE order_id = ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $order_id);
    if (!$stmt->execute()) {
        throw new Exception("Erreur lors de la suppression des sandwich_sauces: " . $stmt->error);
    }
    $stmt->close();

    $sql = "DELETE FROM sandwich_veggies WHERE sandwich_id IN (SELECT id FROM sandwiches WHERE order_id = ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $order_id);
    if (!$stmt->execute()) {
        throw new Exception("Erreur lors de la suppression des sandwich_veggies: " . $stmt->error);
    }
    $stmt->close();

    $sql = "DELETE FROM sandwich_proteins WHERE sandwich_id IN (SELECT id FROM sandwiches WHERE order_id = ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $order_id);
    if (!$stmt->execute()) {
        throw new Exception("Erreur lors de la suppression des sandwich_proteins: " . $stmt->error);
    }
    $stmt->close();

    // Suppression des sandwichs liés à la commande
    $sql = "DELETE FROM sandwiches WHERE order_id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $order_id);
    if (!$stmt->execute()) {
        throw new Exception("Erreur lors de la suppression des sandwichs: " . $stmt->error);
    }
    $stmt->close();

    // Suppression de la commande
    $sql = "DELETE FROM orders WHERE id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $order_id);
    if (!$stmt->execute()) {
        throw new Exception("Erreur lors de la suppression de la commande: " . $stmt->error);
    }
    $stmt->close();

    $conn->commit();
    echo json_encode(["success" => true, "message" => "Order deleted successfully"]);
} catch (Exception $e) {
    $conn->rollback();
    echo json_encode(["success" => false, "message" => "Error: " . $e->getMessage()]);
}

$conn->close();
?>

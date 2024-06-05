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

$sql = "SELECT o.id as order_id, u.username, o.created_at, s.id as sandwich_id, s.base, s.base_price, s.cheese, s.cheese_price, s.drink, s.drink_price, s.dessert, s.dessert_price, s.total_price
        FROM orders o
        JOIN users u ON o.user_id = u.id
        JOIN sandwiches s ON o.id = s.order_id";

$result = $conn->query($sql);

$orders = [];
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $order_id = $row['order_id'];
        if (!isset($orders[$order_id])) {
            $orders[$order_id] = [
                'order_id' => $order_id,
                'username' => $row['username'],
                'created_at' => $row['created_at'],
                'sandwiches' => []
            ];
        }
        $orders[$order_id]['sandwiches'][] = [
            'sandwich_id' => $row['sandwich_id'],
            'base' => $row['base'],
            'base_price' => (float) $row['base_price'],
            'cheese' => $row['cheese'],
            'cheese_price' => (float) $row['cheese_price'],
            'drink' => $row['drink'],
            'drink_price' => (float) $row['drink_price'],
            'dessert' => $row['dessert'],
            'dessert_price' => (float) $row['dessert_price'],
            'total_price' => (float) $row['total_price']
        ];
    }
}

echo json_encode(["success" => true, "orders" => array_values($orders)]);

$conn->close();
?>

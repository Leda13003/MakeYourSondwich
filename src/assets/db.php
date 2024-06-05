<?php
$host = 'Serveur: db5015903554.hosting-data.io';
$db = 'dbs12961883';
$user = 'dbu3067971';  // Remplacez par votre nom d'utilisateur MySQL
$pass = 'Adel2006?';      // Remplacez par votre mot de passe MySQL

try {
    $pdo = new PDO("mysql:host=$host;dbname=$db;charset=utf8", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Could not connect to the database $db :" . $e->getMessage());
}
?>

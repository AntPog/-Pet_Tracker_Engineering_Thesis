<?php
// Dane do połączenia z bazą danych
$host = 'http://127.0.0.1:80';
$dbname = 'intest';
$username = 'root';
$password = '';

// Połączenie z bazą danych
try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
} catch (PDOException $e) {
    die("Can't connect: " . $e->getMessage());
}

// Odbieranie danych POST
$input_data = json_decode(file_get_contents('php://input'), true);

// Sprawdzenie, czy dane zostały przesłane
if (isset($input_data['text'])) {
    $text = $input_data['text'];

    // Zapisanie danych do bazy danych
    $stmt = $pdo->prepare("INSERT INTO users (email) VALUES (:text)");
    $stmt->execute(array(':text' => $text));

    // Zwrócenie odpowiedzi JSON
    echo json_encode(array('success' => true, 'message' => 'Dane zostały pomyślnie zapisane do bazy danych.'));
} else {
    // Zwrócenie odpowiedzi JSON w przypadku braku danych
    echo json_encode(array('success' => false, 'message' => 'Nie przesłano żadnych danych.'));
}
?>

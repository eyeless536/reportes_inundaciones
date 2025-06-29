<?php
header('Content-Type: application/json; charset=utf-8');
// require_once 'conexion.php'; // Si tienes un archivo de conexión, úsalo aquí

// Conexión directa (ajusta si usas archivo de conexión)
$conn = new mysqli('localhost', 'root', '123456', 'clima_db');
if ($conn->connect_error) {
    http_response_code(500);
    echo json_encode(["error" => "Error de conexión a la base de datos"]);
    exit;
}

// Consulta JOIN para obtener latitud, longitud y nivel de riesgo de las alertas activas
$sql = "SELECT z.latitud, z.longitud, nr.descripcion AS nivel_riesgo
        FROM alerta a
        INNER JOIN zona z ON a.id_zona = z.id_zona
        INNER JOIN nivel_riesgo nr ON a.id_nivel_riesgo = nr.id_nivel_riesgo
        WHERE 1=1";
// Si quieres filtrar solo alertas "activas", agrega una columna de estado o fecha y ajusta el WHERE

$result = $conn->query($sql);
$alertas = [];
if ($result && $result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $alertas[] = [
            'latitud' => floatval($row['latitud']),
            'longitud' => floatval($row['longitud']),
            'nivel_riesgo' => $row['nivel_riesgo']
        ];
    }
}

$conn->close();
echo json_encode($alertas, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);

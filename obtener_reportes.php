<?php
header('Content-Type: application/json');

// Conexión a la base de datos (ajusta usuario/contraseña si es necesario)
$mysqli = new mysqli('localhost', 'root', '123456', 'clima_db');
if ($mysqli->connect_errno) {
    http_response_code(500);
    echo json_encode(['error' => 'Error de conexión a la base de datos']);
    exit;
}

// Consulta para obtener reportes con coordenadas y nivel de inundación
$sql = "
    SELECT 
        z.latitud, 
        z.longitud, 
        ni.descripcion AS nivel
    FROM reporte_usuario ru
    INNER JOIN zona z ON ru.id_zona = z.id_zona
    INNER JOIN nivel_inundacion ni ON ru.id_nivel_inundacion = ni.id_nivel_inundacion
";

$result = $mysqli->query($sql);

$reportes = [];
if ($result) {
    while ($row = $result->fetch_assoc()) {
        $reportes[] = [
            'latitud' => floatval($row['latitud']),
            'longitud' => floatval($row['longitud']),
            'nivel' => $row['nivel']
        ];
    }
}

echo json_encode($reportes);
$mysqli->close();
?>

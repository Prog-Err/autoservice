<?php
require 'CarService.php';

$carService = new CarService();

$data = json_decode(file_get_contents('php://input'), true);

$bodyType = $data['bodyType'] ?? 'all';
$search = $data['search'] ?? '';

$cars = $carService->getCarsByFilter($bodyType, $search);

header('Content-Type: application/json');
echo json_encode($cars);

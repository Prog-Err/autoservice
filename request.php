<?php
require 'CarService.php';

$carService = new CarService();


$carsBySept2010 = $carService->getCarsBySept2010();
$carsActive = $carService->getActiveCars();
$data[] = $carsBySept2010;
$data[] = $carsActive;
header('Content-Type: application/json');
echo json_encode($data, JSON_UNESCAPED_UNICODE);

<?php
require 'config.php';

class CarService
{
    private $pdo;

    public function __construct()
    {
        try {
            $this->pdo = new PDO('mysql:host=' . DB_HOST . ';dbname=' . DB_NAME, DB_USER, DB_PASS);
            $this->pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (PDOException $e) {
            die("Connection failed: " . $e->getMessage());
        }
    }

    public function getCarsBySept2010()
    {
        $sql = "SELECT cb.name AS brand, cm.name AS model, cm.end_date
                FROM car_models cm
                INNER JOIN car_brands cb ON cm.brand_id = cb.id
                WHERE cm.end_date <= '2010-09-30'";
        $stmt = $this->pdo->query($sql);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getActiveCars()
    {
        $sql = "SELECT cb.name AS brand, cm.name AS model, cs.service_name, cs.cost
                FROM car_models cm
                INNER JOIN car_brands cb ON cm.brand_id = cb.id
                INNER JOIN car_services cs ON cm.id = cs.model_id
                WHERE (cm.end_date IS NULL OR cm.end_date > CURDATE())
                AND cs.cost > 1000";
        $stmt = $this->pdo->query($sql);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    public function getCarsByFilter($bodyType = 'all', $search)
    {

        $sql = "SELECT 
                    CONCAT(cb.name, ' ', cm.name) AS title,
                    cm.image_url as image
                FROM car_models cm
                INNER JOIN car_brands cb ON cm.brand_id = cb.id
                WHERE 1=1";

        $params = [];

        if ($bodyType != 'all') {
            $sql .= " AND cm.body_type = :bodyType";
            $params[':bodyType'] = $bodyType;
        }

        if ($search) {
            $sql .= " AND CONCAT(cb.name, ' ', cm.name) LIKE :search";
            $params[':search'] = '%' . $search . '%';
        }

        $stmt = $this->pdo->prepare($sql);
        $stmt->execute($params);

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}

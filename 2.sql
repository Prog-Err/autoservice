SELECT 
    cb.name AS brand,
    cm.name AS model,
    sc.service_name,
    sc.cost
FROM 
    car_models cm
INNER JOIN 
    car_brands cb ON cm.brand_id = cb.id
INNER JOIN 
    car_servicessc ON cm.id = sc.model_id
WHERE 
    cm.end_date IS NULL OR cm.end_date > CURDATE()
    AND sc.cost > 1000;

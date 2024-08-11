SELECT 
    cb.name AS brand,
    cm.name AS model,
    cm.end_date
FROM 
    car_models cm
INNER JOIN 
    car_brands cb ON cm.brand_id = cb.id
WHERE 
    cm.end_date <= '2010-09-30';

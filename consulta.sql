SELECT 
    u.ciudad,
    i.tipo_uso,
    COUNT(c.id) AS cantidad_contratos,
    SUM(c.valor_mensual) AS valor_total_mensual
FROM contrato_arrendamiento c
JOIN inmueble i ON c.inmueble_id = i.id
JOIN ubicacion u ON i.id = u.inmueble_id
GROUP BY u.ciudad, i.tipo_uso;


SELECT  
    u.ciudad, 
    i.tipo_uso, 
    cl.nombre AS nombre_arrendador,
    cl.apellido AS apellido_arrendador
FROM contrato_arrendamiento c
JOIN inmueble i ON c.inmueble_id = i.id
JOIN ubicacion u ON i.id = u.inmueble_id
JOIN arrendadores a ON c.arrendador_id = a.cliente_id
JOIN cliente cl ON a.cliente_id = cl.id;
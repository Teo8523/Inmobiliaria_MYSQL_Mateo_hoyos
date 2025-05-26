-- Tipos de documento
INSERT INTO tipo_documento (nombre)
VALUES ('Cédula'), ('NIT'), ('Pasaporte');

-- Clientes naturales
INSERT INTO cliente (tipo_cliente, tipo_documento_id, numero_documento, nombre, apellido, direccion, telefono, email)
VALUES 
('natural', 1, '1234644242', 'Teofilo', 'Chayan', 'Cra 11#20-34', '3222484534', 'teofilo@gmail.com'), -- id = 1
('natural', 1, '1234556671', 'Melos', 'Pérez', 'Cra 11#20-35', '3222484522', 'melos@gmail.com');       -- id = 2

-- Clientes jurídicos
INSERT INTO cliente (tipo_cliente, tipo_documento_id, numero_documento, nombre, apellido, direccion, telefono, email)
VALUES 
('juridica', 2, '900123456', 'Innova', 'S.A.S.', 'Av. Principal #10-23', '3001234567', 'innova@empresa.com'), -- id = 3
('juridica', 2, '900123556', 'Constructora', 'Del Valle', 'Av. Secundaria #5-44', '3001234555', 'valle@empresa.com'); -- id = 4

-- Representantes legales de cada empresa
INSERT INTO representante_legal (id_representante, persona_juridica_id, nombre, apellido, tipo_documento_id, numero_documento, email, telefono)
VALUES 
(1, 3, 'Carlos', 'Gómez', 1, '11223344', 'carlos@innova.com', '3123456789'),
(2, 4, 'Lucía', 'Fernández', 1, '22334455', 'lucia@valle.com', '3112223344');

-- Relación cliente → arrendadores / arrendatarios
INSERT INTO arrendadores(cliente_id) VALUES (1); 
INSERT INTO arrendatarios(cliente_id) VALUES (2);
INSERT INTO arrendadores(cliente_id) VALUES (3);
INSERT INTO arrendatarios(cliente_id) VALUES (4); 

-- Inmueble
INSERT INTO inmueble (tipo_uso, tipo, metro_cuadrados, matricula_catastral, valor, descripcion)
VALUES ('comercial', 'local', 85.50, 'ABC1234567', 350000000.00, 'Local remodelado, excelente ubicación.');

-- Características del inmueble
INSERT INTO caracteristicas (inmueble_id, habitaciones, banos, jardin, garage)
VALUES (1, 0, 1, FALSE, FALSE);

-- Ubicación del inmueble
INSERT INTO ubicacion (inmueble_id, direccion, ciudad, provincia, codigo_postal)
VALUES (1, 'Carrera 45 #10-20', 'Bogotá', 'Cundinamarca', '110111');

-- Contrato de arrendamiento
INSERT INTO contrato_arrendamiento (
    inmueble_id, arrendador_id, arrendatario_id, fecha_inicio, fecha_fin,
    fecha_firma, valor_mensual, condiciones, archivo_contrato
)
VALUES (
    1, 1, 2, '2025-06-01', '2026-06-01',
    '2025-05-25', 2000000.00, 'Pago el primer día hábil de cada mes.',
    'https://ejemplo.com/contratos/contrato-local1.pdf'
);

-- Pago relacionado al contrato
INSERT INTO pagos (contrato_id, fecha_pago, monto, estado, metodo_pago, comprobante_pago)
VALUES (1, '2025-06-01', 2000000.00, 'pagado', 'Transferencia', 'https://ejemplo.com/comprobantes/pago-local1.pdf');

-- Cliente nuevo para el agente inmobiliario
INSERT INTO cliente (tipo_cliente, tipo_documento_id, numero_documento, nombre, apellido, direccion, telefono, email)
VALUES ('natural', 1, '9876543210', 'Laura', 'Ramírez', 'Calle 30 #15-10', '3109876543', 'laura@example.com'); -- id = 5

-- Registro como agente inmobiliario
INSERT INTO agente_inmobilaraio (cliente_id, porcentaje_comision_default)
VALUES (5, 40.00);

-- Comisión asignada al agente por el contrato anterior
INSERT INTO comisiones_agentes (agente_id, contrato_id, porcentaje_comision, valor_comision, fecha_asignacion)
VALUES (1, 1, 40.00, 800000.00, '2025-05-25');


INSERT INTO inmueble (tipo_uso, tipo, metro_cuadrados, matricula_catastral, valor, descripcion)
VALUES ('comercial', 'oficina', 150.00, 'MATOFI9876', 450000000.00, 'Oficina moderna con vista a la ciudad.');

INSERT INTO caracteristicas (inmueble_id, habitaciones, banos, jardin, garage)
VALUES (2, 2, 2, FALSE, TRUE);

INSERT INTO ubicacion (inmueble_id, direccion, ciudad, provincia, codigo_postal)
VALUES (2, 'Av. de las Torres #100-50', 'Bogotá', 'Cundinamarca', '110221');



-- Contrato para inmueble 2
INSERT INTO contrato_arrendamiento (
    inmueble_id, arrendador_id, arrendatario_id, fecha_inicio, fecha_fin,
    fecha_firma, valor_mensual, condiciones, archivo_contrato
)
VALUES (
    2, 3, 4, '2025-07-01', '2026-07-01',
    '2025-06-15', 3500000.00, 'Incluye mantenimiento mensual.',
    'https://ejemplo.com/contratos/contrato2.pdf'
);

-- Pago contrato 2
INSERT INTO pagos (contrato_id, fecha_pago, monto, estado, metodo_pago, comprobante_pago)
VALUES (2, '2025-07-01', 3500000.00, 'pagado', 'Consignación', 'https://ejemplo.com/comprobantes/pago2.pdf');

-- Comisión para contrato 2
INSERT INTO comisiones_agentes (agente_id, contrato_id, porcentaje_comision, valor_comision, fecha_asignacion)
VALUES (1, 2, 40.00, 1400000.00, '2025-06-15');



-- Inmueble 3 - Apartamento para estrenar
INSERT INTO inmueble (tipo_uso, tipo, metro_cuadrados, matricula_catastral, valor, descripcion)
VALUES ('residencial', 'apartamento', 90.00, 'MATAPT1234', 300000000.00, 'Apartamento para estrenar con balcón.');

INSERT INTO caracteristicas (inmueble_id, habitaciones, banos, jardin, garage)
VALUES (3, 3, 2, FALSE, TRUE);

INSERT INTO ubicacion (inmueble_id, direccion, ciudad, provincia, codigo_postal)
VALUES (3, 'Calle 100 #25-10', 'Medellín', 'Antioquia', '050022');

-- Contrato para inmueble 3
-- Arrendador: Laura (cliente_id 5), Arrendatario: Teofilo (cliente_id 1)
INSERT INTO contrato_arrendamiento (
    inmueble_id, arrendador_id, arrendatario_id, fecha_inicio, fecha_fin,
    fecha_firma, valor_mensual, condiciones, archivo_contrato
)
VALUES (
    3, 5, 1, '2025-08-01', '2026-08-01',
    '2025-07-20', 1800000.00, 'Incluye parqueadero y depósito.',
    'https://ejemplo.com/contratos/contrato3.pdf'
);

-- Pago contrato 3
INSERT INTO pagos (contrato_id, fecha_pago, monto, estado, metodo_pago, comprobante_pago)
VALUES (3, '2025-08-01', 1800000.00, 'pagado', 'Efectivo', 'https://ejemplo.com/comprobantes/pago3.pdf');

-- Comisión para contrato 3
INSERT INTO comisiones_agentes (agente_id, contrato_id, porcentaje_comision, valor_comision, fecha_asignacion)
VALUES (1, 3, 40.00, 720000.00, '2025-07-20');
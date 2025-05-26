create database Inmobilaria;


use Inmobilaria; 

CREATE TABLE tipo_documento (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) UNIQUE NOT NULL
);


CREATE TABLE cliente (
    id INT PRIMARY KEY AUTO_INCREMENT,
    tipo_cliente ENUM('natural','juridica'),
    tipo_documento_id INT,
    numero_documento VARCHAR(50) UNIQUE,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    direccion VARCHAR(255),
    telefono VARCHAR(50),
    email VARCHAR(100),
    imagen_documento TEXT,
    FOREIGN KEY (tipo_documento_id) REFERENCES tipo_documento(id)
);

CREATE TABLE persona_juridica (
    id INT PRIMARY KEY,
    razon_social VARCHAR(200),
    nombre_comercial VARCHAR(255),
    direccion VARCHAR(255),
    barrio VARCHAR(200),
    ciudad VARCHAR(200),
    email VARCHAR(100),
    telefono VARCHAR(200),
    FOREIGN KEY (id) REFERENCES cliente(id)
);

CREATE TABLE representante_legal (
    id_representante INT PRIMARY KEY,
    persona_juridica_id INT,
    nombre VARCHAR(200),
    apellido VARCHAR(200),
    tipo_documento_id INT,
    numero_documento VARCHAR(200),
    email VARCHAR(200),
    telefono VARCHAR(200),
    FOREIGN KEY (persona_juridica_id) REFERENCES persona_juridica(id),
    FOREIGN KEY (tipo_documento_id) REFERENCES tipo_documento(id)
);


CREATE TABLE arrendadores (
    cliente_id INT PRIMARY KEY,
    FOREIGN KEY (cliente_id) REFERENCES cliente(id)
);

CREATE TABLE arrendatarios (
    cliente_id INT PRIMARY KEY,
    FOREIGN KEY (cliente_id) REFERENCES cliente(id)
);


CREATE TABLE inmueble (
    id INT PRIMARY KEY AUTO_INCREMENT,
    tipo_uso ENUM('comercial', 'residencial', 'mixto') NOT NULL,
    tipo ENUM('vertical','horizontal'),
    metro_cuadrados DECIMAL(10,2),
    matricula_catastral VARCHAR(50) UNIQUE NOT NULL,
    valor DECIMAL(15,2),
    descripcion VARCHAR(255)
);

CREATE TABLE caracteristicas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    inmueble_id INT,
    habitaciones INT,
    banos INT,
    jardin BOOLEAN,
    garage BOOLEAN,
    FOREIGN KEY (inmueble_id) REFERENCES inmueble(id)
);



CREATE TABLE ubicacion (
    id INT PRIMARY KEY AUTO_INCREMENT,
    inmueble_id INT,
    direccion VARCHAR(255),
    ciudad VARCHAR(100),
    provincia VARCHAR(100),
    codigo_postal VARCHAR(20),
    FOREIGN KEY (inmueble_id) REFERENCES inmueble(id)
);


CREATE TABLE contrato_arrendamiento (
    id INT PRIMARY KEY AUTO_INCREMENT,
    inmueble_id INT NOT NULL,
    arrendador_id INT NOT NULL,
    arrendatario_id INT NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    fecha_firma DATE,
    valor_mensual DECIMAL(15,2),
    condiciones TEXT,
    estado ENUM('activo','finalizado','cancelado') DEFAULT 'activo',
    archivo_contrato TEXT,
    FOREIGN KEY (inmueble_id) REFERENCES inmueble(id),
    FOREIGN KEY (arrendador_id) REFERENCES arrendadores(cliente_id),
    FOREIGN KEY (arrendatario_id) REFERENCES arrendatarios(cliente_id)
);

CREATE TABLE pagos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    contrato_id INT NOT NULL,
    fecha_pago DATE,
    monto DECIMAL(15,2) NOT NULL,
    estado ENUM('pendiente','pagado','atrasado') DEFAULT 'pendiente',
    metodo_pago VARCHAR(100),
    comprobante_pago TEXT,
    FOREIGN KEY (contrato_id) REFERENCES contrato_arrendamiento(id)
);

CREATE TABLE agente_inmobilaraio (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT NOT NULL UNIQUE,
    porcentaje_comision_default DECIMAL(5,2) DEFAULT 40.00,
    FOREIGN KEY (cliente_id) REFERENCES cliente(id)
);

CREATE TABLE comisiones_agentes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    agente_id INT NOT NULL,
    contrato_id INT NOT NULL,
    porcentaje_comision DECIMAL(5,2),
    valor_comision DECIMAL(10,2),
    fecha_asignacion DATE,
    FOREIGN KEY (agente_id) REFERENCES agente_inmobilaraio(id),
    FOREIGN KEY (contrato_id) REFERENCES contrato_arrendamiento(id)
);




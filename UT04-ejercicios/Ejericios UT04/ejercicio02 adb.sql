CREATE DATABASE usuarios_db 
CHARACTER SET = utf8mb4 
COLLATE = utf8mb4_unicode_ci;

ALTER DATABASE usuarios_db 
CHARACTER SET = utf8mb4 
COLLATE = utf8mb4_general_ci;

USE usuarios_db;

CREATE TABLE usuarios (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE direcciones (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT UNSIGNED UNIQUE,
    direccion VARCHAR(255) NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

ALTER TABLE direcciones 
DROP PRIMARY KEY, 
ADD PRIMARY KEY (usuario_id);

ALTER TABLE usuarios 
MODIFY nombre VARCHAR(150) NOT NULL;

ALTER TABLE usuarios 
ADD COLUMN telefono VARCHAR(15) AFTER nombre;

ALTER TABLE usuarios 
MODIFY telefono BIGINT;

ALTER TABLE usuarios 
DROP COLUMN telefono;

INSERT INTO usuarios (nombre) 
VALUES ('Juan Pérez');

INSERT INTO direcciones (usuario_id, direccion) 
VALUES (1, 'Calle Mayor 123');

INSERT INTO usuarios (nombre) 
VALUES ('Ana Gómez'), ('Carlos Ruiz');

INSERT INTO direcciones (usuario_id, direccion) 
VALUES 
    (2, 'Calle Sol 45'), 
    (3, 'Avenida Libertad 78');

SELECT u.nombre, d.direccion 
FROM usuarios u 
JOIN direcciones d ON u.id = d.usuario_id;

SELECT u.nombre 
FROM usuarios u 
LEFT JOIN direcciones d ON u.id = d.usuario_id 
WHERE d.usuario_id IS NULL;

UPDATE direcciones 
SET direccion = 'Avenida Central 456' 
WHERE usuario_id = 1;

DELETE FROM direcciones 
WHERE usuario_id = 3;

DESCRIBE direcciones;

DROP TABLE direcciones, usuarios;

DROP DATABASE usuarios_db;
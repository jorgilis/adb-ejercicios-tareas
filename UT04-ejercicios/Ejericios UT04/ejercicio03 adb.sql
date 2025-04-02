CREATE DATABASE biblioteca CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

ALTER DATABASE biblioteca CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE biblioteca;

CREATE TABLE bibliotecas (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE libros (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    biblioteca_id INT UNSIGNED,
    titulo VARCHAR(255) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    anio_publicacion YEAR NOT NULL,
    FOREIGN KEY (biblioteca_id) REFERENCES bibliotecas(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ALTER TABLE libros ADD COLUMN genero VARCHAR(50);

ALTER TABLE bibliotecas MODIFY nombre VARCHAR(150) NOT NULL;

ALTER TABLE libros DROP COLUMN genero;

ALTER TABLE libros ADD COLUMN isbn VARCHAR(20) AFTER titulo;

ALTER TABLE libros MODIFY isbn CHAR(13);

INSERT INTO bibliotecas (nombre) VALUES ('Biblioteca Central');

INSERT INTO libros (biblioteca_id, titulo, autor, anio_publicacion, isbn)
VALUES (1, 'El Quijote', 'Miguel de Cervantes', 1605, '9781234567890');

INSERT INTO libros (biblioteca_id, titulo, autor, anio_publicacion, isbn)
VALUES (1, '1984', 'George Orwell', 1949, '9780451524935'),
       (1, 'Cien años de soledad', 'Gabriel García Márquez', 1967, '9780307350488');

SELECT libros.titulo, libros.autor, libros.anio_publicacion, bibliotecas.nombre AS biblioteca
FROM libros
JOIN bibliotecas ON libros.biblioteca_id = bibliotecas.id;

SELECT bibliotecas.nombre
FROM bibliotecas
LEFT JOIN libros ON bibliotecas.id = libros.biblioteca_id
WHERE libros.id IS NULL;

UPDATE libros SET anio_publicacion = 1950 WHERE titulo = '1984';

DELETE FROM libros WHERE id = 1;

DELETE FROM bibliotecas WHERE id = 1;

DESCRIBE libros;

DROP TABLE libros;
DROP TABLE bibliotecas;

DROP DATABASE biblioteca;
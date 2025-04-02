CREATE DATABASE cine CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER DATABASE cine CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE cine;

CREATE TABLE actores (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE peliculas (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    anio_estreno YEAR NOT NULL
);

CREATE TABLE actores_peliculas (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    actor_id INT UNSIGNED,
    pelicula_id INT UNSIGNED,
    personaje VARCHAR(100) NOT NULL,
    FOREIGN KEY (actor_id) REFERENCES actores(id),
    FOREIGN KEY (pelicula_id) REFERENCES peliculas(id)
);

ALTER TABLE actores_peliculas ADD COLUMN salario DECIMAL(10,2);
ALTER TABLE actores MODIFY nombre VARCHAR(150);
ALTER TABLE actores_peliculas DROP COLUMN salario;
CREATE INDEX idx_titulo ON peliculas(titulo);

INSERT INTO actores (nombre) VALUES ('Leonardo DiCaprio');
INSERT INTO peliculas (titulo, anio_estreno) VALUES ('Titanic', 1997);
INSERT INTO actores_peliculas (actor_id, pelicula_id, personaje) VALUES (1, 1, 'Jack Dawson');

INSERT INTO actores (nombre) VALUES ('Kate Winslet'), ('Tom Hanks');
INSERT INTO peliculas (titulo, anio_estreno) VALUES ('Forrest Gump', 1994), ('Avatar', 2009), ('Inception', 2010);

INSERT INTO actores_peliculas (actor_id, pelicula_id, personaje) VALUES 
(2, 1, 'Rose DeWitt Bukater'), 
(3, 2, 'Forrest Gump'), 
(1, 4, 'Cobb');

SELECT p.titulo 
FROM peliculas p
JOIN actores_peliculas ap ON p.id = ap.pelicula_id
JOIN actores a ON ap.actor_id = a.id
WHERE a.nombre = 'Leonardo DiCaprio';

SELECT a.nombre 
FROM actores a
JOIN actores_peliculas ap ON a.id = ap.actor_id
JOIN peliculas p ON ap.pelicula_id = p.id
WHERE p.titulo = 'Titanic';

DELETE FROM actores_peliculas WHERE actor_id = 3 AND pelicula_id = 2;
DELETE FROM actores_peliculas WHERE actor_id = 1;
DELETE FROM actores WHERE id = 1;

DROP DATABASE cine;
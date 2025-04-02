CREATE DATABASE instituto CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER DATABASE instituto CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE instituto;

CREATE TABLE profesores (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE cursos (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    descripcion TEXT
);

CREATE TABLE profesores_cursos (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    profesor_id INT UNSIGNED NOT NULL,
    curso_id INT UNSIGNED NOT NULL,
    fecha_asignacion DATE NOT NULL,
    FOREIGN KEY (profesor_id) REFERENCES profesores(id),
    FOREIGN KEY (curso_id) REFERENCES cursos(id)
);

ALTER TABLE profesores_cursos ADD COLUMN horas_clase INT;
ALTER TABLE cursos MODIFY nombre VARCHAR(200) NOT NULL;
ALTER TABLE profesores_cursos DROP COLUMN horas_clase;
CREATE INDEX idx_nombre ON cursos(nombre);

INSERT INTO profesores (nombre) VALUES ('Juan Pérez');
INSERT INTO cursos (nombre, descripcion) VALUES ('Matemáticas', 'Curso de álgebra y geometría');
INSERT INTO profesores_cursos (profesor_id, curso_id, fecha_asignacion)
VALUES (
    (SELECT id FROM profesores WHERE nombre = 'Juan Pérez'),
    (SELECT id FROM cursos WHERE nombre = 'Matemáticas'),
    CURDATE()
);

INSERT INTO profesores (nombre) VALUES ('Ana Rodríguez'), ('Luis Gómez');
INSERT INTO cursos (nombre) VALUES ('Física'), ('Historia'), ('Química');

INSERT INTO profesores_cursos (profesor_id, curso_id, fecha_asignacion)
VALUES 
    ((SELECT id FROM profesores WHERE nombre = 'Ana Rodríguez'), (SELECT id FROM cursos WHERE nombre = 'Física'), CURDATE()),
    ((SELECT id FROM profesores WHERE nombre = 'Ana Rodríguez'), (SELECT id FROM cursos WHERE nombre = 'Química'), CURDATE()),
    ((SELECT id FROM profesores WHERE nombre = 'Luis Gómez'), (SELECT id FROM cursos WHERE nombre = 'Historia'), CURDATE()),
    ((SELECT id FROM profesores WHERE nombre = 'Luis Gómez'), (SELECT id FROM cursos WHERE nombre = 'Matemáticas'), CURDATE());

SELECT c.nombre 
FROM cursos c
JOIN profesores_cursos pc ON c.id = pc.curso_id
JOIN profesores p ON pc.profesor_id = p.id
WHERE p.nombre = 'Juan Pérez';

SELECT p.nombre 
FROM profesores p
JOIN profesores_cursos pc ON p.id = pc.profesor_id
JOIN cursos c ON pc.curso_id = c.id
WHERE c.nombre = 'Matemáticas';

DELETE FROM profesores_cursos 
WHERE profesor_id = (SELECT id FROM profesores WHERE nombre = 'Luis Gómez')
AND curso_id = (SELECT id FROM cursos WHERE nombre = 'Matemáticas');

DELETE FROM profesores_cursos WHERE profesor_id = (SELECT id FROM profesores WHERE nombre = 'Ana Rodríguez');
DELETE FROM profesores WHERE nombre = 'Ana Rodríguez';

DROP DATABASE instituto;
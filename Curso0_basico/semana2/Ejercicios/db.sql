-- Crea la base de datos llamada escuela.
CREATE DATABASE IF NOT EXISTS escuela;

USE escuela;

DROP TABLE inscripciones, cursos, estudiantes;

-- Tabla estudiantes: id, nombre, apellidos, edad, correo_electronico.
CREATE TABLE IF NOT EXISTS estudiantes(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    edad INT NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
	createdAt DATETIME DEFAULT CURRENT_TIMESTAMP, 
	modifiedAt DATETIME ON UPDATE CURRENT_TIMESTAMP
);

-- Tabla cursos: id, nombre.
CREATE TABLE IF NOT EXISTS cursos(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
	createdAt DATETIME DEFAULT CURRENT_TIMESTAMP, 
	modifiedAt DATETIME ON UPDATE CURRENT_TIMESTAMP
);

-- Tabla inscripciones: id, id_estudiante, id_curso, fecha_inscripcion.
-- https://www.mysqltutorial.org/mysql-basics/mysql-date/
CREATE TABLE IF NOT EXISTS inscripciones(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	id_estudiante INT UNSIGNED,
	id_curso INT UNSIGNED,
	fecha_inscripcion DATE NOT NULL,
	createdAt DATETIME DEFAULT CURRENT_TIMESTAMP, 
	modifiedAt DATETIME ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id),
    FOREIGN KEY (id_curso) REFERENCES cursos(id)
);

-- Ana Gómez (20 años) - ana.gomez@email.com
-- Carlos Martínez (22 años) - carlos.martinez@email.com
-- Elena Ruiz (21 años) - elena.ruiz@email.com
INSERT INTO estudiantes (nombre, apellidos, edad, email) VALUES
("Ana", "Gómez", 20, "ana.gomez@email.com"),
("Carlos",  "Martínez", 22, "carlos.martinez@email.com"),
("Elena",  "Ruiz", 21, "elena.ruiz@email.com");

SELECT * 
FROM estudiantes;

INSERT INTO cursos (nombre) VALUES
("Matemáticas"),
("Historia"),
("Programación");

SELECT *
FROM cursos;

-- Ana Gómez se inscribe en Historia (2024-03-01).
-- Carlos Martínez se inscribe en Matemáticas (2024-03-02).
-- Elena Ruiz se inscribe en Programación (2024-03-03).
INSERT INTO inscripciones (id_estudiante,id_curso,fecha_inscripcion) VALUES
(1, 2, "2024-03-01"),
(2, 1, "2024-03-02"),
(3, 3, "2024-03-03");

SELECT *
FROM inscripciones;

SELECT e.nombre, c.nombre AS curso, i.fecha_inscripcion
FROM inscripciones AS i
JOIN estudiantes AS e ON e.id = i.id_estudiante
JOIN cursos AS c ON c.id = i.id_curso;

-- Modificar la edad de Carlos Martínez a 23 años.
UPDATE estudiantes
SET edad = 23
WHERE id=2;

-- Eliminar la inscripción de Ana Gómez en Historia.
DELETE FROM inscripciones
WHERE id_estudiante = 1 AND id_curso=2;





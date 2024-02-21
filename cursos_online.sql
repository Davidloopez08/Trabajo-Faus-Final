CREATE DATABASE CURSOS_ONLINE;
USE CURSOS_ONLINE;

-- Crear la tabla de roles
CREATE TABLE roles (
    id INT PRIMARY KEY,
    rol VARCHAR(50) NOT NULL
);

-- Insertar algunos roles de ejemplo
INSERT INTO roles (id, rol) VALUES (1, 'Administrador');
INSERT INTO roles (id, rol) VALUES (2, 'Estudiante');
INSERT INTO roles (id, rol) VALUES (3, 'Profesor');

-- Crear la tabla de categorías de cursos
CREATE TABLE categorias (
    id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Insertar algunas categorías de ejemplo
INSERT INTO categorias (id, nombre) VALUES (1, 'Programación');
INSERT INTO categorias (id, nombre) VALUES (2, 'Diseño');
INSERT INTO categorias (id, nombre) VALUES (3, 'Inteligencia Artificial');

-- Crear la tabla de cursos
CREATE TABLE cursos (
    id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    id_categoria INT,
    fecha_inicio DATE,
    fecha_fin DATE
);

-- Insertar algunos cursos de ejemplo
INSERT INTO cursos (id, nombre, descripcion, id_categoria, fecha_inicio, fecha_fin) 
VALUES (1, 'Programación en Python', 'Aprende a programar en Python', 1, '2024-01-01', '2024-02-01');

-- Crear la tabla de usuarios
CREATE TABLE usuarios (
    id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    edad INT,
    correo VARCHAR(100),
    telefono VARCHAR(15),
    contraseña VARCHAR(50),
    id_rol INT
);

-- Insertar algunos usuarios de ejemplo
INSERT INTO usuarios (id, nombre, edad, correo, telefono, id_rol) 
VALUES (1, 'Juan', 25, 'juan@example.com', '+123456789', 2);

-- Crear la tabla de inscripciones a cursos
CREATE TABLE inscripciones (
    id INT PRIMARY KEY,
    id_usuario INT,
    id_curso INT,
    fecha_inscripcion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insertar algunas inscripciones de ejemplo
INSERT INTO inscripciones (id, id_usuario, id_curso) VALUES (1, 1, 1);

-- Crear la tabla de lecciones
CREATE TABLE lecciones (
    id INT PRIMARY KEY,	
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    id_curso INT
);

-- Insertar algunas lecciones de ejemplo
INSERT INTO lecciones (id, nombre, descripcion, id_curso) 
VALUES (1, 'Introducción a Python', 'Conceptos básicos de Python', 1);

ALTER TABLE usuarios ADD FOREIGN KEY (id_rol) REFERENCES roles(id);
ALTER TABLE cursos ADD FOREIGN KEY (id_categoria) REFERENCES categorias(id);
ALTER TABLE inscripciones ADD FOREIGN KEY (id_usuario) REFERENCES usuarios(id);
ALTER TABLE inscripciones ADD FOREIGN KEY (id_curso) REFERENCES cursos(id);
ALTER TABLE lecciones ADD FOREIGN KEY (id_curso) REFERENCES cursos(id);

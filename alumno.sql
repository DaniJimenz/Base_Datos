CREATE TABLE cientifico 
(
    dni VARCHAR (9) PRIMARY KEY,
    nombre VARCHAR2 (50),
    ciudad VARCHAR2 (30), NOT NULL,
    sueldo NUMERIC (5) CHECK (sueldo > 1000)
);
CREATE TABLE proyectos
(
    ide NUMERIC (10) PRIMARY KEY,
    nombre VARCHAR2 (50),
    horasTotales NUMERIC (5) DEFAULT 500 CHECK (horasTotales >= 0),
    presupuesto NUMERIC (5) CHECK (presupuesto > 3000)
);
CREATE TABLE trabajos
(
    cientifico VARCHAR (25),
    proyecto VARCHAR (30),
    puesto VARCHAR (20) (puesto IN ('Lider', 'Ingeniero','Delineantes','Pasante')),
    horas NUMERIC (5), CHECK (horas >= 0)
    
    CONSTRAINT pk_tra PRIMARY KEY (cientifico,proyecto),
    CONSTRAINT fk_cienti FOREIGN KEY (cientifico) REFERENCES cientifico(dni),
    CONSTRAINT fk_proye FOREIGN KEY (proyecto) REFERENCES proyecto(id_proyecto)
);

INSERT INTO cientifico (dni, nombre, ciudad, sueldo)
('11111111S', 'Juan Pérez', 'Granada', 2500);
INSERT INTO cientifico (dni, nombre, ciudad, sueldo)
('22222222R', 'María Fernández', 'Madrid', NULL);
INSERT INTO cientifico  (dni, nombre, ciudad, sueldo)
('33333333T', 'Pedro Martínez', 'Granada', 3650);
INSERT INTO cientifico  (dni, nombre, ciudad, sueldo)
('44444444E', 'Ismael Rienda', 'Málaga', 2680);
INSERT INTO cientifico  (dni, nombre, ciudad, sueldo)
('55555555Y', 'Rocío Raya', 'Málaga', NULL);
INSERT INTO cientifico  (dni, nombre, ciudad, sueldo)
('66666666J', 'Luisa López', 'Madrid', 3500);
INSERT INTO cientifico  (dni, nombre, ciudad, sueldo)
('77777777B', 'Mario Molina', 'Granada' 2900);

INSERT INTO proyectos (ide, nombre, horasTotales, presupuesto)
(1, 'Barranco-Molina' 2500, 50800);
INSERT INTO proyectos (ide, nombre, horasTotales, presupuesto)
(2, 'López-Rienda' 3600, 365000);
INSERT INTO proyectos (ide, nombre, horasTotales, presupuesto)
(3, 'Pineda-Roca' 500, 4500);
INSERT INTO proyectos (ide, nombre, horasTotales, presupuesto)
(4, 'Rivera-Toledo' 1250, 20500);

INSERT INTO trabajos (cientifico,proyecto, puesto, horas)
('11111111S', 1, 'Líder' 1000);
INSERT INTO trabajos (cientifico,proyecto, puesto, horas)
('22222222R', 1, 'Ingeniero', 750);
INSERT INTO trabajos (cientifico,proyecto, puesto, horas)
('44444444E' 2, 'Líder', 1500);
INSERT INTO trabajos (cientifico,proyecto, puesto, horas)
('11111111S', 2, 'Ingeniero', 1000);
INSERT INTO trabajos (cientifico,proyecto, puesto, horas)
('55555555Y', 3, 'Líder', NULL);
INSERT INTO trabajos (cientifico,proyecto, puesto, horas)
('66666666J', 3, 'Ingeniero', 90);
INSERT INTO trabajos (cientifico,proyecto, puesto, horas)
('22222222R', 3, 'Delineante', 90);
INSERT INTO trabajos (cientifico,proyecto, puesto, horas)
('44444444E', 4, 'Líder', 1000);
INSERT INTO trabajos (cientifico,proyecto, puesto, horas)
('55555555Y', 4, 'Ingeniero', 150);
INSERT INTO trabajos (cientifico,proyecto, puesto, horas)
('44444444E', 1, 'Delineante', 350);
INSERT INTO trabajos (cientifico,proyecto, puesto, horas)
('77777777B', 3, 'Pasante', 50);
INSERT INTO trabajos (cientifico,proyecto, puesto, horas)
();

SELECT ciudad.nombre FROM cientificos;
SELECT presupuesto FROM proyectos ORDER BY presupuesto DESC;
SELECT proyecto FROM trabajos, cientifico WHERE dni.cientifico=trabajo.cientifico AND cientifico.nombre = 'Mario Molina';
SELECT DISTINCT ciudad FROM cientifico;
SELECT horasTotales.nombre.nombre FROM cientifico, proyectos WHERE horasTotales.proyectos=nombre.proyecto;
SELECT dni.nombre FROM cientifico,proyectos WHERE horasTotales.proyectos > 800;



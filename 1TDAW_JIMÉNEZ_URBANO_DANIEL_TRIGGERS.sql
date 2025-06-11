-- Tabla persona (base)
CREATE TABLE persona (
    dni VARCHAR2(10) PRIMARY KEY,
    nombre VARCHAR2(50) NOT NULL,
    ape VARCHAR2(50) NOT NULL,
    direccion VARCHAR2(100)
);

-- Tabla alumno (hereda de persona)
CREATE TABLE alumno (
    dni VARCHAR2(10) PRIMARY KEY,
    nota_media NUMBER(4,2),
    CONSTRAINT fk_alumno_persona FOREIGN KEY (dni) REFERENCES persona(dni)
);

-- Tabla profesor (hereda de persona)
CREATE TABLE profesor (
    dni VARCHAR2(10) PRIMARY KEY,
    salario NUMBER(8,2),
    CONSTRAINT fk_profesor_persona FOREIGN KEY (dni) REFERENCES persona(dni)
);

-- Tabla modulo
CREATE TABLE modulo (
    id NUMBER PRIMARY KEY,
    nombre VARCHAR2(50) NOT NULL,
    grado VARCHAR2(50),
    anio NUMBER(1) CHECK (anio IN (1,2)),
    dni_prof VARCHAR2(10),
    CONSTRAINT fk_modulo_profesor FOREIGN KEY (dni_prof) REFERENCES profesor(dni)
);

-- Tabla notas
CREATE TABLE notas (
    dni VARCHAR2(10),
    id_mod NUMBER,
    nota NUMBER(4,2),
    PRIMARY KEY (dni, id_mod),
    CONSTRAINT fk_notas_alumno FOREIGN KEY (dni) REFERENCES alumno(dni),
    CONSTRAINT fk_notas_modulo FOREIGN KEY (id_mod) REFERENCES modulo(id)
);

INSERT INTO persona VALUES ('11111111A', 'Carlos', 'Ruiz', 'Calle Primavera 5');
INSERT INTO persona VALUES ('22222222B', 'Laura', 'Méndez', 'Avenida Central 20');
INSERT INTO persona VALUES ('33333333C', 'María', 'López', 'Plaza Mayor 3');
INSERT INTO persona VALUES ('44444444D', 'Pedro', 'Sánchez', 'Calle del Sol 15');
INSERT INTO persona VALUES ('55555555E', 'Ana', 'Gómez', 'Avenida Libertad 7');
INSERT INTO persona VALUES ('66666666F', 'David', 'Torres', 'Calle Gran Vía 40');

INSERT INTO alumno VALUES ('11111111A', 7.8);
INSERT INTO alumno VALUES ('33333333C', 6.5);
INSERT INTO alumno VALUES ('44444444D', 9.1);

INSERT INTO profesor VALUES ('22222222B', 1500.00);
INSERT INTO profesor VALUES ('66666666F', 2800.00);

INSERT INTO modulo VALUES (100, 'Bases de Datos', 'DAW', 1, '22222222B');
INSERT INTO modulo VALUES (101, 'Programación', 'DAW', 1, '22222222B');
INSERT INTO modulo VALUES (102, 'Desarrollo web en entorno servidor', 'DAW', 2, '66666666F');  -- Usando nuevo profesor
INSERT INTO modulo VALUES (103, 'Diseño de interfaces', 'DAM', 2, '22222222B');

INSERT INTO notas (dni, id_mod, nota) VALUES ('11111111A', 101, 7.0);
INSERT INTO notas (dni, id_mod, nota) VALUES ('11111111A', 103, 8.9);
INSERT INTO notas (dni, id_mod, nota) VALUES ('33333333C', 100, 6.0);
INSERT INTO notas (dni, id_mod, nota) VALUES ('33333333C', 102, 7.5);

//Ejercicio 1//

CREATE OR REPLACE TRIGGER actuNotaMedia
AFTER INSERT OR UPDATE OR DELETE ON notas
FOR EACH ROW
DECLARE
    nuMedia NUMBER(4,2);
    dniAlumno VARCHAR2(10);
BEGIN
IF DELETING THEN
    dniAlumno := :old.dni;
ELSE
    dniAlumno := :new.dni;
END IF;
SELECT AVG(nota) INTO nuMedia 
FROM notas 
WHERE dni = dniAlumno;
    
UPDATE alumno 
SET nota_media = nuMedia 
WHERE dni = dniAlumno;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
UPDATE alumno 
SET nota_media = NULL 
WHERE dni = dniAlumno;
END actuNotaMedia;

//Ejercicio 2//

CREATE TABLE alumno_curso(
    dni VARCHAR(10) PRIMARY KEY,
    curso NUMBER(1) CHECK (curso IN (1,2)),
    
    CONSTRAINT fk_curso_alumno FOREIGN KEY (dni) REFERENCES alumno(dni)
);

INSERT INTO alumno_curso VALUES ('33333333C', 2);
INSERT INTO alumno_curso VALUES ('11111111A', 2);
INSERT INTO alumno_curso VALUES ('44444444D', 1);

CREATE OR REPLACE TRIGGER notas_curso
BEFORE INSERT OR UPDATE ON notas
FOR EACH ROW
DECLARE
cursoMod NUMBER;
cursoA1 NUMBER;
BEGIN
SELECT anio INTO cursoMod FROM modulo WHERE id = :new.id_mod;
SELECT curso INTO cursoA1 FROM alumno_curso WHERE dni = :new.dni;
END notas_curso;

IF cursoA1 != cursoMod THEN
    DBMS_OUTPUT.PUT_LINE('El alumno tiene notas en otro curso');
END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Modulo no encontrado');
END notas_curso;

INSERT INTO notas VALUES ('33333333C', 100, 9.2);
INSERT INTO notas VALUES ('44444444d', 104, 7.4);
UPDATE notas SET nota = 8.5 WHERE dni = '33333333C' AND id_mod = 100;

//Ejercicio 3//

CREATE OR REPLACE TRIGGER validarDniAlumno
BEFORE INSERT OR UPDATE ON notas
FOR EACH ROW
DECLARE
    existe_alumno NUMBER;
BEGIN
SELECT COUNT(*) INTO existe_alumno 
FROM alumno 
WHERE dni = :new.dni;
    
IF existe_alumno = 0 THEN
    DBMS_OUTPUT.PUT_LINE('El DNI ' || :new.dni || ' no pertenece a ningún alumno registrado');
END IF;
END validarDniAlumno;

//Ejercicio 4//





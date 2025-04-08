DROP TABLE carta;
DROP TABLE categoria;
DROP TABLE clientes;
DROP TABLE cupones;
DROP TABLE direccion;
DROP TABLE pedidos;
DROP TABLE platos;
DROP TABLE restaurante;
DROP TABLE tiene;
DROP TABLE empleado;
DROP TABLE departamento;

CREATE TABLE departamento (
    id NUMBER(10) PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL,
    localidad VARCHAR2(100) NOT NULL
);

CREATE TABLE empleado (
    id NUMBER(10) PRIMARY KEY,
    nombre VARCHAR2(50) NOT NULL,
    apellidos VARCHAR2(100) NOT NULL,
    puesto VARCHAR2(50) NOT NULL,
    direccion VARCHAR2(200),
    id_depa NUMBER(10) NOT NULL,
    sueldo NUMBER(10,2) NOT NULL,
    CONSTRAINT fk_empleado_departamento FOREIGN KEY (id_depa) REFERENCES departamento(id)
);

-- Inserción de datos de Departamento
INSERT INTO departamento VALUES (1, 'Recursos Humanos', 'Madrid');
INSERT INTO departamento VALUES (2, 'Tecnología', 'Barcelona');
INSERT INTO departamento VALUES (3, 'Ventas', 'Valencia');

-- Inserción de datos de Empleado
INSERT INTO empleado (id, nombre, apellidos, puesto, direccion, id_depa, sueldo) 
VALUES (1, 'Ana', 'García López', 'Analista RH', 'Calle Mayor 5, Madrid', 1, 2850.50);

INSERT INTO empleado (id, nombre, apellidos, puesto, direccion, id_depa, sueldo) 
VALUES (2, 'Carlos', 'Martínez Soler', 'Desarrollador Senior', 'Avenida Diagonal 200, Barcelona', 2, 4200.00);

INSERT INTO empleado (id, nombre, apellidos, puesto, id_depa, sueldo) 
VALUES (3, 'Laura', 'Sánchez Ruiz', 'Gerente de Ventas', 3, 3750.75);

INSERT INTO empleado (id, nombre, apellidos, puesto, direccion, id_depa, sueldo) 
VALUES (4, 'Pedro', 'Jiménez Mora', 'Soporte Técnico', 'Calle Colón 12, Valencia', 2, 2450.90);

INSERT INTO empleado (id, nombre, apellidos, puesto, direccion, id_depa, sueldo) 
VALUES (5, 'Marta', 'Pérez Gil', 'Reclutador', 'Gran Vía 30, Madrid', 1, 2650.00);

INSERT INTO empleado (id, nombre, apellidos, puesto, id_depa, sueldo) 
VALUES (6, 'Javier', 'Romero Navarro', 'Desarrollador Junior', 2, 2100.00);

INSERT INTO empleado (id, nombre, apellidos, puesto, direccion, id_depa, sueldo) 
VALUES (7, 'Lucía', 'Fernández Castro', 'Asistente de Ventas', 'Calle del Mar 8, Valencia', 3, 1950.60);

INSERT INTO empleado (id, nombre, apellidos, puesto, direccion, id_depa, sueldo) 
VALUES (8, 'Sergio', 'Díaz Mendoza', 'Asistente RH', 'Paseo de la Castellana 45, Madrid', 1, 2300.75);

INSERT INTO empleado (id, nombre, apellidos, puesto, direccion, id_depa, sueldo) 
VALUES (9, 'Elena', 'Ruiz Torres', 'Project Manager', 'Rambla de Catalunya 15, Barcelona', 2, 3850.00);

INSERT INTO empleado (id, nombre, apellidos, puesto, id_depa, sueldo) 
VALUES (10, 'Diego', 'Gómez Serrano', 'Especialista en Marketing', 3, 2750.40);


-- Ejercicio 1
BEGIN 
    FOR i IN 1..25 LOOP
    DBMS_OUTPUT.PUT_LINE(i*2);
    END LOOP;
END;

-- Ejercicio 2 --

ACCEPT nom PROMPT 'Nombre del empleado';
ACCEPT apell PROMPT 'Apellidos del empleado';
ACCEPT nume PROMPT 'Puesto del empleado';
ACCEPT direcc PROMPT 'Dirección del empleado';
ACCEPT depa PROMPT 'Departamento del empleado';
ACCEPT suel PROMPT 'Sueldo del empleado';

DECLARE
    nume empleado.id%TYPE;
    depa empleado.id_depa%TYPE;
BEGIN
    SELECT MAX(id)+1 INTO nume FROM empleado;
    SELECT id INTO depa FROM departamento WHERE nombre = '&depa';
    INSERT INTO empleado VALUES ('&nom','&apell','&nume', '&direcc', depa, &suel);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No existe');
END;

-- Ejercicio 3 --
ACCEPT nume PROMPT 'Número identificador del empleado que quieres borrar';
BEGIN
    DELETE FROM empleado WHERE id = '&nume';
EXCEPTION 
    WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No existe');
END;
    
-- Ejercicio 4 --

ACCEPT nom PROMPT 'Nombre del departamento';
ACCEPT locali PROMPT 'Localidad donde lo quieres mover';
DECLARE
    idepa departamento.id%TYPE;
BEGIN
    SELECT id INTO idepa FROM departamento WHERE nombre = '&nom';
    UPDATE departamento SET localidad = '&locali' WHERE id = idepa;
EXCEPTION 
    WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No existe');
END;

-- Ejercicio 5 --

DECLARE
    suma INT;
    numemple INT;
    resul INT;
    cero EXCEPTION;
BEGIN 
    FOR i IN (SELECT*FROM departamento) LOOP
    suma :=0;
    numemple := 0;
    FOR n IN (SELECT*FROM empleado WHERE id_depa = i.id) LOOP
    suma := suma + n.sueldo;
    numemple := numemple + 1;
    END LOOP;
    IF(numemple = 0) THEN
    RAISE cero;
    ELSE
    resul := suma/numemple;
    DBMS_OUTPUT.PUT_LINE('La media del departamento de ' || i.nombre || ' es de ' || resul);
    END IF;
    END LOOP;
END;

-- Ejercicio 6

ACCEPT dep1 PROMPT 'Introduce el número del departamento a mover';
ACCEPT dep2 PROMPT 'Introduce el número del departamento a donde van a ir';
DECLARE
    depini departamento.id%TYPE;
    depfin departamento.id%TYPE;
    cantemple INT;
BEGIN
    SELECT id INTO depini FROM departamento WHERE nombre = '&depini';
    SELECT id INTO depfin FROM departamento WHERE nombre = '&depfin';
    SELECT COUNT(*) INTO cantemple FROM empleado WHERE id_depa = depini;
    IF(cantemple > 4) THEN
    UPDATE empleado SET id_depa = depfin WHERE id_depa = depini;
    ELSE 
    DBMS_OUTPUT.PUT_LINE('Pocos empleados');
    END IF;
END;


    


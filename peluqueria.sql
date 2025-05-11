DROP TABLE cliente CASCADE CONSTRAINTS;
DROP TABLE trabajador CASCADE CONSTRAINTS;
DROP TABLE tratamiento CASCADE CONSTRAINTS;
DROP TABLE cita CASCADE CONSTRAINTS;
DROP TABLE listaempleados CASCADE CONSTRAINTS;

CREATE TABLE cliente(
    id INT PRIMARY KEY,
    nombre VARCHAR2(20),
    apellidos VARCHAR2(50)
);

CREATE TABLE trabajador(
    id INT PRIMARY KEY,
    nombre VARCHAR2(20),
    apellidos VARCHAR2(50)
);

CREATE TABLE tratamiento(
    id INT PRIMARY KEY,
    nombre VARCHAR2(20),
    precio number(5,2)
);

CREATE TABLE cita(
    id_cli INT,
    id_tra INT,
    id_trat INT,
    fecha DATE,
    duracion NUMBER(4),
    
    CONSTRAINT pk_cita PRIMARY KEY (id_cli, id_tra, id_trat, fecha),
    CONSTRAINT fk_cli FOREIGN KEY (id_cli) REFERENCES cliente(id),
    CONSTRAINT fk_tra FOREIGN KEY (id_tra) REFERENCES trabajador(id),
    CONSTRAINT fk_trat FOREIGN KEY (id_trat) REFERENCES tratamiento(id)
);

INSERT INTO cliente VALUES (1, 'Ana', 'Morales');
INSERT INTO cliente VALUES (2, 'Pilar', 'Jimenez');
INSERT INTO cliente VALUES (3, 'Juan', 'P�rez');
INSERT INTO cliente VALUES (4, 'Luis', 'L�pez');
INSERT INTO cliente VALUES (5, 'Manu', 'Garc�a');

INSERT INTO trabajador VALUES (1, 'Paloma', 'Cuesta');
INSERT INTO trabajador VALUES (2, 'Bel�n', 'L�pez');
INSERT INTO trabajador VALUES (3, 'Emilio', 'Delgado');

INSERT INTO tratamiento VALUES (1, 'Corte', 15);
INSERT INTO tratamiento VALUES (2, 'Tinte', 20.5);
INSERT INTO tratamiento VALUES (3, 'Lavado', 6.5);
INSERT INTO tratamiento VALUES (4, 'Peinado', 8.25);
INSERT INTO tratamiento VALUES (5, 'Mechas', 25.75);

INSERT INTO cita VALUES (3, 1, 2, '27-03-2024', 100);
INSERT INTO cita VALUES (3, 1, 2, '13-03-2024', 35);
INSERT INTO cita VALUES (3, 1, 4, '25-03-2024', 40);
INSERT INTO cita VALUES (3, 1, 3, '30-03-2024', 10);
INSERT INTO cita VALUES (3, 1, 4, '23-03-2024', 30);
INSERT INTO cita VALUES (3, 1, 5, '23-03-2024', 110);
INSERT INTO cita VALUES (3, 1, 1, '17-03-2024', 35);
INSERT INTO cita VALUES (1, 1, 2, '01-03-2024', 35);
INSERT INTO cita VALUES (2, 1, 3, '01-03-2024', 85);
INSERT INTO cita VALUES (5, 3, 2, '12-03-2024', 35);
INSERT INTO cita VALUES (4, 3, 2, '15-03-2024', 45);
INSERT INTO cita (id_cli, id_tra, id_trat, fecha) VALUES (5, 2, 4, '25-03-2024');
INSERT INTO cita (id_cli, id_tra, id_trat, fecha) VALUES (2, 2, 5, '27-03-2024');
INSERT INTO cita (id_cli, id_tra, id_trat, fecha) VALUES (3, 3, 2, '30-03-2024');
INSERT INTO cita (id_cli, id_tra, id_trat, fecha) VALUES (4, 2, 1, '17-03-2024');
INSERT INTO cita (id_cli, id_tra, id_trat, fecha) VALUES (4, 3, 3, '13-03-2024');

//EJERCICIO 1//

DECLARE
    CURSOR curCitas IS SELECT fecha, duracion, cliente.nombre, trabajador.nombre, tratamiento.nombre, duracion, precio
    FROM cita
    JOIN cliente ON id_cli = cliente.id
    JOIN trabajador ON id_tra = trabajador.id
    JOIN tratamiento ON id_trata = tratamiento.id
    ORDER BY fecha ASC;
    fechAct cita.fecha%TYPE := '01/01/1960';
    fech cita.fecha%TYPE;
    dura cita.duracion%TYPE;
    cliNom cliente.nombre%TYPE;
    traNom trabajador.nombre%TYPE;
    trataNom tratamiento.nombre%TYPE;
    preci tratamiento.preci%TYPE;
BEGIN
    OPEN curCitas;
    LOOP
    FETCH curCitas INTO fech, dura, cliNom, traNom, trataNom, preci;
    EXIT WHEN curCitas%NOTFOUND;
    IF fechaAct != fech THEN
    fechAct := fech;
    END IF;
    dbms_output.put_line ('Clientes: ' || cliNom || 'Trabajador: ' || traNom || 'Tratamientos: ' || trataNom );
    FETCH 
END LOOP;
CLOSE nomCitas;
END;

//Ejercicio 2//

ACCEPT cliNom PROMPT 'Introduce el nombre del cliente: ';
ACCEPT cliApe PROMPT 'Introduce los apellidos del cliente: ';

DECLARE
    CURSOR curFactura IS 
    SELECT tratamiento.nombre tratamiento_nombre, tratamiento.precio, cita.fecha
    FROM cita 
    JOIN cliente ON id_cli = cliente.id
    JOIN tratamiento ON id_trat = tratamiento.id
    WHERE cliente.nombre = '&cliNom' AND cliente.apellidos = '&cliApe'
    ORDER BY cita.fecha;
    trataNom tratamiento.nombre%TYPE;
    preci tratamiento.precio%TYPE;
    fech cita.fecha%TYPE;
    totalFactura NUMBER(8,2);
    existeCliente NUMBER;
BEGIN
    SELECT COUNT(*) INTO existeCliente
    FROM cliente
    WHERE nombre = '&cliNom' AND apellidos = '&cliApe';
    IF existeCliente = 0 THEN
        dbms_output.put_line('No existe un cliente con nombre ' || '&cliNom' || ' ' || '&cliApe');
        RETURN;
    END IF;
    dbms_output.put_line('FACTURA DE CLIENTE: ' || '&cliNom' || ' ' || '&cliApe');
OPEN curFactura;
    LOOP
    FETCH curFactura INTO trataNom, preci, fech;
    EXIT WHEN curFactura%NOTFOUND; 
    dbms_output.put_line(trataNom || ' ' || TO_CHAR(fech, 'DD/MM/YYYY') || ' ' || TO_CHAR(preci, '999.99') || ' €');
        totalFactura := totalFactura + preci;
    END LOOP;
    CLOSE curFactura;
    dbms_output.put_line('TOTAL A PAGAR: ' || TO_CHAR(totalFactura, '999.99') || ' €');
END;

//Ejercicio 3//

ACCEPT cliNom PROMPT 'Introduce el nombre del cliente';
ACCEPT cliApe PROMPT 'Introduce el apellido del cliente';
ACCEPT traNom PROMPT 'Introduce el nombre del trabajador';
ACCEPT tratNom PROMPT 'Introduce el nombre del tratamiento';
ACCEPT fecha PROMPT 'Introduce la fecha de la cita';
DECLARE
cliIde cliente.id%TYPE;
traIde trabajador.id%TYPE;
trataIde tratamiento.id%TYPE;
BEGIN
    SELECT id INTO cliIde FROM cliente WHERE nombre = '&cliNom' AND apellidos = '&cliApe';
    SELECT id INTO traIde FROM trabajador WHERE nombre = '&traNom';
    SELECT id INTO trataIde FROM tratamiento WHERE nombre = '&tratNom';
    INSERT INTO cita (id_cli, id_tra, id_trat, fecha)
    VALUES (cliIde, traIde, trataIde, TO_DATE('&fecha', 'AA-MM-XXXX'));
    dbms_output.put_line('Cita creada correctamente para el ' || '&fecha');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        dbms_output.put_line('Error: Alguno de los datos introducidos no existe en la base de datos');
    WHEN DUP_VAL_ON_INDEX THEN
        dbms_output.put_line('Error: Ya existe una cita con esos datos');
    WHEN OTHERS THEN
        dbms_output.put_line('Error al crear la cita: ' || SQLERRM);
END;
/

//Ejercicio 4//

ACCEPT cliNom PROMPT 'Introduce el nombre del cliente';
ACCEPT cliApe PROMPT 'Introduce el apellido del cliente';
ACCEPT traNom PROMPT 'Introduce el nombre del trabajador';
ACCEPT tratNom PROMPT 'Introduce el nombre del tratamiento';
ACCEPT fecha PROMPT 'Introduce la fecha de la cita';
ACCEPT dura PROMPT 'Introduce la duraci�n de la cita en minutos';
DECLARE
cliIde cliente.id%TYPE;
traIde trabajador.id%TYPE;
trataIde tratamiento.id%TYPE;
citaExiste NUMBER;
duracionActual cita.duracion%TYPE;
BEGIN
SELECT id INTO cliIde FROM cliente WHERE nombre = '&cliNom' AND apellidos = '&cliApe';
SELECT id INTO traIde FROM trabajador WHERE nombre = '&traNom';
SELECT id INTO trataIde FROM tratamiento WHERE nombre = '&trataNom';
UPDATE cita
SET direccion = &dura
WHERE id_cli = cliIde AND id_tra = traIde AND id_trata = trataIde AND fecha = '&fecha';
EXCEPTION
WHEN NO_DATA_FOUND THEN
dbms_output.put_line ('No existen citas con esos datos');
END;

//Ejercicio 5//

DECLARE 
    CURSOR curCitas IS 
        SELECT tratamiento.nombre tratamiento_nombre, 
               COUNT(id_trat) cantidad, 
               tratamiento.precio precio_unitario,
               COUNT(id_trat) * tratamiento.precio total
        FROM cita
        JOIN tratamiento ON id_trat = tratamiento.id
        GROUP BY tratamiento.nombre, tratamiento.precio
        ORDER BY tratamiento.nombre;
    tratNom tratamiento.nombre%TYPE;
    cantidad NUMBER;
    precioUnitario tratamiento.precio%TYPE;
    total tratamiento.precio%TYPE;
    sumTotal tratamiento.precio%TYPE := 0;
BEGIN
    OPEN curCitas;
    LOOP
    FETCH curCitas INTO tratNom, cantidad, precioUnitario, total;
    EXIT WHEN curCitas%NOTFOUND;
        dbms_output.put_line(tratNom || '' || cantidad || '' || TO_CHAR(precioUnitario, '999.99') || ' €' || '' ||TO_CHAR(total, '999.99') || ' €');
        sumTotal := sumTotal + total;
    END LOOP;
    CLOSE curCitas;
    dbms_output.put_line('TOTAL BENEFICIOS: ' || TO_CHAR(sumTotal, '999.99') || ' €');
END;



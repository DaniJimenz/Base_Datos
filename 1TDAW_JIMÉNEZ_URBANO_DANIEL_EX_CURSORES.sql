DROP TABLE L_LIBRO_MATERIA CASCADE CONSTRAINT
DROP TABLE L_MATERIA CASCADE CONSTRAINT

CREATE TABLE L_EDITORIAL (
    COD_EDITORIAL VARCHAR2(7) PRIMARY KEY,
    NOMBRE_ED VARCHAR2(30) NOT NULL CHECK (NOMBRE_ED = UPPER(NOMBRE_ED)),
    DIRECCION_ED VARCHAR2(40),
    LOCALIDAD_ED VARCHAR2(35),
    COD_POSTAL_ED NUMBER(5),
    PROVINCIA_ED VARCHAR2(30),
    TELEFONO_ED NUMBER(9),
    FAX_ED NUMBER(9),
    EMAIL_ED VARCHAR2(50)
);

CREATE TABLE L_MATERIA (
    COD_MATERIA VARCHAR2(4) PRIMARY KEY,
    DES_MATERIA VARCHAR2(30) NOT NULL CHECK (DES_MATERIA = UPPER(DES_MATERIA))
);

CREATE TABLE L_PERSONA (
    DNI VARCHAR2(9) PRIMARY KEY,
    NOMBRE_PER VARCHAR2(40) NOT NULL CHECK (NOMBRE_PER = UPPER(NOMBRE_PER)),
    DIRECCION_PER VARCHAR2(40),
    LOCALIDAD_PER VARCHAR2(35),
    COD_POSTAL_PER NUMBER(5),
    PROVINCIA_PER VARCHAR2(30),
    TELEFONO_PER NUMBER(9),
    FAX_PER NUMBER(9),
    EMAIL_PER VARCHAR2(50),
    CARNET NUMBER(5)
);

CREATE TABLE L_LIBRO (
    COD_LIBRO VARCHAR2(5) PRIMARY KEY,
    TITULO VARCHAR2(50),
    ANIO_PUBLIC VARCHAR2(4),
    NRO_PAG NUMBER(5) CHECK (NRO_PAG < 50000),
    TRADUCTOR VARCHAR2(60),
    IDIOMA VARCHAR2(15),
    NRO_COPIAS NUMBER(2) CHECK (NRO_COPIAS BETWEEN 1 AND 10),
    COD_EDITORIAL VARCHAR2(7),
    AUTOR VARCHAR2(70) NOT NULL,
    PRECIO_LIBRO NUMBER(6),
    CONSTRAINT fk_libro_editorial FOREIGN KEY (COD_EDITORIAL) REFERENCES L_EDITORIAL(COD_EDITORIAL)
);

CREATE TABLE L_LIBRO_MATERIA (
    COD_LIBRO VARCHAR2(5),
    COD_MATERIA VARCHAR2(4),
    CONSTRAINT pk_libro_materia PRIMARY KEY (COD_LIBRO, COD_MATERIA),
    CONSTRAINT fk_libro_materia_libro FOREIGN KEY (COD_LIBRO) REFERENCES L_LIBRO(COD_LIBRO),
    CONSTRAINT fk_libro_materia_materia FOREIGN KEY (COD_MATERIA) REFERENCES L_MATERIA(COD_MATERIA)
);

CREATE TABLE L_PRESTAMO (
    DNI VARCHAR2(9),
    COD_LIBRO VARCHAR2(5),
    FECHA_SALIDA DATE,
    FECHA_ENTREGA DATE,
    DEVUELTO CHAR(1) CHECK (DEVUELTO IN ('S', 'N')),
    CONSTRAINT pk_prestamo PRIMARY KEY (DNI, COD_LIBRO, FECHA_SALIDA),
    CONSTRAINT fk_prestamo_persona FOREIGN KEY (DNI) REFERENCES L_PERSONA(DNI),
    CONSTRAINT fk_prestamo_libro FOREIGN KEY (COD_LIBRO) REFERENCES L_LIBRO(COD_LIBRO)
);

-- Inserción en L_EDITORIAL
INSERT INTO L_EDITORIAL VALUES ('ED001', 'EDITORIAL PLANETA', 'Calle Falsa 123', 'Barcelona', 08001, 'Barcelona', 934567890, 934567891, 'contacto@planeta.com');
INSERT INTO L_EDITORIAL VALUES ('ED002', 'ALFAGUARA', 'Avenida Real 45', 'Madrid', 28013, 'Madrid', 915555555, 915555556, 'info@alfaguara.es');

-- Inserción en L_MATERIA
INSERT INTO L_MATERIA VALUES ('MAT1', 'LITERATURA');
INSERT INTO L_MATERIA VALUES ('MAT2', 'CIENCIA FICCIÓN');

-- Inserción en L_PERSONA
INSERT INTO L_PERSONA VALUES ('12345678A', 'MARÍA LÓPEZ', 'Calle Sol 5', 'Sevilla', 41001, 'Sevilla', 955123456, 955123457, 'maria@email.com', 10001);
INSERT INTO L_PERSONA VALUES ('98765432B', 'JUAN GARCÍA', 'Plaza Mayor 7', 'Valencia', 46002, 'Valencia', 963987654, 963987655, 'juan@email.com', 10002);
INSERT INTO L_PERSONA VALUES ('11223344B', 'ANA MARTÍNEZ', 'Calle Gran Vía 22', 'Madrid', 28013, 'Madrid', 914455667, 914455668, 'ana@email.com', 10003);
INSERT INTO L_PERSONA VALUES ('55667788C', 'CARLOS SÁNCHEZ', 'Paseo de Gracia 100', 'Barcelona', 08008, 'Barcelona', 936600112, 936600113, 'carlos@email.com', 10004);

-- Inserción en L_LIBRO
INSERT INTO L_LIBRO VALUES ('L001', 'EL QUIJOTE', '1605', 863, 'MIGUEL DE CERVANTES', 'ESPAÑOL', 5, 'ED001', 'MIGUEL DE CERVANTES', 2990);
INSERT INTO L_LIBRO VALUES ('L002', '1984', '1949', 328, 'RAFAEL ABELLA', 'ESPAÑOL', 8, 'ED002', 'GEORGE ORWELL', 2499);
INSERT INTO L_LIBRO VALUES ('L003', 'CIEN AÑOS DE SOLEDAD', '1967', 471, 'GREGORY RABASSA', 'ESPAÑOL', 7, 'ED001', 'GABRIEL GARCÍA MÁRQUEZ', 3499);
INSERT INTO L_LIBRO VALUES ('L004', 'LA SOMBRA DEL VIENTO', '2001', 563, '-', 'ESPAÑOL', 4, 'ED002', 'CARLOS RUIZ ZAFÓN', 4199);

-- Inserción en L_LIBRO_MATERIA (relación libro-materia)
INSERT INTO L_LIBRO_MATERIA VALUES ('L001', 'MAT1');
INSERT INTO L_LIBRO_MATERIA VALUES ('L002', 'MAT2');
INSERT INTO L_LIBRO_MATERIA VALUES ('L003', 'MAT1');
INSERT INTO L_LIBRO_MATERIA VALUES ('L004', 'MAT2');

-- Inserción en L_PRESTAMO
INSERT INTO L_PRESTAMO VALUES ('12345678A', 'L001', '10/05/2025', '17/05/2025', 'S');
INSERT INTO L_PRESTAMO VALUES ('98765432B', 'L002', '05/05/2025', '13/05/2025', 'N');
INSERT INTO L_PRESTAMO VALUES ('11223344B', 'L003', '01/05/2025', '08/05/2025','N');
INSERT INTO L_PRESTAMO VALUES ('11223344B', 'L004', '06/05/2025', '14/05/2025', 'S');
INSERT INTO L_PRESTAMO VALUES ('11223344B', 'L002', '28/04/2025', '05/05/2025', 'N');

//Ejercicio 1//

ACCEPT codiPersona PROMPT 'Introduce el dni de x persona'

DECLARE
    dniClien l_persona.dni%TYPE;
    nume NUMBER;
    CURSOR cursoPrestamo (cod l_prestamo.dni%TYPE) IS SELECT l_prestamo.fecha_entrega, l_prestamo.devuelto, l_libro.precio_libro
    FROM l_prestamo JOIN l_libro ON l_libro.cod_libro = l_prestamo.cod_libro
    WHERE l_libro.cod_libro = l_prestamo.cod_libro AND l_prestamo.dni = cod;
    
    entrega l_prestamo.fecha_entrega%TYPE;
    precio l_libro.precio_libro%TYPE;
    devuelto l_prestamo.devuelto%TYPE;
    numeLibroMulta NUMBER := 0;
    numeLibroNoMulta NUMBER := 0;
    Total := 0;
BEGIN
    SELECT dni INTO dniClien FROM l_persona WHERE dni = '&codiPersona';
    SELECT COUNT(*) INTO nume FROM l_prestamo WHERE dni = dniClien;
    IF (nume !=0) THEN 
    OPEN cursoPrestamo(dniClien)
    LOOP
    FETCH cursoPrestamo INTO entrega, devuelto, precio;
    EXIT WHEN cursoPrestamo%NOTFOUND;
    IF(devuelto) THEN
    numeLibroNoMulta := numeLibroNoMulta + 1;
    ELSE
    IF(entrega - SYSDATE < 0) THEN
    numeLibroMulta := numeLibroMulta + 1;
    total := total + (SYSDATE - entrega) + (precio/100);
    ELSE
    numeLibroMulta := numeLibroMulta + 1;
    END IF;
    END LOOP;
    CLOSE cursoPrestamo;
    dbms_output.put_line('Libros con Multa' || numeLibroMulta);
    dbms_output.put_line('Libros sin Multa' || numeLibroNoMulta);
    dbms_output.put_line('Multa Total' || numeLibroMulta);
    ELSE
    dbms_output.put_line('No existen Libros prestados');
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN 
    dbms_output.put_line('Ese dni no existe');
END;


//Ejercicio 2//

CREATE TABLE err_tablas(
codiError NUMBER PRIMARY KEY;
mensaje VARCHAR(50) NOT NULL;
tabla VARCHAR(20) NOT NULL;
fecha_error DATE NOT NULL;
clave VARCHAR(10) NOT NULL;
 
CONSTRAINT 
);

ACCEPT codiPersona PROMPT 'Introduce el dni de x persona'

DECLARE
    dniClien l_persona.dni%TYPE;
    nume NUMBER;
    CURSOR cursoPrestamo (cod l_prestamo.dni%TYPE) IS SELECT l_prestamo.fecha_entrega, l_prestamo.devuelto, l_libro.precio_libro
    FROM l_prestamo JOIN l_libro ON l_libro.cod_libro = l_prestamo.cod_libro
    WHERE l_libro.cod_libro = l_prestamo.cod_libro AND l_prestamo.dni = cod;
    
    entrega l_prestamo.fecha_entrega%TYPE;
    precio l_libro.precio_libro%TYPE;
    devuelto l_prestamo.devuelto%TYPE;
    numeLibroMulta NUMBER := 0;
    numeLibroNoMulta NUMBER := 0;
    Total := 0;
BEGIN
    SELECT dni INTO dniClien FROM l_persona WHERE dni = '&codiPersona';
    SELECT COUNT(*) INTO nume FROM l_prestamo WHERE dni = dniClien;
    IF (nume !=0) THEN 
    OPEN cursoPrestamo(dniClien)
    LOOP
    FETCH cursoPrestamo INTO entrega, devuelto, precio;
    EXIT WHEN cursoPrestamo%NOTFOUND;
    IF(devuelto) THEN
    numeLibroNoMulta := numeLibroNoMulta + 1;
    ELSE
    IF(entrega - SYSDATE < 0) THEN
    numeLibroMulta := numeLibroMulta + 1;
    total := total + (SYSDATE - entrega) + (precio/100);
    ELSE
    numeLibroMulta := numeLibroMulta + 1;
    END IF;
    END LOOP;
    IF (numeLibroNoMulta = 0 AND numeLibroMulta = 0) THEN
    INSERT INTO err_tablas VALUES (2, ' No existen libros no devueltos', 'l_persona' , SYSDATE , 'dni');
    ELSE IF (numeLibroMulta = 0) THEN
    INSERT INTO err_tablas VALUES (3, ' No existen multas para ese lector', 'l_persona' , SYSDATE , 'dni');
    CLOSE cursoPrestamo;
    dbms_output.put_line('Libros con Multa' || numeLibroMulta);
    dbms_output.put_line('Libros sin Multa' || numeLibroNoMulta);
    dbms_output.put_line('Multa Total' || total);
    ELSE
    dbms_output.put_line('No existen Libros prestados');
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN 
    dbms_output.put_line('Ese dni no existe');
    INSERT INTO err_tablas VALUES (1, ' No existe ese lector', 'l_persona', SYSDATE, 'dni');
    WHEN EXCEPTION THEN
    dbms_output.put_line('Error');
END;

//Ejercicio 3//

CREATE TABLE multa(
dni VARCHAR(10),
cod_libro VARCHAR(10),
fecha_salida DATE,

CONSTRAINT pk_multa PRIMARY KEY ( dni, cod_libro, fecha_salida ),
CONSTRAINT fk_multa_dni FOREIGN KEY( dni ) REFERENCES l_persona ( dni ),
CONSTRAINT fk_multa_libro FOREIGN KEY( cod_libro ) REFERENCES l_libro( cod_libro )
);

ACCEPT fecha_1 PROMPT ('Introduce la primera fecha');
ACCEPT fecha_2 PROMPT ('Introduce la segunda fecha');

DECLARE
    aux DATE := '&fecha_1';
    fech1 DATE := 'fecha_1';
    fech2 DATE := 'fecha_2';
    dni multa.dni%TYPE;
    cod_libro multa.cod_libro%TYPE;
    fecha_salida multa.fecha_salida%TYPE;
    CURSOR cursoLectores (f1 DATE, F2 DATE) IS SELECT dni FROM l_prestamo WHERE fecha_salida > f1 AND fecha_entrega < f2 AND (fecha_entrega < SYSDATE) HAVING COUNT(*) >=2 GROUP BY dni;
    nume NUMBER := 0;
BEGIN
DELETE FROM multa;
DELETE FROM noMulta;

IF( fech1 > fech2 ) THEN
fech1 := fech2;
fech2 := aux;
END IF;
OPEN cursoLectores(fech1, fech2);
LOOP
FETCH cursoLectores INTO dni, cod_libro, fecha_salida;
EXIT WHEN cursoLectores%NOTFOUND;
nume := nume + 1;
END LOOP;
IF (nume = 0) THEN
dbms_output.put_line('No existen lectores en esas fechas');
ELSE IF;
END;





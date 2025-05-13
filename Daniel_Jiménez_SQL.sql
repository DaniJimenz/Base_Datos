CREATE TABLE Estrella 
(
    Nombre VARCHAR2(50) PRIMARY KEY,
    Direcciï¿½n VARCHAR2(100) NOT NULL UNIQUE,
    Sexo VARCHAR2(1) CHECK (Sexo IN ('H', 'M')),
    Fecha_Nacimiento Date 
);

CREATE TABLE Estudio
(
  Nombre VARCHAR2(50) PRIMARY KEY,
  Direcciï¿½n VARCHAR2(100) NOT NULL UNIQUE
);

CREATE TABLE Pelï¿½cula
(
    Titulo VARCHAR2(50),
    Anio NUMBER(4,0), CHECK (anio > 1900),
    Duraciï¿½n NUMERIC(3,0),
    Nombre_Estudio VARCHAR2(50),
    
    CONSTRAINT pk_peli PRIMARY KEY(Titulo, anio),
    CONSTRAINT fk_nom_estu FOREIGN KEY(Nombre_Estudio) REFERENCES Estudio(nombre)
);

CREATE TABLE Protagoniza
(
    Titulo_Pelicula VARCHAR2(30),
    Anio_Pelicula NUMBER(4,0),
    Nombre_Estrella VARCHAR2(50),
    
    CONSTRAINT pk_protago PRIMARY KEY(Titulo_Pelicula,Anio_Pelicula,Nombre_Estrella),
    CONSTRAINT fk_prota_peli FOREIGN KEY(Titulo_Pelicula,Anio_Pelicula) REFERENCES Pelicula(Titulo, Anio),
    CONSTRAINT fk_prota_estre FOREIGN KEY(Nombre_Estrella) REFERENCES Estrella(Nombre)
);

CREATE TABLE Persona 
(
    Nombre VARCHAR2(50) PRIMARY KEY,
    Calle VARCHAR2(40) NOT NULL,
    Ciudad VARCHAR(20) NOT NULL
);

CREATE TABLE Trabaja
(
    Nombre_Persona VARCHAR(50) PRIMARY KEY,
    Nombre_Compania VARCHAR(100) NOT NULL,
    Salario NUMBER(4,0) DEFAULT (1000.00),
    
    CONSTRAINT fk_traba_perso FOREIGN KEY (Nombre_Persona) REFERENCES Persona(Nombre),
    CONSTRAINT fk_tra_comp FOREIGN KEY (Nombre_Compania) REFERENCES Compania(Nombre_Compa)
);

CREATE TABLE Compania
(
    Nombre_Compania VARCHAR2(100) PRIMARY KEY,
    Ciudad VARCHAR2(20) NOT NULL
);

CREATE TABLE Dirige
(
    Nombre_Persona VARCHAR2(50),
    Nombre_Director VARCHAR(50),
    
    CONSTRAINT pk_diri PRIMARY KEY (Nombre_persona, Nombre_Director),
    CONSTRAINT fk_trabajador FOREIGN KEY (Nombre_Persona) REFERENCES Persona(Nombre),
    CONSTRAINT fk_director FOREIGN KEY (Nombre_Director) REFERENCES Persona(Nombre)
):

CREATE TABLE Profesor
(
    rfc VARCHAR2(50) PRIMARY KEY,
    nombre VARCHAR2(50),
    direccion VARCHAR2(40) NOT NULL UNIQUE,
    telefono NUMBER(9,0),
    cod_depto VARCHAR2(20) NOT NULL UNIQUE,
    cod_centro VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE Alumno 
(
    control VARCHAR2(50) PRIMARY KEY,
    nombre VARCHAR2(50),
    direccion VARCHAR2(40)NOT FULL UNIQUE,
    control_del VARCHAR(
);

CREATE TABLE Departamento
(
    cod_depto NUMBER(3,0) PRIMARY KEY,
    nombre VARCHAR2(50) NOT NULL
);
CREATE TABLE Familiar 
(
    dni VARCHAR(9),
    nombre VARCHAR2(50),
    parentesco VARCHAR2(5) CHECK(parentesco IN ('hijo', 'padre')),
    
    CONSTRAINT pk_familiar PRIMARY KEY (dni, nombre),
    CONSTRAINT fk_fam_trab FOREIGN KEY (dni) REFERENCES trabajador(dni),
);
CREATE TABLE Trabajador
(
    dni VARCHAR2(9) PRIMARY KEY,
    nombre VARCHAR2(50)NOT NULL,
    direccion VARCHAR2(100), 
    cod_depto NUMBER(3,0),
    
    CONSTRAINT fk_tra_dpto FOREIGN KEY (cod_dpto)REFERENCES departamento (cod_dpto)
);
CREATE TABLE Proyecto
(
    nombre_proyecto VARCHAR2(100) PRIMARY KEY,
    presupuesto NUMBER (7,0), DEFAULT 5000,
    cod_depto NUMBER(3,0)
    
    CONSTRAINT fk_proy FOREIGN KEY (cod_dpto) REFeRENCES departamento(cod_dpto),
);
CREATE TABLE Trabaja
(
    dni VARCHAR2(9),
    nombre_proy VARCHAR(50),
    n_horas NUMBER(4) DEFAULT NULL CHECK (n_horas >=50),
    
    CONSTRAINT pk_trabaja PRIMARY KEY (dni, nombre_proy),
    CONSTRAINT fk_trabaja_trab FOREIGN KEY (dni) REFERENCES trabajador(dni),
    CONSTRAINT fk_trab_proy FOREIGN KEY (nombre_proy) REFERENCES proyecto(nombre_proyecto)
);

CREATE TABLE linea 
(
    nombre VARCHAR2 (50) PRIMARY KEY,
    inicio VARCHAR2 (5),
    fin (5),
    
    
);
CREATE TABLE tren
(
    id_tren NUMBER(5) PRIMARY KEY,
    vagones NUMBER(1) CHECK (vagones >=1 AND vagones <=3),
    
    CONSTRAINT fk_tren_linea FOREIGN KEY (linea) REFERENCES (linea(nombre),
    CONSTRAINT fk_acc_est FOREIGN KEY (id_e) REFERENCES estacion(id_e)
);
CREATE TABLE cochera
(
    id_cochera VARCHAR2 (20) PRIMARY KEY,
    metros NUMBER (4,2) CHECK (metros > 100),
    estacion NUMBER(5),
    
     CONSTRAINT fk_coch_est FOREIGN KEY (estacion) REFERENCES estacion(id_estacion),
);
CREATE TABLE acceso
(
    id_estacion NUMBER (5),
    num_acceso NUMBER (2),
    discapacitados  VARCHAR2(2) NOT NULL CHECK(parentesco IN ('N', 'S')),
    
    CONSTRAINT pk_acceso PRIMARY KEY (id_e, num_acceso),
    CONSTRAINT fk_acc_est FOREIGN KEY (id_e) REFERENCES estacion(id_e)
);
CREATE TABLE estacion
(
    id_estacion NUMBER (5) PRIMARY KEY,
    horario VARCHAR2 (5) NOT NULL,
    direcciï¿½n VARCHAR (20) NOT NULL
);
CREATE TABLE recorridos
(
    linea VARCHAR2 (30),
    estacion NUMBER (5),
    orden NUMBER (2)
    
    CONSTRAINT pk_reco PRIMARY KEY (linea, estacion),
    CONSTRAINT fk_reco_linea FOREIGN KEY (linea) REFERENCES linea(nombre),
    CONSTRAINT fk_reco_est FOREIGN KEY (estacion) REFERENCES estacion(id_e),
);
CREATE TABLE clientes
(
    DNI VARCHAR2(9) PRIMARY KEY,
    nombre VARCHAR2(50) NOT NULL,
    fecha_nac DATE NOT NULL,
    direccion VARCHAR2(100),
    sexo VARCHAR2(1) CHECK (sexo IN ('H', 'M'))
);

CREATE TABLE productos
(
    cod_prod NUMERIC(5) PRIMARY KEY,
    nombre VARCHAR2(50) UNIQUE NOT NULL,
    stock NUMERIC(6) NOT NULL,
    precio NUMERIC(4,2) NOT NULL,
    tipo VARCHAR2(20)
);
CREATE TABLE compras
(
    cliente VARCHAR2(9),
    producto NUMERIC(5),
    fecha DATE,
    cantidad NUMERIC(3) NOT NULL,
   
    CONSTRAINT pk_compras PRIMARY KEY (cliente, producto, fecha),
    CONSTRAINT fk_compras_clientes FOREIGN KEY (cliente) REFERENCES clientes(DNI),
    CONSTRAINT fk_compras_producto FOREIGN KEY (producto) REFERENCES productos(cod_prod)
);

CREATE TABLE tienda
(
    cod_tienda NUMERIC(2) PRIMARY KEY,
    metros NUMERIC(4,2) NOT NULL
);

CREATE TABLE trabajadores
(
    cod_trab NUMERIC(3) PRIMARY KEY,
    nombre VARCHAR2(50) NOT NULL,
    categoria VARCHAR2(20) NOT NULL,
    area VARCHAR2(20) NOT NULL,
    tienda NUMERIC(2),
   
    CONSTRAINT fk_trabajadores_tienda FOREIGN KEY (tienda) REFERENCES tienda(cod_tienda)
);

CREATE TABLE oferta
(
    cod_of NUMERIC(2) PRIMARY KEY,
    tienda NUMERIC(2),
    producto NUMERIC(5),
    trabajador NUMERIC(3),
    tipo VARCHAR2(20) NOT NULL,
    inicio DATE NOT NULL,
    fin DATE NOT NULL,
   
    CONSTRAINT fk_oferta_tienda FOREIGN KEY (tienda) REFERENCES tienda(cod_tienda),
    CONSTRAINT fk_oferta_producto FOREIGN KEY (producto) REFERENCES productos(cod_prod),
    CONSTRAINT fk_oferta_trabajador FOREIGN KEY (trabajador) REFERENCES trabajadores(cod_trab)
);

ALTER TABLE clientes ADD
(
    telefono NUMERIC(9) CHECK (telefono>=600000000)
);

ALTER TABLE trabajadores ADD
(
    telefono NUMERIC(9) CHECK (telefono>=600000000)
);

ALTER TABLE productos
    DROP COLUMN stock

ALTER TABLE productos
    ADD stock NUMERIC(4) CHECK (stock>=0);
   
ALTER TABLE tienda ADD
(
    nombre VARCHAR2(20),
    localizacion VARCHAR2(20)
);

ALTER TABLE productos MODIFY
(
    precio DEFAULT(0) CHECK (precio>=0 AND precio<=10)
);
AFTER TABLE 

INSERT INTO clientes (dni, nombre, fecha_nac, direccion, sexo) VALUES 
('11111111Z', 'Lucï¿½a', '12/07/2002', 'Granada', 'M');
INSERT INTO clientes (dni, nombre, fecha_nac, direccion, sexo) VALUES 
('22222222B', 'Mï¿½nica', '18/12/2008', 'Jaï¿½n', 'M');
INSERT INTO clientes (dni, nombre, fecha_nac, direccion, sexo) VALUES 
('12345678C', 'Luis', '03/01/2005', 'Granada', 'H');
INSERT INTO clientes (dni, nombre, fecha_nac, direccion, sexo) VALUES 
('33333333R', 'Cï¿½sar', '08/09/2003', 'Granada', 'H');
INSERT INTO clientes (dni, nombre, fecha_nac, direccion, sexo) VALUES 
('55555555T', 'Roberto', '24/11/2008', 'Granada', 'H');

ALTER TABLE producto
MODIFY NUMBER(2,0);

ALTER TABLE producto
MODIFY precio NULL;

INSERT INTO productos (cod_prod, nombre, stock, precio, tipo) VALUES
(1, 'Lï¿½piz negro', 100, 0.75, '1');
INSERT INTO productos (cod_prod, nombre, stock, precio, tipo) VALUES
(2, 'Bolï¿½grafo azul', 85, NULL, '1');
INSERT INTO productos (cod_prod, nombre, stock, precio, tipo) VALUES
(3, 'Libreta A4', 60, 1.75, '2');
INSERT INTO productos (cod_prod, nombre, stock, precio, tipo) VALUES
(4, 'Cuaderno rubio', 50, 3.25, '2');
INSERT INTO productos (cod_prod, nombre, stock, precio, tipo) VALUES
(5, 'Corrector', 86, NULL, '3');
INSERT INTO productos (cod_prod, nombre, stock, precio, tipo) VALUES
(6, 'Goma Borrar', 150, 0.35, '3');

INSERT INTO compras (cliente, producto, fecha, cantidad) VALUES
('11111111Z', 1, '25/10/2023', 2);
INSERT INTO compras (cliente, producto, fecha, cantidad) VALUES
('12345678C', 1, '26/10/2023', 1);
INSERT INTO compras (cliente, producto, fecha, cantidad) VALUES
('11111111Z' 2, '25/10/2023', 4);
INSERT INTO compras (cliente, producto, fecha, cantidad) VALUES
('55555555T', 2, '26/10/2023', 3);
INSERT INTO compras (cliente, producto, fecha, cantidad) VALUES
('11111111Z', 2, '26/10/2023', 1);
INSERT INTO compras (cliente, producto, fecha, cantidad) VALUES
('12345678C', 4, '26/10/2023', 1);
INSERT INTO compras (cliente, producto, fecha, cantidad) VALUES
('33333333R', 2, '25/10/2023', 6);
INSERT INTO compras (cliente, producto, fecha, cantidad) VALUES
('11111111Z', 1, '30/10/2023', 5);
INSERT INTO compras (cliente, producto, fecha, cantidad) VALUES
('12345678C', 3, '2/11/2023', 2);
INSERT INTO compras (cliente, producto, fecha, cantidad) VALUES
('12345678C', 4, '30/10/2023', 1);
INSERT INTO compras (cliente, producto, fecha, cantidad) VALUES
('33333333R', 1, '25/10/2023', 4);
INSERT INTO compras (cliente, producto, fecha, cantidad) VALUES
('55555555T', 2, '30/10/2023', 3);
INSERT INTO compras (cliente, producto, fecha, cantidad) VALUES
('55555555T', 3, '30/10/2023', 1);
INSERT INTO compras (cliente, producto, fecha, cantidad) VALUES
('55555555T', 3, '02/11/2023', 2);
INSERT INTO compras (cliente, producto, fecha, cantidad) VALUES
('12345678C', 4, '02/11/2023', 2);

DELETE FROM compras;
DELETE FROM clientes WHERE direccion= 'Mï¿½laga';
DELETE FROM productos WHERE precio<1;
DELETE FROM cliente WHERE sexo= 'H';
DELETE FROM productos; 
DELETE FROM clientes;

DELETE FROM compra WHERE cantidad<3;

UPDATE clientes
SET fecha_nac='11/05/2002';
WHERE dni='11111111Z';

UPDATE producto
SET precio=1.25
stock = 125
WHERE nombre='Bolï¿½grafo azul';

UPDATE clientes
SET direccion='Malaga'
WHERE nombre='Monica';

UPDATE producto
SET precio = precio + 0,25;

UPDATE compra
SET cantidad = cantidad + 1
WHERE producto=2;

UPDATE producto
SET precio=1.25
WHERE tipo=1 OR tipo=2;

SELECT dni,nombre FROM clientes;
SELECT direccion FROM clientes;
SELECT * FROM clientes;
SELECT dni,nombre,fecha_nac,direccion,sexo FROM clientes;

SELECT nombre FROM cliente WHERE direccion='Granada';

SELECT nombre FROM cliente WHERE sexo='M';

SELECT nombre, dni FROM clientes WHERE direccion != 'Granada';

SELECT * FROM clientes WHERE nombre = 'Lucia';

SELECT nombre FROM productos
SELECT precio FROM productos
SELECT cod_prod, precio From productos
SELECT precio FROM productos WHERE tipo=2
SELECT * FROM productos WHERE cod_prod=4
SELECT * FROM productos WHERE precio>0.75
SELECT nombre FROM productos WHERE precio =<0.75 and >=1.25;

SELECT clientes FROM compras
SELECT clientes FROM compras WHERE producto=3
SELECT clientes FROM compras WHERE producto=1 AND cantidad>3
SELECT clientes, productos FROM compras WHERE cantidad>3
SELECT nombre, precio*1.21 FROM productos
SELECT nombre FROM producto WHERE precio IS NOT NULL
SELECT * FROM cliente WHERE direccion IS NOT NULL
SELECT direccion FROM cliente WHERE direccion IS NOT NULL
SELECT DISTINCT direccion FROM cliente WHERE direccion IS NOT NULL

CREATE TABLE duenios
(
    DNI VARCHAR2(9) PRIMARY KEY,
    nom VARCHAR2(50)
);

CREATE TABLE perros
(
    num NUMBER(4) PRIMARY KEY,
    nom VARCHAR2(20),
    dni_DUE VARCHAR(9),
    
    CONSTRAINT fk_perr_due FOREIGN KEY (dni_DUE) REFERENCES duenios(DNI)
);

INSERT INTO duenios VALUES ('11111111R', 'Rocio');
INSERT INTO duenios VALUES ('22222222D', 'Federico');
INSERT INTO duenios VALUES ('12345678P', 'Erica');
INSERT INTO duenios VALUES ('11131511R', 'Paloma');

INSERT INTO perros VALUES (1, '11111111Z', 'Coco');
INSERT INTO perros VALUES (2, '11123411R', 'Rot');
INSERT INTO perros VALUES (3, '55555555L', 'Moc');
INSERT INTO perros VALUES (4, '13344111R', 'Loc');

SELECT * FROM duenios ,perros WHERE dni=dni_DUE;

SELECT * FROM compras, productos WHERE cod_prod = producto

SELECT compras.*, clientes.nombre FROM clientes, compras WHERE producto > 4 AND cod_prod = 2
SELECT compras.*, clientes.nombre FROM clientes, compras WHERE producto < 3
SELECT compras, clientes.nombre FROM clientes, compras WHERE nombre = 'Monica' 

SELECT compras.*, producto.nombre FROM compras, clientes WHERE dni=cliente;

SELECT * FROM cliente, compra WHERE cantidad > 4 AND producto=2;

SELECT producto.nombre FROM compra, producto WHERE cantidad < 3 AND cod=producto;

SELECT DISTINCT producto.* FROM compra, producto, cliente WHERE compra.cliente=cliente.dni AND compra.producto=producto.cod_prod AND cliente.nombre='Monica'

CREATE TABLE trabajadores
(
    codigo NUMERIC(10) PRIMARY KEY,
    nombre VARCHAR2(50), 
    categoria VARCHAR2(30),
    area NUMERIC(4,2) CHECK ( area > 100),
    tienda VARCHAR2(30)
);

CREATE TABLE tiendas 
(
    cod_tienda NUMERIC(20) PRIMARY KEY,
    metros NUMBER(4,4) 
);
CREATE TABLE ofertas
(
    cod_of NUMERIC(20) PRIMARY KEY,
    tienda VARCHAR2(30),
    producto  NUMERIC(5),
    trabajador VARCHAR2(30),
    tipo_of VARCHAR(20) NOT NULL,
    inicio VARCHAR2(20),
    fin VARCHAR2(20)
);

INSERT INTO trabajadores (codigo, nombre, categoria, area, tienda) VALUES (18, 'Pedro', 'Encargado','cajas', 1);
INSERT INTO trabajadores (codigo, nombre, categoria, area, tienda) VALUES (21, 'Elena', 'Encargado','reposicion', 1);
INSERT INTO trabajadores (codigo, nombre, categoria, area, tienda) VALUES (35, 'Manuel', 'suplente','reposicion', 3);

INSERT INTO tiendas (cod_tienda, metros) VALUES (1,500);
INSERT INTO tiendas (cod_tienda, metros) VALUES (2,800);
INSERT INTO tiendas (cod_tienda, metros) VALUES (3,250);

INSERT INTO ofertas (cod_of, tienda, producto, trabajador, tipo_of, inicio, fin) VALUES (1,1,2,18,1,'septiembre','octubre');
INSERT INTO ofertas (cod_of, tienda, producto, trabajador, tipo_of, inicio, fin) VALUES (2,2,6,null,1,'octubre','noviembre');
INSERT INTO ofertas (cod_of, tienda, producto, trabajador, tipo_of, inicio, fin) VALUES (3,3,6,35,2,'julio','agosto');
INSERT INTO ofertas (cod_of, tienda, producto, trabajador, tipo_of, inicio, fin) VALUES (4,3,3,35,3,'octubre','diciembre');

SELECT productos.nombre FROM productos, ofertas WHERE productos.oferta=producto.cod WHERE producto.nombre;
SELECT oferta.cod FROM oferta, producto WHERE producto.nombre='Boligrafo azul' AND oferta.producto=producto.cod;
SELECT trabajadores.nombre, trabajadores.categoria FROM trabajadores, tienda WHERE trabajadores.tienda=tienda.cod_tienda AND tienda.cod_tienda=1;
SELECT oferta.* FROM oferta, tienda, trabajadores WHERE oferta.tienda=tienda.cod_tienda AND trabajadores.tienda=tienda.cod_tienda AND trabajadores.nombre='Elena';


SELECT nombre.productos FROM ofertas, productos WHERE oferta.producto=productos.cod_prod AND inicio<'septiembre' AND fin>'octubre';
SELECT nombre.productos FROM tiendas, productos, oferta  WHERE oferta.producto=productos.cod_prod AND oferta.tienda=tienda.cod_tienda AND tienda.metros>500;
SELECT DISTINCT nombre.productos FROM clientes, productos, compras WHERE productos.cod_prod=productos.compras AND compras.cliente=cliente.DNI AND clientes.direccion='Granada'
SELECT direccion.clientes FROM clientes, productos, compras WHERE productos.cod_prod=productos.compras AND compras.cliente=cliente.DNI AND compras.cantidad>7 AND productos.nombre='Boligrafo azul';

SELECT nombres.clientes, compras.* FROM clientes, compras WHERE clientes.dni=clientes.compras AND direccion='Granada' ORDER BY clientes.nombre;
SELECT tienda.* FROM tienda,oferta,producto WHERE precio IS NULL AND tienda.cod=oferta.tienda AND oferta.producto=producto.cod;
SELECT nombre.productos, productos.precio FROM oferta, productos WHERE productos.cod_prod=producto.oferta AND producto.tipo=2;
SELECT DISTINCT clientes.* FROM clientes, compras, productos WHERE productos.cod_prod=producto.compras AND compras.clientes=clientes.DNI AND productos.nombre='Boligrafo Azul' ORDER BY clientes.fech_nac;
SELECT clientes.nombre, precio.cantidad*1.21 FROM clientes, compras, productos WHERE productos.cod_prod= compras.producto AND compras.clientes=clientes.DNI AND clientes.direccion='Mï¿½laga'; 
SELECT DISTINCT cliente.nombre FROM cliente,producto, compra WHERE dni=compra.cliente AND producto.cod=compra.producto AND precio IS NOT NULL;
SELECT oferta.codigo, oferta.tienda, producto.nombre, trabajador.nombre, oferta.tipo, inicio,fin
FROM oferta, trabajador, tienda, producto
WHERE producto.cod=oferta.producto AND trabajador.cod=oferta.trabajador
AND tienda.codigo=oferta.tienda AND ,metros>500;

CREATE TABLE coche
(
    matricula VARCHAR2(10) PRIMARY KEY,
    modelo VARCHAR2(15),
    marca VARCHAR2(15),
    color VARCHAR2(15) NOT NULL
);

CREATE TABLE persona
(
    id NUMERIC(3) CHECK (id > 0) PRIMARY KEY, 
    nombre VARCHAR2(25) NOT NULL,
    tlf VARCHAR2(10) UNIQUE
);

CREATE TABLE dueï¿½os
(
    matricula VARCHAR2(10),
    persona NUMERIC(3),
    f_ini DATE NOT NULL,
    f_fin DATE,
    
    CONSTRAINT pk_dueï¿½os PRIMARY KEY(matricula, persona),
    CONSTRAINT fk_dueï¿½os_coche FOREIGN KEY (matrï¿½cula) REFERENCES coche(matricula),
    CONSTRAINT fk_dueï¿½os_persona FOREIGN KEY (persona) REFERENCES persona(id)
);

INSERT INTO coche (matricula, modelo, marca, color) VALUES ('1111AAA', 'Civic', 'Honda', 'Rojo');
INSERT INTO coche (matricula, modelo, marca, color) VALUES ('2222BBB', 'Accord', 'Honda', 'Azul');
INSERT INTO coche (matricula, modelo, marca, color) VALUES ('3333CCC', 'Camry', 'Toyota', 'Verde');
INSERT INTO coche (matricula, modelo, marca, color) VALUES ('4444DDD', 'Corolla', 'Toyota', 'Negro';
INSERT INTO coche (matricula, modelo, marca, color) VALUES ('5555EEE', 'Fusion', 'Ford', 'Rojo');
INSERT INTO coche (matricula, modelo, marca, color) VALUES ('6666FFF', 'Mustang', 'Ford', 'Negro');
INSERT INTO coche (matricula, modelo, marca, color) VALUES ('7777GGG', 'Cruze', 'Chevrolet', 'Rojo');
INSERT INTO coche (matricula, modelo, marca, color) VALUES ('8888HHH', 'Malibu', 'Chevrolet', 'Blanco';
INSERT INTO coche (matricula, modelo, marca, color) VALUES ('9999III', 'Sentra', 'Nissan', 'Negro');
INSERT INTO coche (matricula, modelo, marca, color) VALUES ('1010JJJ', 'Altina', 'Nissan', 'Negro');

INSERT INTO persona (id,nombre,tlf) VALUES (1, 'Juan Pï¿½rez', 612345678);
INSERT INTO persona (id,nombre,tlf) VALUES (2, 'Marï¿½a Rodrï¿½guez', 655432189);
INSERT INTO persona (id,nombre,tlf) VALUES (3, 'Carlos Lï¿½pez', 699876543);
INSERT INTO persona (id,nombre,tlf) VALUES (4, 'Ana Martï¿½nez', 667123456);
INSERT INTO persona (id,nombre,tlf) VALUES (5, 'Pedro Garcï¿½a', 688987654);

INSERT INTO dueï¿½os (matricula, persona, f_ini, f_fin) VALUES ('1111AAA', 1, '01/01/2023', '15/05/2023');
INSERT INTO dueï¿½os (matricula, persona, f_ini, f_fin) VALUES ('2222BBB', 2, '10/05/2022', '28/02/2023');
INSERT INTO dueï¿½os (matricula, persona, f_ini, f_fin) VALUES ('3333CCC', 3, '15/12/2022', '20/09/2023');
INSERT INTO dueï¿½os (matricula, persona, f_ini, f_fin) VALUES ('4444DDD', 4, '05/03/2023', null);
INSERT INTO dueï¿½os (matricula, persona, f_ini, f_fin) VALUES ('5555EEE', 5, '20/08/2022', '10/01/2023');
INSERT INTO dueï¿½os (matricula, persona, f_ini, f_fin) VALUES ('6666FFF', 1, '01/04/2023', null);
INSERT INTO dueï¿½os (matricula, persona, f_ini, f_fin) VALUES ('7777GGG', 2, '25/06/2022', '18/04/2023');
INSERT INTO dueï¿½os (matricula, persona, f_ini, f_fin) VALUES ('8888HHH', 3, '30/11/2022', '12/07/2023');
INSERT INTO dueï¿½os (matricula, persona, f_ini, f_fin) VALUES ('9999III', 4, '10/02/2023', null);
INSERT INTO dueï¿½os (matricula, persona, f_ini, f_fin) VALUES ('1010JJJ', 5, '15/09/2022', '22/03/2023');
INSERT INTO dueï¿½os (matricula, persona, f_ini, f_fin) VALUES ('1111AAA', 2, '20/05/2023', null);
INSERT INTO dueï¿½os (matricula, persona, f_ini, f_fin) VALUES ('2222BBB', 3, '10/03/2023', null);
INSERT INTO dueï¿½os (matricula, persona, f_ini, f_fin) VALUES ('3333CCC', 4, '05/10/2023', null);
INSERT INTO dueï¿½os (matricula, persona, f_ini, f_fin) VALUES ('4444DDD', 5, '20/01/2023', '08/11/2023');
INSERT INTO dueï¿½os (matricula, persona, f_ini, f_fin) VALUES ('5555EEE', 1, '15/04/2023', null);

SELECT nombre FROM persona;
SELECT tlf FROM persona WHERE nombre = 'Juan Pï¿½rez';
SELECT persona FROM dueï¿½o WHERE matricula = '1111AAA' AND f_fin IS NULL;
SELECT DISTINCT color FROM coche WHERE marca = 'Honda';
SELECT marca, modelo FROM coche ORDER BY marca; 

SELECT nombre FROM dueï¿½o, persona WHERE dueï¿½o.persona=persona.id AND f_fin IS NULL; 
SELECT matricula, f_ini FROM coche, persona WHERE nombre.persona = 'Carlos Lopez';
SELECT f_ini FROM coche, dueï¿½o WHERE color.coche = 'Rojo';
SELECT color FROM coche, persona WHERE nombre.persona = 'Ana Martï¿½nez';
SELECT nombre FROM dueï¿½o, coche, persona WHERE dueï¿½o.matricula=coche.matricula

CREATE TABLE pokemon
(
    id NUMERIC(4) PRIMARY KEY,
    nombre VARCHAR2(20) NOT NULL,
    altura NUMERIC(4,1),
    peso NUMERIC(4, 1),
    categoria VARCHAR2(70),
    habilidad VARCHAR2(20)
);

ALTER TABLE pokemon MODIFY
(
    habilidad VARCHAR2(50)
);

CREATE TABLE tipo
(
    id NUMERIC(2) PRIMARY KEY,
    nombre VARCHAR2(15) NOT NULL
);

CREATE TABLE pok_tipo
(
    pokemon NUMERIC(4),
    tipo NUMERIC(2),
   
    CONSTRAINT pk_pok_tipo PRIMARY KEY (pokemon, tipo),
    CONSTRAINT fk_pokemon FOREIGN KEY (pokemon) REFERENCES pokemon(id),
    CONSTRAINT fk_tipo FOREIGN KEY (tipo) REFERENCES tipo(id)
);

INSERT INTO pokemon VALUES (1,'Bulbasur',0.7,6.9,'Semilla','Espesura');
INSERT INTO pokemon VALUES (2,'Charmander',0.6,8.5,'Lagarto','Mar llamas');
INSERT INTO pokemon VALUES (3,'Squirtle',0.5,9,'Tortuguita','Torrente');
INSERT INTO pokemon VALUES (4,'Pikachu',0.4,6,'Raton','Electricidad estatica');
INSERT INTO pokemon VALUES (5,'Jigglypuff',0.5,5.5,'Globo','Cura');
INSERT INTO pokemon VALUES (6,'Gengar',1.5,40.5,'Sombra','Levitacion');
INSERT INTO pokemon VALUES (7,'Onix',8.8,210,'Serpiente roca','Cabeza roca');
INSERT INTO pokemon VALUES (8,'Machamp',1.6,130,'Super poder','Guts');
INSERT INTO pokemon VALUES (9,'Lapras',2.5,220,'Transporte','Absorbe agua');
INSERT INTO pokemon VALUES (10,'Snorlax',2.1,460,'Dormilon','Impasible');

INSERT INTO tipo VALUES (1,'Planta');
INSERT INTO tipo VALUES (2,'Fuego');
INSERT INTO tipo VALUES (3,'Agua');
INSERT INTO tipo VALUES (4,'Electrico');
INSERT INTO tipo VALUES (5,'Normal');
INSERT INTO tipo VALUES (6,'Fantasma');
INSERT INTO tipo VALUES (7,'Roca');
INSERT INTO tipo VALUES (8,'Lucha');
INSERT INTO tipo VALUES (9,'Hielo');
INSERT INTO tipo VALUES (10,'Veneno');

INSERT INTO pok_tipo VALUES (1,1);
INSERT INTO pok_tipo VALUES (2,2);
INSERT INTO pok_tipo VALUES (3,3);
INSERT INTO pok_tipo VALUES (4,4);
INSERT INTO pok_tipo VALUES (5,5);
INSERT INTO pok_tipo VALUES (6,6);
INSERT INTO pok_tipo VALUES (7,7);
INSERT INTO pok_tipo VALUES (8,8);
INSERT INTO pok_tipo VALUES (9,3);
INSERT INTO pok_tipo VALUES (9,9);
INSERT INTO pok_tipo VALUES (10,5);
INSERT INTO pok_tipo VALUES (6,10);

SELECT * FROM pokemon;
SELECT nombre, habilidad FROM pokemon WHERE peso>100;
SELECT nombre FROM pokemon WHERE habilidad='Levitacion';
SELECT nombre, categoria FROM pokemon WHERE categoria='Raton';
SELECT nombre FROM pokemon WHERE altura>1.5;
SELECT pokemon.nombre, tipo.nombre FROM pokemon, tipo, pok_tipo WHERE pokemon.id=pokemon AND tipo.id=tipo;
SELECT pokemon.nombre FROM pokemon, tipo, pok_tipo WHERE pokemon.id=pokemon AND tipo.id=tipo AND tipo.nombre='Agua';
SELECT id FROM pokemon WHERE peso<100 AND peso>50;
SELECT nombre FROM pokemon WHERE categoria='Semilla' OR categoria='Lagarto';
SELECT nombre FROM pokemon ORDER BY peso DESC;
SELECT nombre, peso, altura FROM pokemon ORDER BY peso DESC, altura ASC;
SELECT tipo.nombre FROM pokemon, tipo, pok_tipo WHERE pokemon.id=pokemon AND tipo.id=tipo AND pokemon.nombre='Lapras';
SELECT pokemon.nombre, tipo.nombre FROM pokemon, tipo, pok_tipo WHERE pokemon.id=pokemon AND tipo.id=tipo ORDER BY tipo.nombre;
SELECT pokemon.nombre, tipo.nombre FROM pokemon, tipo, pok_tipo WHERE pokemon.id=pokemon AND tipo.id=tipo AND tipo.nombre NOT IN ('Fuego','Fantasma','Planta');

INSERT INTO pok_tipo VALUES (1,10);

ALTER TABLE pokemon ADD forma VARCHAR2(20) CHECK (forma IN ('Cabeza','Cuadrupedo','Humanoide','Serpiente','Alado'));

UPDATE pokemon SET forma='Humanoide' WHERE id IN (8,10,3,4,6);
UPDATE pokemon SET forma='Serpiente' WHERE id IN (7);
UPDATE pokemon SET forma='Cabeza' WHERE id IN (5);
UPDATE pokemon SET forma='Cuadrupedo' WHERE id IN (1,2,9);

CREATE TABLE ataques
(
    id NUMERIC(3) PRIMARY KEY,
    nombre VARCHAR2(25) NOT NULL,
    tipo_id NUMERIC(2) NOT NULL,
    potencia NUMERIC(3),
    preci NUMERIC(3) CHECK (preci>0 AND preci<101),
    pp NUMERIC(2) CHECK (pp>0),
    categoria VARCHAR2(8) CHECK (categoria IN ('Fisico','Especial','Estado')),
   
    CONSTRAINT fk_tipo_id FOREIGN KEY (tipo_id) REFERENCES tipo(id)
);
CREATE TABLE pokemon_ataques
(
    pokemon NUMERIC(4),
    ataque NUMERIC(3),
    nivel NUMERIC(2) CHECK (nivel>0),
    metodo VARCHAR2(5) CHECK (metodo IN ('Nivel','Huevo','MT/MO','Tutor')),
   
    CONSTRAINT pk_pok_atq PRIMARY KEY (pokemon, ataque),
    CONSTRAINT fk_pok_atq_pokemon FOREIGN KEY (pokemon) REFERENCES pokemon(id),
    CONSTRAINT fk_pok_atq_ataque FOREIGN KEY (ataque) REFERENCES ataques(id)
);

INSERT INTO ataques VALUES (1,'Lanzallmas',2,90,100,15,'Especial');
INSERT INTO ataques VALUES (2,'Rayo',4,90,100,15,'Especial');
INSERT INTO ataques VALUES (3,'Terremoto',7,100,100,10,'Fisico');
INSERT INTO ataques VALUES (4,'Danza Espada',5,null,100,20,'Estado');
INSERT INTO ataques VALUES (5,'Surf',3,90,100,15,'Especial');
INSERT INTO ataques VALUES (6,'Placaje',5,40,100,35,'Fisico');
INSERT INTO ataques VALUES (7,'Rugido',5,null,100,20,'Estado');
INSERT INTO ataques VALUES (8,'Puï¿½o HIelo',9,75,100,15,'Fisico');

INSERT INTO pokemon_ataques VALUES (2,1,24,'Nivel');
INSERT INTO pokemon_ataques VALUES (2,4,null,'MT/MO');
INSERT INTO pokemon_ataques VALUES (3,6,1,'Nivel');
INSERT INTO pokemon_ataques VALUES (3,8,null,'MT/MO');
INSERT INTO pokemon_ataques VALUES (3,5,null,'MT/MO');
INSERT INTO pokemon_ataques VALUES (4,2,36,'Nivel');
INSERT INTO pokemon_ataques VALUES (4,5,null,'MT/MO');
INSERT INTO pokemon_ataques VALUES (4,6,10,'Nivel');
INSERT INTO pokemon_ataques VALUES (4,1,50,'Nivel');

select nombre from ataques where potencia>70 and preci>90;
select nombre from ataques where categoria='Especial';
select ataques.nombre from ataques, tipo where tipo.id=ataques.tipo_id and tipo.nombre='Normal' and categoria='Estado';
select ataques.nombre from ataques, pokemon_ataques where ataques.id=pokemon_ataques.ataque and metodo='MT/MO';
select pokemon.nombre, pokemon_ataques.nivel from pokemon, ataques, pokemon_ataques where ataques.id=pokemon_ataques.ataque and pokemon.id=pokemon_ataques.pokemon and ataques.nombre='Placaje';
select ataques.*, pokemon_ataques.nivel from pokemon, ataques, pokemon_ataques where ataques.id=pokemon_ataques.ataque and pokemon.id=pokemon_ataques.pokemon and pokemon.nombre='Charmander';
select ataques.*, pokemon_ataques.nivel from pokemon, ataques, pokemon_ataques where ataques.id=pokemon_ataques.ataque and pokemon.id=pokemon_ataques.pokemon and pokemon.nombre='Pikachu' and metodo='Nivel';
select pokemon.nombre from pokemon, ataques, pokemon_ataques, tipo where ataques.id=pokemon_ataques.ataque and pokemon.id=pokemon_ataques.pokemon and ataques.tipo_id=tipo.id and tipo.nombre='Fuego';
select pokemon.nombre from pokemon, ataques, pokemon_ataques where ataques.id=pokemon_ataques.ataque and pokemon.id=pokemon_ataques.pokemon and ataques.nombre='Lanzallmas' and peso>5;
INSERT INTO ataques VALUES (9,'Trueno',4,120,70,10,'Especial');
INSERT INTO pokemon_ataques VALUES (4,9,44,'Nivel');
INSERT INTO pokemon_ataques VALUES (6,9,null,'MT/MO');
SELECT nombre FROM pokemon WHERE nombre LIKE 'Pik'
SELECT tipo FROM pok_tipo COUNT pokemon GROUP BY tipo ORDER BY tipo
SELECT ataques FROM pokemon 

/*45*//*48*/

SELECT DISTINCT a.nombre FROM pokemon p, pokemon_ataques pa, ataques a, tipo t, pok_tipo pt
WHERE p.id=pa.pokemon AND pa.ataques=a.id AND p.id=pt.pokemon AND pt.tipo=t.id AND t.nombre = 'Fuego'
SELECT nombre FROM pokemon WHERE peso > (select max(peso) FROM pokemon p, pok_tipo pt, tipo t WHERE p.id=pt.pokemon AND pt.tipo=t.id AND t.nombre='Elï¿½ctrico'
SELECT a.nombre FROM ataques a WHERE id != ALL (SELECT ataque FROM pokemon_ataques);
SELECT * FROM pokemon WHERE id IN (SELECT pokemon FROM pok_tipo) HAVING COUNT pokemon=2 GROUP BY pokemon;

/*30*/





CREATE TABLE cliente
(
    dni VARCHAR2(9) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    fecha_nac DATE NOT NULL,
    direccion VARCHAR2(100),
    sexo VARCHAR2(1) CHECK (sexo IN ('H', 'M'))
);

CREATE TABLE producto
(
    cod NUMBER(5) PRIMARY KEY,
    nombre VARCHAR2(50) UNIQUE NOT NULL,
    stock NUMBER(6) NOT NULL CHECK (stock >= 0),
    precio NUMBER(4, 2) NOT NULL,
    tipo VARCHAR2(20) NOT NULL
);

CREATE TABLE compra
(
    cliente VARCHAR2(9),
    producto NUMBER(5),
    fecha DATE,
    cantidad NUMBER(3) NOT NULL,
   
    CONSTRAINT pk_comp PRIMARY KEY (cliente, producto, fecha),
    CONSTRAINT fk_comp_cli FOREIGN KEY (cliente) REFERENCES cliente(DNI),
    CONSTRAINT fk_comp_prod FOREIGN KEY (producto) REFERENCES producto(cod)
);

CREATE TABLE tienda
(
    cod NUMBER(5) PRIMARY KEY,
    metros NUMBER(4) NOT NULL
);

CREATE TABLE trabajador
(
    cod NUMBER(5) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    categoria VARCHAR(20) NOT NULL,
    area VARCHAR2(20) NOT NULL,
    tienda NUMBER(5),
   
    CONSTRAINT fk_trab_tien FOREIGN KEY (tienda) REFERENCES tienda(cod)
);

CREATE TABLE oferta
(
    cod NUMBER(5) PRIMARY KEY,
    tienda NUMBER(5),
    producto NUMBER(5),
    trabajador NUMBER(5),
    tipo VARCHAR2(20) NOT NULL,
    inicio DATE NOT NULL,
    fin DATE NOT NULL,
   
    CONSTRAINT fk_of_tien FOREIGN KEY (tienda) REFERENCES tienda(cod),
    CONSTRAINT fk_of_prod FOREIGN KEY (producto) REFERENCES producto(cod),
    CONSTRAINT fk_of_trab FOREIGN KEY (trabajador) REFERENCES trabajador(cod)
);

//DROP TABLE cliente CASCADE CONSTRAINTS;

ALTER TABLE compra
ADD CONSTRAINT fk_comp_cli FOREIGN KEY (cliente) REFERENCES cliente(DNI);

ALTER TABLE cliente
ADD tlf NUMBER(9);

ALTER TABLE trabajador
ADD tlf NUMBER(9);

ALTER TABLE producto
DROP COLUMN stock;

ALTER TABLE cliente
MODIFY tlf CHECK (tlf >= 600000000);

ALTER TABLE trabajador
MODIFY tlf CHECK (tlf >= 600000000);

ALTER TABLE producto
MODIFY precio DEFAULT 0;

ALTER TABLE tienda ADD
(
    nombre VARCHAR2(50) NOT NULL,
    localizacion VARCHAR2(100)
);

ALTER TABLE producto
MODIFY precio CHECK (precio >= 0 AND precio <= 10);

ALTER TABLE producto
ADD stock NUMBER(6);

ALTER TABLE producto
MODIFY stock CHECK (stock >= 0);

INSERT INTO cliente VALUES ('11111111F', 'ERICA', '01/01/00', 'GRANADA', 'M', NULL);
INSERT INTO cliente VALUES ('22222222F', 'PEPE', '01/01/00', 'GRANADA', 'H', 611111123);
INSERT INTO cliente(dni, fecha_nac, sexo, nombre) VALUES ('33333333H', '15/02/03', 'H', 'Manolo');

INSERT INTO cliente (dni, nombre, fecha_nac, direccion, sexo) VALUES
('11111111Z', 'Lucï¿½a', '12/05/2002', 'Granada', 'M');
INSERT INTO cliente (dni, nombre, fecha_nac, direccion, sexo) VALUES
('22222222B', 'Mï¿½nica', '18/12/2008', 'Jaï¿½n', 'M');
INSERT INTO cliente (dni, nombre, fecha_nac, direccion, sexo) VALUES
('12345678C', 'Luis', '18/02/2008', 'Granada', 'H');
INSERT INTO cliente (dni, nombre, fecha_nac, direccion, sexo) VALUES
('33333333R', 'Cï¿½sar', '08/09/2003', 'Granada', 'H');
INSERT INTO cliente (dni, nombre, fecha_nac, direccion, sexo) VALUES
('55555555T', 'Roberto', '24/11/2008', 'Mï¿½laga', 'H');


ALTER TABLE producto
MODIFY tipo NUMBER(2,0);

ALTER TABLE producto
MODIFY precio NULL;

INSERT INTO producto (cod, nombre, stock, precio, tipo) VALUES
(1, 'Lï¿½piz negro', 100, 0.75, 1);
INSERT INTO producto (cod, nombre, stock, precio, tipo) VALUES
(2, 'Bolï¿½grafo azul', 85, 1.25, 1);
INSERT INTO producto (cod, nombre, stock, precio, tipo) VALUES
(3, 'Libreta A4', 60, 1.75, 2);
INSERT INTO producto (cod, nombre, stock, precio, tipo) VALUES
(4, 'Cuaderno rubio', 50, 3.25, 2);
INSERT INTO producto (cod, nombre, stock, precio, tipo) VALUES
(5, 'Corrector', 86, 0.75, 3);
INSERT INTO producto (cod, nombre, stock, precio, tipo) VALUES
(6, 'Goma borrar', 150, 0.35, 3);

INSERT INTO compra (cliente, producto, fecha, cantidad) VALUES
('11111111Z', 1, '25/10/2023', 2);
INSERT INTO compra (cliente, producto, fecha, cantidad) VALUES
('12345678C', 1, '26/10/2023', 1);
INSERT INTO compra (cliente, producto, fecha, cantidad) VALUES
('11111111Z', 2, '25/10/2023', 4);
INSERT INTO compra (cliente, producto, fecha, cantidad) VALUES
('55555555T', 2, '26/10/2023', 3);
INSERT INTO compra (cliente, producto, fecha, cantidad) VALUES
('11111111Z', 3, '26/10/2023', 1);
INSERT INTO compra (cliente, producto, fecha, cantidad) VALUES
('12345678C', 4, '26/10/2023', 1);
INSERT INTO compra (cliente, producto, fecha, cantidad) VALUES
('33333333R', 2, '25/10/2023', 6);
INSERT INTO compra (cliente, producto, fecha, cantidad) VALUES
('11111111Z', 1, '30/10/2023', 5);
INSERT INTO compra (cliente, producto, fecha, cantidad) VALUES
('12345678C', 3, '02/11/2023', 2);
INSERT INTO compra (cliente, producto, fecha, cantidad) VALUES
('12345678C', 4, '30/10/2023', 1);
INSERT INTO compra (cliente, producto, fecha, cantidad) VALUES
('33333333R', 1, '25/10/2023', 4);
INSERT INTO compra (cliente, producto, fecha, cantidad) VALUES
('55555555T', 2, '30/10/2023', 3);
INSERT INTO compra (cliente, producto, fecha, cantidad) VALUES
('55555555T', 3, '30/10/2023', 1);
INSERT INTO compra (cliente, producto, fecha, cantidad) VALUES
('55555555T', 3, '02/11/2023', 2);
INSERT INTO compra (cliente, producto, fecha, cantidad) VALUES
('12345678C', 4, '02/11/2023', 2);


DELETE FROM compra;
DELETE FROM cliente WHERE direccion='Mï¿½laga';
DELETE FROM producto WHERE precio<1;
DELETE FROM cliente WHERE sexo='H';
DELETE FROM cliente;
DELETE FROM producto;

DELETE FROM compra WHERE cantidad<3;

UPDATE cliente
SET fecha_nac='11/05/2002'
WHERE dni='11111111Z';

UPDATE producto
SET precio=1.25,
stock = 150
WHERE nombre='Bolï¿½grafo azul';

UPDATE cliente
SET direccion='Mï¿½laga'
WHERE nombre='Mï¿½nica';

UPDATE producto
SET precio = precio + 0.25;

UPDATE compra
SET cantidad = cantidad + 1
WHERE producto=2;

UPDATE producto
SET precio = 1.25
WHERE tipo=1 OR tipo=2;

UPDATE cliente SET nombre='cï¿½sar' WHERE nombre='Cï¿½sar';

SELECT dni, nombre FROM cliente;

SELECT direccion FROM cliente;

SELECT * FROM compra;

UPDATE cliente SET direccion='Granada' WHERE direccion='GRANADA';

SELECT dni, nombre FROM cliente WHERE direccion='Granada' ORDER BY nombre ASC;

SELECT nombre FROM cliente WHERE sexo='M';

SELECT dni, nombre FROM cliente WHERE NOT direccion='Granada';

SELECT * FROM cliente WHERE nombre='Lucï¿½a';

SELECT precio FROM producto WHERE tipo=2;

SELECT * FROM producto WHERE cod=4;

SELECT * FROM producto WHERE precio >= 0.75 AND precio <= 1.25;

SELECT DISTINCT cliente FROM compra;

SELECT cliente FROM compra WHERE producto=3;

SELECT cliente FROM compra WHERE producto=1 AND cantidad>3;

SELECT DISTINCT cliente,producto FROM compra WHERE cantidad>3;

SELECT nombre, precio*1.21 FROM producto;

SELECT nombre FROM producto WHERE precio IS NOT NULL;

SELECT DISTINCT direccion FROM cliente WHERE direccion IS NOT NULL;

SELECT direccion,nombre FROM cliente ORDER BY direccion DESC, nombre ASC;

CREATE TABLE duenios
(
    DNI VARCHAR2(9) PRIMARY KEY,
    nom VARCHAR2(50)
);

CREATE TABLE perros
(
    num NUMBER(4) PRIMARY KEY,
    nom VARCHAR2(20),
    DNI_due VARCHAR2(9),
   
    CONSTRAINT fk_perr_due FOREIGN KEY (DNI_due) REFERENCES duenios(DNI)
);

INSERT INTO duenios VALUES ('11111111S', 'Rocio');
INSERT INTO duenios VALUES ('33333333E', 'Paloma');
INSERT INTO duenios VALUES ('66666666B', 'Victor');

INSERT INTO perros VALUES (1, 'Ali', '11111111S');
INSERT INTO perros VALUES (2, 'Buda', '33333333E');
INSERT INTO perros VALUES (3, 'Pico', '11111111S');
INSERT INTO perros VALUES (4, 'Rufo', '66666666B');

SELECT * FROM duenios d, perros p WHERE DNI=DNI_due ORDER BY d.nom;


SELECT compra.*, producto.nombre FROM compra, producto WHERE cod=producto;

SELECT compra.*, cliente.nombre FROM compra, cliente WHERE dni=cliente;

SELECT cliente.nombre FROM cliente, compra WHERE cantidad>4 AND producto=2 AND dni=cliente;

SELECT DISTINCT producto.nombre FROM compra, producto WHERE cantidad<3 AND cod=producto;

SELECT DISTINCT producto.* FROM compra, producto, cliente
WHERE compra.cliente=cliente.dni AND compra.producto=producto.cod AND cliente.nombre='Lucï¿½a';

DROP TABLE trabajador CASCADE CONSTRAINTS;
DROP TABLE tienda CASCADE CONSTRAINTS;
DROP TABLE oferta CASCADE CONSTRAINTS;

INSERT INTO trabajador VALUES(18, 'Pedro', 'Encargado', 'Cajas', 1);
INSERT INTO trabajador VALUES(21, 'Elena', 'Encargado', 'Reposiciï¿½n', 1);
INSERT INTO trabajador VALUES(35, 'Manuel', 'Suplente', 'Reposiciï¿½n', 1);

INSERT INTO tienda VALUES(1, 500);
INSERT INTO tienda VALUES(2, 800);
INSERT INTO tienda VALUES(3, 250);

INSERT INTO oferta VALUES(1, 1, 2, 18, 1, '01/09/2024', '01/10/2024');
INSERT INTO oferta VALUES(2, 2, 6, NULL, 1, '01/10/2024', '01/11/2024');
INSERT INTO oferta VALUES(3, 3, 6, 35, 2, '01/07/2024', '01/08/2024');
INSERT INTO oferta VALUES(4, 3, 3, 35, 3, '01/10/2024', '01/12/2024');

SELECT producto.nombre FROM oferta, producto
WHERE oferta.producto=producto.cod AND oferta.tienda=3;

SELECT oferta.cod FROM oferta, producto
WHERE producto.nombre='Goma borrar' AND oferta.producto=producto.cod;

SELECT metros FROM tienda, producto, oferta
WHERE producto.cod=oferta.producto AND tienda.cod=oferta.tienda
AND producto.nombre='Goma borrar';

SELECT nombre, categoria FROM trabajador WHERE tienda=1;

SELECT oferta.* FROM oferta, trabajador
WHERE oferta.tienda=trabajador.tienda AND trabajador.nombre='Elena';

SELECT producto.nombre FROM producto, oferta
WHERE producto.cod=oferta.producto
AND inicio <= '01/09/2024' AND fin >= '30/09/2024';

SELECT producto.nombre FROM producto, tienda, oferta
WHERE producto.cod=oferta.producto AND tienda.cod=oferta.tienda
AND tienda.metros>500;

SELECT DISTINCT producto.nombre FROM producto, compra, cliente
WHERE producto.cod=compra.producto AND cliente.dni=compra.cliente
AND direccion='Granada';

SELECT direccion FROM cliente, compra, producto
WHERE producto.cod=compra.producto AND cliente.dni=compra.cliente
AND cantidad>=7;

SELECT compra.cliente, compra.producto, cliente.direccion, SUM(compra.cantidad)
FROM cliente, compra
WHERE compra.cliente=cliente.dni
GROUP BY compra.cliente,compra.producto,cliente.direccion;

SELECT nombre, compra.*
FROM cliente,compra
WHERE dni=cliente AND direccion='Granada'
ORDER BY nombre;

SELECT DISTINCT tienda.*
FROM tienda, oferta, producto
WHERE tienda.cod=oferta.tienda AND oferta.producto=producto.cod
AND precio IS NULL;

SELECT nombre, precio
FROM producto, oferta
WHERE producto.cod=oferta.producto AND oferta.tipo=2;

SELECT DISTINCT cliente.*
FROM cliente, producto, compra
WHERE dni=compra.cliente AND producto.cod=compra.producto AND producto.nombre='Bolï¿½grafo azul'
ORDER BY fecha_nac ASC;

SELECT DISTINCT cliente.nombre
FROM cliente, producto, compra
WHERE dni=compra.cliente AND producto.cod=compra.producto AND precio IS NOT NULL;

SELECT cliente.nombre, ROUND(precio*cantidad*1.21, 2)
FROM cliente, producto, compra
WHERE compra.cliente=dni AND producto.cod=compra.producto AND direccion='Mï¿½laga';

SELECT oferta.cod, oferta.tienda, producto.nombre, trabajador.nombre, oferta.tipo, inicio, fin
FROM oferta, trabajador, tienda, producto
WHERE producto.cod=oferta.producto AND trabajador.cod=oferta.trabajador
AND tienda.cod=oferta.tienda AND metros>=500;

-- OPERADOR LIKE --

SELECT nombre FROM cliente WHERE nombre LIKE 'M%';

SELECT DISTINCT cli.* FROM cliente cli, compra c, producto p
WHERE cli.dni=c.cliente AND c.producto=p.cod AND p.nombre LIKE 'L%';

SELECT * FROM trabajador WHERE nombre LIKE '%o%';

SELECT * FROM cliente WHERE nombre LIKE '__n%';

SELECT SUM(metros) FROM tienda;

SELECT nombre, precio FROM producto ORDER BY precio DESC;

SELECT COUNT(*) FROM compra WHERE cliente='11111111Z';

SELECT SUM(precio*cantidad)*1.21 AS Total_Compra 
FROM clientes, compras, productos 
WHERE producto = producto.cod AND cliente=cliente.dni
AND cliente.nombre='Lucï¿½a';

SELECT AVG (cantidad) FROM compra, producto 
WHERE producto=cod AND nombre='Bolï¿½grafo azul';

SELECT COUNT (DISTINCT cliente) FROM  compra, producto
WHERE producto=cod AND nombre='Lï¿½piz negro';

SELECT MAX (precio) FROM cliente cli, compra c, producto p

SELECT AVG (cantidad) FROM compra, cliente WHERE dni=cliente and nombre='Luis'
SELECT MAX (metros), MIN (metros), CAST(AVG(metros 
SELECT AVG(precio) FROM producto;

SELECT producto.nombre COUNT (ofertas*) FROM ofertas, productos WHERE ofertas.producto=cod_prod GROUP BY productos.nombre
SELECT producto COUNT (cliente) FROM compra GROUP BY producto
SELECT direcciï¿½n COUNT (dni) FROM cliente WHERE direcciï¿½n 

SELECT cliente COUNT (producto) FROM compra GROUP BY cliente
SELECT tienda  COUNT (cod) FROM oferta GROUP BY tienda
SELECT producto MAX (cantidad) FROM compra GROUP BY producto;

SELECT producto FROM compra HAVING AVG(cantidad)>5 GROUP BY producto
SELECT direccion FROM cliente HAVING AVG(dni)>2 GROUP BY direccion
SELECT nombre FROM producto, compra WHERE cod=producto HAVING(cantidad)>10 GROUP BY nombre

SELECT dni FROM cliente cl, compra c, producto p WHERE dni=cl.cliente and HAVING AVG (cantidad*precio)>3 GROUP BY dni
SELECT producto FROM oferta HAVING COUNT(DISTINCT cod)> GROUP BY producto

//Comparaciones y conjuntos de elementos//

SELECT nombre FROM trabajador 
WHERE tienda = ANY (SELECT tienda FROM trabajadores WHERE nombre IN ('Pedro','Manuel'));
SELECT*FROM clientes 
WHERE fecha_nac <= ALL (SELECT fecha_nac FROM cliente)
SELECT nombre FROM cliente, compra
WHERE dni = ANY (SELECT cliente FROM compra WHERE cantidad < 2);
SELECT nombre FROM cliente
WHERE nombre != ALL (SELECT nombre FROM cliente, compra WHERE dni = cliente AND (cliente, producto);
SELECT nombre FROM cliente 
WHERE dni = ANY (SELECT cliente FROM compra WHERE producto = ANY ( SELECT cod FROM producto WHERE nombre = 'Boligrafo azul')) 
AND dni = ANY (sSELECT DISTINCT cliente FROM compra);
SELECT*FROM tienda
WHERE metros >= ALL (SELECT metros FROM tienda);


SELECT e.* FROM envios e, componentes c WHERE c.id=e.comp AND color!='rojo';
SELECT prov FROM envios WHERE art='t3' and cantidad>250;
SELECT*FROM proveedores WHERE categoria>20 and ciudad='Sevilla';
SELECT e.* FROM envios e, componentes c WHERE e.comp=c.id AND peso>15 AND cantidad <200
SELECT color FROM envios e, componentes c, proveedores p WHERE p.id=e.prov AND c.id=e.comp AND p.id='p1';
SELECT peso FROM envios e, componentes c, proveedores p WHERE p.id=e.prov AND c.id=e.comp AND p.nombre='JUAN';
SELECT e.*, a.ciudad FROM articulos a, envios e, proveedores p, componentes c WHERE p.id=e.prov and c.id=e.comp AND a.ciudad=p.ciudad AND a.ciudad=c.ciudad;
SELECT nombre FROM proveedores WHERE ID != ALL (SELECT DISTINCT prov FROM envios, componentes WHERE comp=id AND nombre like
ALTER TABLE proveedores ADD edad NUMERIC(2);
ALTER TABLE envios ADD fecha_env DATE AND ADD precio NUMERIC(5);
DELETE FROM envios WHERE proveedores = 'Inma';
DELETE FROM proveedores WHERE ciudad = 'Sevilla';

--4
SELECT t, ciudad FROM articulos WHERE ciudad LIKE '%d' OR ciudad LIKE '%e%';
--10
SELECT c FROM envios WHERE p IN (SELECT p FROM proveedores WHERE ciudad= 'Sevilla')
AND a IN (SELECT t FROM articulos WHERE ciudad='Sevilla');
--15
SELECT tnombre FROM articulos WHERE t IN 
(SELECT t FROM envios WHERE p IN (SELECT p FROM proveedores WHERE ciudad!='Madrid')
AND ciudad NOT IN (SELECT ciudad 


CREATE TABLE superpersona
(
    ide NUMBER(3) PRIMARY KEY, 
    nombre VARCHAR2(25) NOT NULL,
    mote VARCHAR2(50) NOT NULL,
    ciudadorigen VARCHAR2 (50),
    equipo NUMBER(2),
    composicion VARCHAR2(15) check (composicion in('villano','heroe')),
    
    constraint fk_equipo foreign key (equipo) references equipo(ide)
);

CREATE TABLE equipo
(
    ide NUMERIC(2) primary key,
    nombre VARCHAR2(50)
);

CREATE TABLE poderes
(
    ide NUMBER(3) PRIMARY KEY,
    nombre VARCHAR(25) NOT NULL
);

CREATE TABLE tiene
( 
    poder NUMBER(3),
    superP NUMBER(3),
    
    constraint pk_tiene primary key (poder, superP),
    constraint fk_poder foreign key (poder) references poderes(ide),
    constraint fk_super foreign key (superP) references superpersona(ide)
);

insert into equipo values (1,'Vengadores');
insert into equipo values (2,'X-Men');
insert into equipo values (3,'Guardianes de la galaxia');
insert into equipo values (4,'X-Force');
insert into equipo values (5,'Orden negra');
insert into equipo values (6,'Agentes de Wakanda');
insert into equipo values (7,'Hydra');
insert into equipo values (8,'Los 4 fantï¿½sticos');
insert into equipo values (9,'Starforce');
insert into equipo values (10,'Shield');

insert into poderes values (1,'Telepatia');
insert into poderes values (2,'Campo de fuerza');
insert into poderes values (3,'Bolas de Fuego');
insert into poderes values (4,'Invisibilidad');
insert into poderes values (5,'Super Fuerza');
insert into poderes values (6,'Regeneraciï¿½n');
insert into poderes values (7,'Deforma Realidad');
insert into poderes values (8,'Sentido arï¿½cnido');
insert into poderes values (9,'Teletransportaciï¿½n');
insert into poderes values (10,'Inteligencia');

insert into superpersona values (1,'Logan Patch','Lobezno','Canadï¿½',2,'heroe');
insert into superpersona values (2,'Peter Parker','Spider-man','Nueva York',1,'heroe');
insert into superpersona values (3,'Steve Rogers','Capitï¿½n Amï¿½rica','Nueva York',1,'heroe');
insert into superpersona values (4,'Bruce Banner','Hulk','EEUU',1,'heroe');
insert into superpersona values (5,'Tony Stark','Ironman','Nueva York',1,'heroe');
insert into superpersona values (6,'Erik magnus','Magneto','Alemï¿½n',2,'villano');
insert into superpersona values (7,'Rocket Raccoon','Rocket','Halfworld',3,'heroe');
insert into superpersona values (8,'TChalla','Black Panther','Wakanda',6,'heroe');
insert into superpersona values (9,'El titï¿½n loco','Thanos','Planeta Titï¿½n',5,'villano');
insert into superpersona values (10,'Johny Storm','Antorcha Humana','EEUU',8,'heroe');

insert into tiene values (6,1);
insert into tiene values (8,2);
insert into tiene values (6,3);
insert into tiene values (5,4);
insert into tiene values (10,5);
insert into tiene values (2,6);
insert into tiene values (10,7);
insert into tiene values (5,8);
insert into tiene values (7,9);
insert into tiene values (3,10);

//1
alter table superpersona add edad number(4);
//2
alter table superpersona modify nombre varchar2(100);
//3
alter table superpersona rename to personaje;
//4
select*from personaje where composicion='heroe';
//5
select nombre, mote from personaje where composicion='heroe' and ciudadorigen='Nueva York';
//6
select nombre, equipo from personaje where composicion='heroe' and equipo is not null;
//7
select*from personaje where composicion='villano';
//8
select mote, p.nombre from personaje, tiene, superP p where personaje.id=tiene.superP and tiene.poder=p.ide and composicion='villano';
//9
select personaje.nombre, personaje.mote, e.nombre as equipo, p.nombre as poderes from personaje, tiene, poder where personaje.ide=tiene.super and tiene=super.ide and e.ide=personaje.equipo;
//10
select personaje.* from personaje, equipo where equipo.ide=personaje.equipo and equipo.nombre='Vengadores';
//11
select personaje.* from personaje, tiene, poderes where 
//12
select e.nombre, count(p.ide) from personaje p, equipo e where e.ide=p.equipo and group by e.nombre;
//13
select p.nombre, count(poder) as poderes from personaje p, tiene t where p.ide=t.superP group by p.nombre;
//14
select p.nombre, avg(poder) from personaje p, tiene t where p.ide=t.superP having avg(count(poder)) group by p.nombre;
//15
select superP, count(poder) from tiene, personaje where personaje.ide=tiene.superP group by nombre having count(poder)=(select min(poderes)) from(select count(poder) as poderes from tiene group by t.superP);
//16
select nombre, count(superP) from poderes p, tiene t where p.ide=t.poder group by nombre;
//17
select 
//18
//19
//20
//21
//22
//23
//24
//25
//26
//27
//28

CREATE TABLE videojuegos
(
    ide NUMERIC(5) PRIMARY KEY CHECK (ide > 0),
    titulo VARCHAR2(50) NOT NULL,
    pegi NUMERIC(3) CHECK (pegi IN (3,7,12,16,18)),
    id_desarrolladora NUMERIC(5),
    
    CONSTRAINT fk_des FOREIGN KEY (desarrollador) REFERENCES desarrolladores(ide)
);

CREATE TABLE lanzamientos
(
    id_juego NUMERIC(5) CHECK (ide > 0),
    id_consola NUMERIC(5) CHECK (ide > 0),
    fechaLanzamiento DATE,
    
    CONSTRAINT pk_jue PRIMARY KEY (juego, consola), 
    CONSTRAINT pk_
);

CREATE TABLE consolas
(
    ide NUMERIC(5) PRIMARY KEY CHECK (ide > 0),
    nombre VARCHAR(25) NOT NULL ,
    desarrollador NUMERIC(2) CHECK (ide > 0),
    fechaLanzamiento DATE NOT NULL,
    generacion NUMERIC(1) NOT NULL,
    
    CONSTRAINT fk_des FOREIGN KEY (desarrollador) REFERENCES  desarrolladores(ide)
);

CREATE TABLE generos
(
    ide NUMERIC(4) CHECK (ide > 0),
    nombre VARCHAR2(25) NOT NULL
);

CREATE TABLE desarrolladores
(
    ide NUMERIC(2) PRIMARY KEY CHECK (ide > 0),
    nombre VARCHAR2(25) NOT NULL,
    paisOrigen VARCHAR2(50),
    aï¿½oFundacion NUMERIC(4)
);

INSERT INTO desarolladores VALUES (1, 'CD Projekt Red', 'Polonia', 1994);
INSERT INTO desarolladores VALUES (2, 'Nintendo EPD', 'Japï¿½n', 1889);
INSERT INTO desarolladores VALUES (3, 'Rockstar Games', 'Estados Unidos', 1998);
INSERT INTO desarolladores VALUES (4, 'Mojan Studios', 'Suecia', 2009);
INSERT INTO desarolladores VALUES (5, 'Sony Interactive', 'Japï¿½n', 1993);
INSERT INTO desarolladores VALUES (6, 'Insomniac Games', 'Estados Unidos', 1994);
INSERT INTO desarolladores VALUES (7, 'Microsoft', 'Estados Unidos', 1975);

INSERT INTO videojuegos VALUES (1, 'Cyberpunk 2077', 18, 1);
INSERT INTO videojuegos VALUES (2, 'The Legend of Zelda Breath of the Wild', 12, 2);
INSERT INTO videojuegos VALUES (3, 'Read Dead Redemption 2', 18, 3);
INSERT INTO videojuegos VALUES (4, 'Minecraft', 7, 4);
INSERT INTO videojuegos VALUES (5, 'Spyro the Dragon', 3, 5);

INSERT INTO consolas VALUES (1, 'PalyStation', 5, '03/12/1994', 5);
INSERT INTO consolas VALUES (2, 'PalyStation 4', 5, '15/11/2013', 8);
INSERT INTO consolas VALUES (3, 'PalyStation 5', 5, '12/11/2020', 9);
INSERT INTO consolas VALUES (4, 'Xbox Series X', 7, '10/11/2020', 9);
INSERT INTO consolas VALUES (5, 'Nintendo Switch', 2, '03/03/2017', 8);

INSERT INTO generos VALUES (1, 'RPG');
INSERT INTO generos VALUES (2, 'Aventura');
INSERT INTO generos VALUES (3, 'Acciï¿½n');
INSERT INTO generos VALUES (4, 'Sandbox');
INSERT INTO generos VALUES (5, '3rd Person Shooter');

INSERT INTO juego_genero VALUES (1,1);
INSERT INTO juego_genero VALUES (1,3);
INSERT INTO juego_genero VALUES (1,5);
INSERT INTO juego_genero VALUES (2,2);
INSERT INTO juego_genero VALUES (2,3);
INSERT INTO juego_genero VALUES (3,3);
INSERT INTO juego_genero VALUES (3,4);
INSERT INTO juego_genero VALUES (3,5);
INSERT INTO juego_genero VALUES (4,4);
INSERT INTO juego_genero VALUES (5,2);
INSERT INTO juego_genero VALUES (5,3);

INSERT INTO lanzamientos VALUES (1,2,'10/12/2020');
INSERT INTO lanzamientos VALUES (1,3,'14/02/2022');
INSERT INTO lanzamientos VALUES (1,4,'14/02/2022');
INSERT INTO lanzamientos VALUES (2,5,'03/03/2017');
INSERT INTO lanzamientos VALUES (3,2,'26/10/2018');
INSERT INTO lanzamientos VALUES (4,2,'04/09/2014');
INSERT INTO lanzamientos VALUES (4,5,'12/05//2017');
INSERT INTO lanzamientos VALUES (5,1,'09/09/1998');

//Consultas

//5
SELECT nombre FROM consolas WHERE fech_lanza > ANY {
SELECT fech_lanza from consola JOIN;

//1
SELECT titulo FROM videojuegos v JOIN desarrolladores d ON v.desarrollador=d.ide WHERE pais='Japï¿½n';

//2
SELECT titulo from videojuegos WHERE pegi > (SELECT pegi FROM videojuegos v JOIN desarrolladores d ON v.desarrolladores=d.id WHERE pais= 'Suecia';

//4
SELECT titulo FROM videojuego v, lanzamiento l WHERE v.

//6
SELECT genero.nombre FROM genero JOIN juego_genero ON genero.ide = juego_genero.ide_genero WHERE ide_juego IS NULL;

//8
SELECT nombre FROM desarolladores WHERE aï¿½oFundacion < ANY (SELECT aï¿½oFundacion FROM desarrolladores WHERE paisOrigen = 'Estados Unidos';

//10
SELECT*FROM videojuegos WHERE titulo LIKE 'The%';

//11
SELECT*FROM generos WHERE LENGTH(nombre) = 8;

//12
SELECT DISTINCT d.*,c.* FROM desarolladores d JOIN videojuegos v ON d.ide = v.ide_desarrolladora JOIN lanzamientos l ON v.ide = 1.ide_juego JOIN consolas c ON l.ide_consola = c.ide;

//13
SELECT v.*, COUNT(jg.ide_genero) AS num_generos FROM videojuegos v JOIN juego_genero jg ON v.ide = jg.ide_juego GROUP BY v.ide, v.titulo HAVING COUNT(jg.ide_genero) > 1;

//16
ALTER TABLE consolas DROP COLUMN generacion;

//17
DELETE FROM lanzamientos WHERE ide_consola = (SELECT ide FROM consolas WHERE nombre = 'Playstation 1');

//15
SELECT c.nombre, MAX(l.fechaLanzamiento) AS ultimo_lanzamiento FROM consolas c JOIN lanzamientos l ON c.ide = l.ide_consola GROUP BY c.nombre;

//14
SELECT g.nombre, COUNT(juego) FROM generos g JOIN juego_generacion j ON g.ide=j.genero GROUP BY g.nombre;

//18
SELECT DISTINCT d.* FROM desarrolladores d JOIN videojuegos v ON d.ID = v.ide_desarrolladora WHERE v.pegi > ( SELECT AVG(v2.pegi) FROM videojuegos v2 JOIN desarrolladores d2 ON v2.ide_desarrolladora = d.ide WHERE d2.paisOrigen = d.paisOrigen );

//19
SELECT d.* FROM desarrolladores d WHERE NOT EXISTS (SELECT g.ide FROM generos g WHERE NOT EXISTS ( SELECT v.ide FROM videojuegos v JOIN juego_genero jg ON v.ID = jg.ide_juego WHERE jg.ide_genero = g.ID AND v.ide_desarrolladora = d.ide ));

//20
SELECT g.nombre, COUNT(jg.ide_juego) AS num_juegos FROM juego_genero jg JOIN videojuegos v ON jg.ide_juego = v.ide JOIN lanzamientos l ON v.ide = l.ide_juego JOIN consolas c ON l.ide_consola = c.ide JOIN generos g ON jg.ide_genero = g.ide WHERE c.generaciï¿½n = 9 GROUP BY g.ide, g.nombre ORDER BY num_juegos DESC;

//21
SELECT d.* FROM desarrolladores d WHERE NOT EXISTS ( SELECT g.ide FROM generos g WHERE NOT EXISTS ( SELECT v.ide FROM videojuegos v JOIN juego_genero jg ON v.ide = jg.ide_juego WHERE jg.ide_genero = g.ide AND v.ide_desarrolladora = d.ide ));

//22
SELECT v.* FROM videojuegos v JOIN lanzamientos l ON v.ide = l.ide_juego JOIN consolas c ON l.ide_consola = c.ide GROUP BY v.ide, v.titulo HAVING COUNT(DISTINCT c.generaciï¿½n) >= 3;

//23
SELECT v.* FROM videojuegos v WHERE NOT EXISTS (SELECT c.ide FROM consolas c JOIN desarrolladores d ON c.ide_desarrolladora = d.ide WHERE d.nombre LIKE 'Sony%' AND NOT EXISTS (SELECT l.ide_juego FROM lanzamientos l WHERE l.ide_juego = v.ide AND l.ide_consola = c.ide));

//24
SELECT c.nombre AS consolas, g.nombre AS gï¿½nero,
       COUNT(jg.ide_juego) * 100.0 / (SELECT COUNT(*) FROM lanzamientos WHERE ide_consola = c.ide) AS porcentaje
FROM lanzamientos l
JOIN videojuegos v ON l.ide_juego = v.ide
JOIN juego_genero jg ON v.ide = jg.ide_juego
JOIN generos g ON jg.ide_genero = g.ide
JOIN consolas c ON l.ide_consola = c.ide
GROUP BY c.nombre, g.nombre;

//25
SELECT DISTINCT v.*
FROM videojuegos v
JOIN lanzamientos l ON v.ide = l.ide_juego
JOIN consolas c ON l.ide_consola = c.ide
WHERE c.fechaLanzamiento...()

//26
SELECT c.nombre AS consola, COUNT(DISTINCT jg.ide_genero) AS num_generos
FROM consolas c
JOIN lanzamientos l ON c.ide = l.ide_consola
JOIN videojuegos v ON l.ide_juego = v.ide
JOIN juego_genero jg ON v.ide = jg.ide_juego
WHERE YEAR(l.fechaLanzamiento) = YEAR(c.fechaLanzamiento)
GROUP BY c.ide, c.nombre;

//27
SELECT titulo FROM videojuego, desarrolladores WHERE desarrollador=desarrolladores.ide AND pais='Japï¿½n'
UNION
SELECT titulo FROM videojuego, desarrolladores
WHERE desarrollador=desarrolladores.ide AND pais='Estados unidos';

//28
SELECT titulo FROM videojuego, lanzamiento, consola
WHERE videojuego.ide=juego AND consola=consola.ide AND nombre LIKE '%PS5'
INTERSECT
SELECT titulo FROM videojuego, lanzamiento, consola
WHERE videojuego.ide=juego AND consola=consola.ide AND nombre LIKE '%XBOX X';

//29
SELECT titulo FROM videojuego, lanzamiento, consola 
WHERE videojuego.ide=juego AND consola=consola.ide AND nombre LIKE '%PS4'
MINOS
SELECT titulo FROM videojuego, lanzamiento, consola 
WHERE videojuego.ide=juego AND consola=consola.ide AND nombre LIKE '%PS5';

//30
SELECT nombre FROM generos, juego_genero, videojuego
WHERE generos.id=genero AND juego=videojuego.ide AND titulo LIKE '%Cyberppunk'
UNION
SELECT nombre FROM generos, juego_genero, videojuego
WHERE generos.id=genero AND juego=videojuego.ide AND titulo LIKE '%RDR2';

//31
SELECT nombre FROM consola
MINUS
SELECT nombre FROM consola c, lanzamiento l, videojuego v
WHERE c.id=consola AND juego=v.ide AND titulo LIKE '%Minecraft';

//32
SELECT titulo FROM videojuego v, desarrolladores d
WHERE desarrollador=ide.d AND nombre LIKE '%Sony'
UNION
SELECT titulo FROM videojuego v, desarrolladores d
WHERE desarrollador=ide.d AND nombre LIKE '%Nintendo';

//33
SELECT titulo FROM videojuego v, ide_desarrolladora
WHERE desarrolladora=t.videojuego AND fechaLanzamiento = 2018
MINUS
SELECT titulo FROM videojuego v, ide_desarrolladora
WHERE desarrolladora=t.videojuego AND fechaLanzamiento = 2020;

//34
SELECT nombre FROM desarrolladores d, lanzamientos l
WHERE ide.lanzamientos=d.ide AND fechalanzamiento != '%Sandbox'
MINUS

//35
SELECT titulo FROM videojuegos, genero, juego_genero
WHERE videojuegos.ide=juego_genero.ide_juego AND genero.ide=juego_genero.ide_genero
AND genero.nombre = 'Accion'

UNION

SELECT titulo FROM videojuegos, genero, juego_genero
WHERE videojuegos.ide=juego_genero.ide_juego AND genero.ide=juego_genero.ide_genero
AND genero.nombre = 'Aventura'

//37
SELECT nombres FROM generos MINUS SELECT nombre.


//MANIPULACIï¿½N DE RESULTADOS//

SELECT cli.nombre FROM cliente cli, compra c, productos p
WHERE cli.dni=cliente AND prod.cod_producto.cliente AND p.nombre='Boligrafo Azul'
INTERSECT
SELECT cli.nombre FROM cliente cli, compra com, producto p
WHERE cli.dni=com.cliente AND co.producto=p.cod AND p.nombre='Lï¿½piz Negro';

SELECT producto FROM oferta WHERE tienda=2 INTERSECT SELECT producto FROM oferta WHERE tienda=3;

SELECT cod FROM tienda WHERE metros > 100 UNION SELECT tienda FROM oferta WHERE cod=3;

SELECT* FROM trabajador 
WHERE area = 'Caja'
INTERSECT
SELECT nombre FROM trabajador 
WHERE tienda =3;

//PRï¿½CTICA//

CREATE TABLE salas 
(
    s VARCHAR2(3) PRIMARY KEY,
    nombre VARCHAR2(40) NOT NULL,
    capacidad NUMERIC(3) CHECK (capacidad BETWEEN 80 AND 300),
    fila NUMERIC(2) NOT NULL
);

CREATE TABLE peliculas
(
    p VARCHAR2(3) PRIMARY KEY,
    nombre VARCHAR2(40) NOT NULL,
    calificacion VARCHAR2(3) CHECK (calificacion IN ('TP', 7, 18)),
    nacionalidad VARCHAR2(30)
);

CREATE TABLE proyeccion
(
    sala VARCHAR2(3),
    pelicula VARCHAR2(3),
    hora VARCHAR2(5),
    ocupacion NUMERIC(3) CHECK (ocupacion >=0),
    
    constraint pk_proyeccion PRIMARY KEY (sala, pelicula,hora),
    constraint fk_salas_proyeccion FOREIGN KEY (sala) references salas(s),
    constraint fk_pelicula_proyeccion FOREIGN KEY (pelicula) REFERENCES peliculas(p)
);


//Insertar Datos

INSERT INTO salas VALUES ('S1','ï¿½frica',125,10);
INSERT INTO salas VALUES ('S2','Amï¿½rica',255,24);
INSERT INTO salas VALUES ('S3','Europa',136,14);
INSERT INTO salas VALUES ('S4','Asia',85,7);
INSERT INTO salas VALUES ('S5','Oceania',100,10);
INSERT INTO salas VALUES ('S6','Antï¿½rtida',150,15);
INSERT INTO salas VALUES ('S7','Atlï¿½ntida',300,30);

INSERT INTO peliculas VALUES ('P1','Minions','TP','EEUU');
INSERT INTO peliculas VALUES ('P2','Black Panther',18,'EEUU');
INSERT INTO peliculas VALUES ('P3','Asterix y Obelix',7,'EEUU');
INSERT INTO peliculas VALUES ('P4','El autor',NULL,'ESPAï¿½A');
INSERT INTO peliculas VALUES ('P5','Perfectos desconocidos','18','ESPAï¿½A');
INSERT INTO peliculas VALUES ('P6','Resident Evil','18','EEUU');
INSERT INTO peliculas VALUES ('P7','Tadeo Jones 3','TP','ESPAï¿½A');
INSERT INTO peliculas VALUES ('P8','Eiffel','7','EEUU');
INSERT INTO peliculas VALUES ('P9','Puï¿½ales por la espalda 2','18','EEUU');
INSERT INTO peliculas VALUES ('P10','La abuela',NULL,'ESPAï¿½A');

INSERT INTO proyeccion VALUES ('S1','P1','12.00',75);
INSERT INTO proyeccion VALUES ('S1','P1','18.00',84);
INSERT INTO proyeccion VALUES ('S1','P2','23.00',100);
INSERT INTO proyeccion VALUES ('S2','P3','12.00',89);
INSERT INTO proyeccion VALUES ('S2','P3','18.00',104);
INSERT INTO proyeccion VALUES ('S2','P3','23.00',200);
INSERT INTO proyeccion VALUES ('S3','P2','17.00',100);
INSERT INTO proyeccion VALUES ('S3','P2','20.00',120);
INSERT INTO proyeccion VALUES ('S4','P4','12.00',14);
INSERT INTO proyeccion VALUES ('S4','P4','17.00',60);
INSERT INTO proyeccion VALUES ('S4','P4','20.00',78);
INSERT INTO proyeccion VALUES ('S4','P4','23.00',80);
INSERT INTO proyeccion VALUES ('S1','P1','23.00',35);
INSERT INTO proyeccion VALUES ('S5','P4','20.00',16);
INSERT INTO proyeccion VALUES ('S3','P4','12.00',25);
INSERT INTO proyeccion VALUES ('S5','P1','12.00',100);
INSERT INTO proyeccion VALUES ('S5','P8','12.00',152);
INSERT INTO proyeccion VALUES ('S5','P4','13.00',250);
INSERT INTO proyeccion VALUES ('S6','P2','20.00',120);
INSERT INTO proyeccion VALUES ('S6','P10','23.00',68);
INSERT INTO proyeccion VALUES ('S6','P9','23.00',50);
INSERT INTO proyeccion VALUES ('S4','P8','12.00',36);

//Consultas

//Calcular el nï¿½mero de entradas vendidas para cada horario de proyecciï¿½n(7)
SELECT hora, sum (ocupacion) from proyeccion group by hora;

//Mostrar los nombres de las pelï¿½culas que no se proyectan en ninguna sala(8)
SELECT nombre FROM peliculas WHERE p NOT IN (SELECT DISTINCT pelicula FROM proyeccion); 

//Mostrar la nacionalidad que mï¿½s pelï¿½culas tiene en cartelera (que se estï¿½n proyectando)(9)
SELECT nacionalidad FROM proyeccion WHERE pelicula ;

//Mostrar todas las pelï¿½culas que se proyectan en horario de maï¿½ana(14)
SELECT nombre FROM peliculas, proyeccion WHERE p=pelicula AND hora IN ('12.00','13.00');

//Mostrar la sala mï¿½s ocupada en la sesiï¿½n de las 23.00(16)
SELECT nombre FROM sala, proyeccion
WHERE s=sala AND hora = '23.00' and ocupacion = (
    SELECT MAX(ocupacion) FROM proyeccion
    WHERE hora = '23.00');


//1
SELECT nombre FROM peliculas;
//2
SELECT DISTINCT calificacion FROM peliculas;
//3
SELECT*FROM peliculas WHERE calificacion IS NULL;
//4
SELECT*FROM salas ORDER BY capacidad;
//5
SELECT*FROM salas WHERE s NOT IN (SELECT DISTINCT sala FROM proyeccion);
//6
SELECT s, p FROM salas s LEFT JOIN proyeccion pr ON s.S = pr.Sala LEFT JOIN PELICULAS p ON pr.Pelicula = p.P;
//7
SELECT ora, SUM(Ocupacion) FROM PROYECCIONES GROUP BY Hora;
//8

//9

//Mostrar para cada proyecciï¿½n cuantas entradas quedan disponibles(20)
SELECT ocupacion FROM proyeccion, salas WHERE ocupacion= s AND capacidad=p;

//Mostrar la pelï¿½cula con mï¿½s recaudaciï¿½n, mostrando la recaudaciï¿½n total(22)
SELECT 
//Mostrar la informaciï¿½n de aquellas proyecciones en las que todavï¿½a hay entradas disponibles(31)

//Aï¿½adir una nueva columna a las salas donde se pueda almacenar si la sala se encuentra en la planta baja o en la planta 1(35)

//Cambiar el tipo de dato de la columna capacidad, ya que ahora se le debe permitir almacenar 2 decimales ademï¿½s de los 3 enteros que ya tenï¿½a(36)

//Se necesita saber el total de personas que han usado cada sala, mostrar dicha informaciï¿½n ordenada de menor a mayor uso(39)

//Mostrar la nacionalidad de aquellas pelï¿½culas para las que se ha recaudado mï¿½s de 2.000ï¿½(43)

//14
SELECT DISTINCT p.nombre FROM peliculas p JOIN proyeccion pr ON p.P = pr.pelicula WHERE pr.hora <= '12.00';
//15
SELECT * FROM salas WHERE s NOT IN (SELECT sala FROM PROYECCION WHERE hora = '12.00');
//16
SELECT sala, ocupacion FROM proyeccion WHERE hora = '23.00' AND ocupacion = (SELECT MAX(ocupacion) FROM proyeccion WHERE hora = '23.00');
//17
SELECT pelicula, hora, ocupacion FROM proyeccion WHERE ocupacion = (SELECT MAX(ocupacion) FROM PROYECCION);
//18

//19
SELECT nacionalidad, COUNT() AS pelicula
FROM peliculas                                      //NO COMPILA//
GROUP BY nacionalidad
HAVING COUNT() > 2;
//20
SELECT pr.sala, pr.pelicula, pr.hora, (s.capacidad - pr.ocupacion) AS entradas_disponibles
FROM proyeccion pr
JOIN salas s ON pr.sala = s.s;
//21
SELECT SUM(Ocupacion * 6.5) AS Beneficio_Total FROM PROYECCIONES;
//22
SELECT p.nombre, SUM(pr.ocupacion * 6.5) AS recaudacion_total
FROM peliculas p
JOIN proyeccion pr ON p.p = pr.pelicula
GROUP BY p.nombre
ORDER BY recaudacion_total DESC
FETCH FIRST 1 ROW ONLY;
//23
SELECT SUM(capacidad) AS capacidad_total
FROM salas;
//24
SELECT t.hora, s.nombre AS sala, t.porcentaje
FROM (                                              //BUSCAR COMO SE HACE//
SELECT pr.hora, pr.sala, pr.ocupacion, s.capacidad,
//25
UPDATE salas
SET capacidad = 200
WHERE s = 'S3';
//26
SELECT pr., p.
FROM proyeccion pr
JOIN peliculas p ON pr.pelicula = p.p;
//27
SELECT p.nombre, COUNT(*) AS veces_proyectada
FROM peliculas p
JOIN proyeccion pr ON p.p = pr.pelicula
GROUP BY p.nombre
ORDER BY veces_proyectada DESC;
//28
SELECT pr.sala, SUM(pr.ocupacion * 6.5) AS recaudacion_sala
FROM proyeccion pr
GROUP BY pr.sala;
//29
//MIRAR COMO SE HACE//
//30
SELECT p.nombre, SUM(pr.ocupacion) AS total_vistas
FROM peliculas p
JOIN proyeccion pr ON p.p = pr.pelicula
GROUP BY p.nombre
ORDER BY total_vistas DESC;
//31
SELECT pr.*
FROM proyeccion pr
JOIN salas s ON pr.sala = s.s
WHERE (s.capacidad - pr.ocupacion) > 0;
//32
SELECT pr.sala, pr.pelicula, pr.hora, (s.capacidad - pr.ocupacion) AS entradas_disponibles
FROM proyeccion pr
JOIN salas s ON pr.sala = s.s;
//33
SELECT pr.*
FROM proyeccion pr
JOIN peliculas p ON pr.pelicula = p.p
WHERE p.calificacion IS NULL;
//34
ALTER TABLE peliculas
ADD (precio_entrada NUMERIC(5,2));
//35
ALTER TABLE salas
ADD (planta VARCHAR2(20));
//36
ALTER TABLE salas
MODIFY (capacidad NUMERIC(5,2));
//37
UPDATE proyeccion
SET ocupacion = ocupacion + 15
WHERE sala = 'S1'
AND pelicula = 'P1'
AND hora = '12.00';
//38
INSERT INTO proyeccion
VALUES ('S4','P4','00.00',0);
//39
SELECT sala, SUM(ocupacion) AS total_uso
FROM proyeccion
GROUP BY sala
ORDER BY total_uso;
//40
SELECT pr.sala, pr.pelicula, pr.hora, (s.capacidad - pr.ocupacion) AS entradas_disponibles
FROM proyeccion pr
JOIN salas s ON pr.sala = s.s
WHERE (s.capacidad - pr.ocupacion) > 0
ORDER BY entradas_disponibles DESC;
//41
SELECT s.*
FROM salas s
JOIN (
SELECT sala, SUM(ocupacion) AS total
FROM proyeccion
GROUP BY sala
HAVING SUM(ocupacion) > 300
) t ON s.s = t.sala;
//42
SELECT SUM(pr.ocupacion) AS entradas_vendidas
FROM proyeccion pr
JOIN peliculas p ON pr.pelicula = p.p
WHERE p.calificacion IS NULL;
//43
SELECT DISTINCT p.nacionalidad
FROM (                                  //BUSCAR COMO SE HACE//
//44
SELECT p.nombre, SUM(s.capacidad * 6.5) AS recaudacion_potencial
FROM peliculas p
JOIN proyeccion pr ON p.p = pr.pelicula
JOIN salas s ON pr.sala = s.s
GROUP BY p.nombre;
//45
//48
ALTER TABLE proyeccion
ADD (hora_fin VARCHAR2(5));
//49
ALTER TABLE salas
MODIFY (fila NUMERIC(5));
//50
//51
ALTER TABLE peliculas
DROP COLUMN nacionalidad;
//52
ALTER TABLE peliculas
ADD (duracion NUMERIC);
//53
UPDATE peliculas
SET calificacion = 'NR13'
WHERE calificacion IS NULL;
//54
UPDATE proyeccion
SET hora = '12.30'
WHERE hora = '12.00';


CREATE TABLE jugador
(
    id NUMERIC(2) PRIMARY KEY,
    nombre VARCHAR2(20),
    nick VARCHAR2(20),
    edad NUMERIC(3) CHECK (edad >= 18)
);

CREATE TABLE categoria
(
    codigo VARCHAR2(1) PRIMARY KEY,
    descripcion VARCHAR2(20)
);

CREATE TABLE personaje
(
    id NUMERIC(2) PRIMARY KEY,
    nombre_pers VARCHAR2(20) NOT NULL,
    tipo VARCHAR2(1) NOT NULL,
    nivel NUMERIC(2) DEFAULT(1),
    fecha_creacion DATE
);

CREATE TABLE controlan
(
    jugador NUMERIC(2),
    personaje NUMERIC(2),
    fecha_ini DATE,
    fecha_fin DATE,
    
    CONSTRAINT pk_controla PRIMARY KEY (jugador, personaje),
    CONSTRAINT fk_jugador FOREIGN KEY (jugador) REFERENCES jugador(id),
    CONSTRAINT fk_personaje FOREIGN KEY (personaje) REFERENCES personaje(id)
);


INSERT INTO jugador VALUES (1, 'Maria', 'Mari', 18);
INSERT INTO jugador VALUES (2, 'Maria', 'Juanito', 23;
INSERT INTO jugador VALUES (3, 'Maria', 'Pepe', 19;
INSERT INTO jugador VALUES (4, 'Maria', 'Rodri', 21;
INSERT INTO jugador VALUES (5, 'Maria', 'Feli', 27;
INSERT INTO jugador VALUES (6 'Maria', 'Helena23', 33)
INSERT INTO jugador VALUES (8 'Maria', 'Nacho', 25);
INSERT INTO jugador VALUES (8 'ï¿½scar','Ricto', 25;

INSERT INTO categoria VALUES ('H', 'Humano');
INSERT INTO categoria VALUES ('E', 'Elfo');
INSERT INTO categoria VALUES ('N', 'Enano');
INSERT INTO categoria VALUES ('G', 'Gnomo');
INSERT INTO categoria VALUES ('M', 'Mediano');
INSERT INTO categoria VALUES ('S', 'Semielfo');
INSERT INTO categoria VALUES ('O', 'Orco');

INSERT INTO personaje VALUES (1,'Nhezar Pikei','H',3 , '12/01/2021');
INSERT INTO personaje VALUES (2 ,'Eikhud Nennein','H',2 , '30/12/2020');
INSERT INTO personaje VALUES (3 ,'Debrulm Nightsun','H',3 , '21/12/2020');
INSERT INTO personaje VALUES (5 ,'Noa Farrowslayer','H',5 , '05/01/2021');
INSERT INTO personaje VALUES (6 ,'Caranthir','E',2 , '23/12/2020');
INSERT INTO personaje VALUES (7 ,'Curufin','E',1 , '30/11/2020');
INSERT INTO personaje VALUES (8 ,'Legolas','E',4 , '25/12/2020');
INSERT INTO personaje VALUES (9 ,'Umnar','N',3 , '12/01/2021');
INSERT INTO personaje VALUES (10 ,'Toradin','N',3 , '21/12/2020');
INSERT INTO personaje VALUES (11 ,'Gramkyl','N',1 , '05/01/2021');
INSERT INTO personaje VALUES (12 ,'Mancryn','G',1 , '23/12/2020');
INSERT INTO personaje VALUES (13 ,'Kasver','G',5 , '07/01/2021');
INSERT INTO personaje VALUES (14 ,'Sinfiz','G',7 , '13/01/2021');

INSERT INTO controla VALUES (1 ,1 ,'12/01/2024','14/01/2024');
INSERT INTO controla VALUES (2 , 1,'15/01/2024','21/01/2024');
INSERT INTO controla VALUES (8 , 1,'22/01/2024',null);
INSERT INTO controla VALUES (3 , 2,'30/12/2023','02/01/2024');
INSERT INTO controla VALUES (4 , 2,'03/01/2024',null);
INSERT INTO controla VALUES (6 , 3,'21/12/2023','27/12/2023');
INSERT INTO controla VALUES (7 , 3,'01/01/2024','01/01/2024');
INSERT INTO controla VALUES (2 , 3,'02/01/2024','15/01/2024');
INSERT INTO controla VALUES (1 , 3,'16/01/2024',null);
INSERT INTO controla VALUES (7 , 4,'05/01/2024','06/01/2024');
INSERT INTO controla VALUES (2 , 4,'07/01/2024','15/01/2024');
INSERT INTO controla VALUES (3 , 4,'16/01/2024',null);
INSERT INTO controla VALUES (4 , 5,'23/12/2023','29/12/2023');
INSERT INTO controla VALUES (8 , 5,'30/11/2023',null);
INSERT INTO controla VALUES (1 , 6,'30/11/2023','30/12/2023');
INSERT INTO controla VALUES (3 , 6,'31/12/2023',null);
INSERT INTO controla VALUES (4 , 7,'12/01/2023',null);
INSERT INTO controla VALUES (2 , 7,'21/12/2023',null);
INSERT INTO controla VALUES (2 , 8,'05/01/2023',null);
INSERT INTO controla VALUES (8 , 9,'23/12/2023','29/12/2023');
INSERT INTO controla VALUES (1 , 10,'30/12/2023',null);
INSERT INTO controla VALUES (3 , 11,'07/01/2024','08/01/2024');
INSERT INTO controla VALUES (6 , 11,'09/01/2024','08/01/2024');
INSERT INTO controla VALUES (1 , 12,'30/11/2023','25/12/2023');
INSERT INTO controla VALUES (7 , 12,'30/12/2023',null);


// Mostrar por pantalla el Nick de todos los jugadores menores de 20 aï¿½os

SELECT nombre FROM jugador WHERE edad =< 20;

//Mostrar por pantalla el nombre de los personajes que han sido controlados alguna vez por el jugador con nick ï¿½mariï¿½

SELECT nombre_pers FROM jugador WHERE;

//Mostrar por pantalla el Nick de aquellos jugadores que alguna vez han controlado un personaje ï¿½enanoï¿½

SELECT*FROM nombre.jugador FROM;


SELECT * FROM controlan;



DECLARE 
    nom_sala VARCHAR2(30);
    cap_sala sala.capacidad%TYPE;
BEGIN
    SELECT nombre, capacidad INTO nom_sala, cap_sala FROM sala WHERE s='s3';
    
    DBMS_OUTPUT.put_line('Nombre de la sala 3: '||nom_sala)
    DBMS_OUTPUT.put_line('Capacidad de la sala: '||cap_sala);
END;

DECLARE 
    d_pelicula peliculas%ROWTYPE;    
BEGIN
    SELECT peliculas.* INTO pelicula FROM peliculas JOIN proyeccion
    WHERE sala='s4' AND hora ='20.00';
    
    DBMS_OUTPUT.put_line('Nombre de la sala: '||sala);
    DBMS_OUTPUT.put_line('Horario: '||hora);
END;

DECLARE
    d_sala salas%ROWTYPE;
BEGIN
    SELECT salas.* INTO datos_sala FROM salas JOIN proyecciones ON salas.proyecciones.sala
    JOIN peliculas ON peliculas.proyecciones.pelicula
    WHERE peliculas.nombre= 'El autor' AND hora= '17.00';
    
DECLARE
    capacidad salas.capacidad%TYPE;
    ocupacion proyeccion.ocupacion%TYPE;
BEGIN
    SELECT capacidad INTO capacidad
    FROM salas 
    WHERE s = 's4';

    SELECT ocupacion INTO ocupacion
    FROM proyeccion 
    WHERE sala = 's4' AND pelicula = 'p4' AND hora = '20.00';
    
    IF ocupacion = capacidad THEN
    DBMS_OUTPUT.put_line ('LA SALA 4 ESTï¿½ LLENA PARA LA PELï¿½CULA P4 A LAS 20.00')
    ELSE
    DBMS_OUTPUT.put_line ('LA SALA 4 NO ESTï¿½ LLENA PARA LA PELï¿½CULA P4 A LAS 20.00')
    END IF;
END;
    
ACCEPT numero PROMPT ('Introduce un nï¿½mero');

BEGIN 
    IF(&numero>0) THEN 
        DBMS_OUTPUT.put_line ('Es positivo');
    ELSE 
         DBMS_OUTPUT.put_line ('Es negativo');
    END IF;
END;

DECLARE
    capacidad salas.capacidad%TYPE; 
    ocupacion proyeccion.ocupacion%TYPE;
    disponibles NUMBER;
BEGIN
    SELECT capacidad INTO capacidad
    FROM salas s
    JOIN proyeccion p ON s.s = p.sala
    WHERE p.pelicula = 'P3' AND p.hora = '18.00';
    
    SELECT ocupacion INTO ocupacion
    FROM proyeccion
    WHERE pelicula = 'P3' AND p.hora = '18.00';

    IF disponibles > 10 THEN 
    DBMS_OUTPUT.put_line ('Quedan mï¿½s de 10 entradas')
    ELSE
    DBMS_OUTPUT.put_line ('Quedan menos de 10 entradas')
    END IF;
END;
    
ACCEPT titulo prompt 'Elige una pelicula';

DECLARE
    pais pelicula.nacionalidad%TYPE;
    datos_p pelicula%ROWTYPE;
BEGIN
    SELECT nacionalidad INTO pais 
    FROM peliculas
    WHERE = 'ESPAï¿½A';

    IF (&nacionalidad = 'ESPAï¿½A') THEN
     DBMS_OUTPUT.put_line ('ES NACIONAL')
    ELSE 
     DBMS_OUTPUT.put_line ('NO ES NACIONAL')
    END IF;
END;


DECLARE 
    contador NUMBER(2) := 0  ;
BEGIN 
    WHILE (contador < 10) LOOP
    contador := contador+1;
    DBMS_OUTPUT.put_line (Contador);
    END LOOP;
END;
    
ACCEPT nume1 PROMPT 'Introduce el primer nï¿½mero';
ACCEPT nume2 PROMPT 'Introduce el segundo nï¿½mero';

DECLARE 
    contador NUMBER := &nume1;
BEGIN
    WHILE (contador < &nume2)LOOP
    contador : contador+1;
    DBMS_OUTPUT.put_line (contador);
    END LOOP;
END;
    
ACCEPT nume1 PROMPT 'Numerito 1';
ACCEPT nume2 PROMPT 'Numerito 2';

DECLARE
    contador1 NUMBER :=&nume1;
    contador2 NUMBER :=&nume2;
BEGIN
    IF (contador1>contador2) THEN
    WHILE (contador2<contador1)
    LOOP
    contador1 :=contador1 - 1;
    DBMS_OUTPUT.put_line (contador1);
    END IF;
END;

DECLARE
    datos_s salas%ROWTYPE;
    n NUMBER;
    i NUMBER :=1;
BEGIN
    SELECT COUNT(s) INTO n 
    FROM salas;
    LOOP
    SELECT*INTO data_s 
    FROM salas
    WHERE s = i;
     DBMS_OUTPUT.put_line ();
     DBMS_OUTPUT.put_line ();
    END LOOP;
END;

DECLARE 
    datos_s salas%ROWTYPE;
    n NUMBER;
BEGIN

ACCEPT sala PROMPT 'salas';

DECLARE 
    suma NUMBER := 0;
BEGIN
    for i IN (SELECT ocupacion INTO i 
    FROM proyecciones 
    WHERE sala = &sala)
    LOOP
        suma :=suma +i.ocupacion;
    END LOOP;
        DBMS_OUTPUT.put_line (suma);
    END;
    
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
 CREATE TABLE "CLIENTES" 
   (	"CODIGOCLIENTE" NUMBER(*,0), 
	"NOMBRECLIENTE" VARCHAR2(50 BYTE), 
	"NOMBRECONTACTO" VARCHAR2(30 BYTE) DEFAULT NULL, 
	"APELLIDOCONTACTO" VARCHAR2(30 BYTE) DEFAULT NULL, 
	"TELEFONO" VARCHAR2(15 BYTE), 
	"FAX" VARCHAR2(15 BYTE), 
	"LINEADIRECCION1" VARCHAR2(50 BYTE), 
	"LINEADIRECCION2" VARCHAR2(50 BYTE) DEFAULT NULL, 
	"CIUDAD" VARCHAR2(50 BYTE), 
	"REGION" VARCHAR2(50 BYTE) DEFAULT NULL, 
	"PAIS" VARCHAR2(50 BYTE) DEFAULT NULL, 
	"CODIGOPOSTAL" VARCHAR2(10 BYTE) DEFAULT NULL, 
	"CODIGOEMPLEADOREPVENTAS" NUMBER(*,0) DEFAULT NULL, 
	"LIMITECREDITO" NUMBER(15,2) DEFAULT NULL
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table DETALLEPEDIDOS
--------------------------------------------------------

  CREATE TABLE "DETALLEPEDIDOS" 
   (	"CODIGOPEDIDO" NUMBER(*,0), 
	"CODIGOPRODUCTO" VARCHAR2(15 BYTE), 
	"CANTIDAD" NUMBER(*,0), 
	"PRECIOUNIDAD" NUMBER(15,2), 
	"NUMEROLINEA" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table EMPLEADOS
--------------------------------------------------------

  CREATE TABLE "EMPLEADOS" 
   (	"CODIGOEMPLEADO" NUMBER(*,0), 
	"NOMBRE" VARCHAR2(50 BYTE), 
	"APELLIDO1" VARCHAR2(50 BYTE), 
	"APELLIDO2" VARCHAR2(50 BYTE) DEFAULT NULL, 
	"EXTENSION" VARCHAR2(10 BYTE), 
	"EMAIL" VARCHAR2(100 BYTE), 
	"CODIGOOFICINA" VARCHAR2(10 BYTE), 
	"CODIGOJEFE" NUMBER(*,0) DEFAULT NULL, 
	"PUESTO" VARCHAR2(50 BYTE) DEFAULT NULL
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table GAMASPRODUCTOS
--------------------------------------------------------

  CREATE TABLE "GAMASPRODUCTOS" 
   (	"GAMA" VARCHAR2(50 BYTE), 
	"DESCRIPCIONTEXTO" CLOB, 
	"DESCRIPCIONHTML" CLOB, 
	"IMAGEN" BLOB
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("DESCRIPCIONTEXTO") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES 
  STORAGE(INITIAL 106496 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) 
 LOB ("DESCRIPCIONHTML") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES 
  STORAGE(INITIAL 106496 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) 
 LOB ("IMAGEN") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES 
  STORAGE(INITIAL 106496 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
--------------------------------------------------------
--  DDL for Table OFICINAS
--------------------------------------------------------

  CREATE TABLE "OFICINAS" 
   (	"CODIGOOFICINA" VARCHAR2(10 BYTE), 
	"CIUDAD" VARCHAR2(30 BYTE), 
	"PAIS" VARCHAR2(50 BYTE), 
	"REGION" VARCHAR2(50 BYTE) DEFAULT NULL, 
	"CODIGOPOSTAL" VARCHAR2(10 BYTE), 
	"TELEFONO" VARCHAR2(20 BYTE), 
	"LINEADIRECCION1" VARCHAR2(50 BYTE), 
	"LINEADIRECCION2" VARCHAR2(50 BYTE) DEFAULT NULL
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PAGOS
--------------------------------------------------------

  CREATE TABLE "PAGOS" 
   (	"CODIGOCLIENTE" NUMBER(*,0), 
	"FORMAPAGO" VARCHAR2(40 BYTE), 
	"IDTRANSACCION" VARCHAR2(50 BYTE), 
	"FECHAPAGO" DATE, 
	"CANTIDAD" NUMBER(15,2)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PEDIDOS
--------------------------------------------------------

  CREATE TABLE "PEDIDOS" 
   (	"CODIGOPEDIDO" NUMBER(*,0), 
	"FECHAPEDIDO" DATE, 
	"FECHAESPERADA" DATE, 
	"FECHAENTREGA" DATE DEFAULT NULL, 
	"ESTADO" VARCHAR2(15 BYTE), 
	"COMENTARIOS" CLOB, 
	"CODIGOCLIENTE" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("COMENTARIOS") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES 
  STORAGE(INITIAL 106496 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
--------------------------------------------------------
--  DDL for Table PRODUCTOS
--------------------------------------------------------

  CREATE TABLE "PRODUCTOS" 
   (	"CODIGOPRODUCTO" VARCHAR2(15 BYTE), 
	"NOMBRE" VARCHAR2(70 BYTE), 
	"GAMA" VARCHAR2(50 BYTE), 
	"DIMENSIONES" VARCHAR2(25 BYTE), 
	"PROVEEDOR" VARCHAR2(50 BYTE) DEFAULT NULL, 
	"DESCRIPCION" CLOB, 
	"CANTIDADENSTOCK" NUMBER(*,0), 
	"PRECIOVENTA" NUMBER(15,2), 
	"PRECIOPROVEEDOR" NUMBER(15,2) DEFAULT NULL
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("DESCRIPCION") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES 
  STORAGE(INITIAL 106496 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
REM INSERTING into CLIENTES
SET DEFINE OFF;
Insert into CLIENTES (CODIGOCLIENTE,NOMBRECLIENTE,NOMBRECONTACTO,APELLIDOCONTACTO,TELEFONO,FAX,LINEADIRECCION1,LINEADIRECCION2,CIUDAD,REGION,PAIS,CODIGOPOSTAL,CODIGOEMPLEADOREPVENTAS,LIMITECREDITO) values (1,'DGPRODUCTIONS GARDEN','Daniel G','GoldFish','5556901745','5556901746','False Street 52 2 A',null,'San Francisco',null,'USA','24006',19,3000);
Insert into CLIENTES (CODIGOCLIENTE,NOMBRECLIENTE,NOMBRECONTACTO,APELLIDOCONTACTO,TELEFONO,FAX,LINEADIRECCION1,LINEADIRECCION2,CIUDAD,REGION,PAIS,CODIGOPOSTAL,CODIGOEMPLEADOREPVENTAS,LIMITECREDITO) values (3,'Gardening Associates','Anne','Wright','5557410345','5557410346','Wall-e Avenue',null,'Miami','Miami','USA','24010',19,6000);
Insert into CLIENTES (CODIGOCLIENTE,NOMBRECLIENTE,NOMBRECONTACTO,APELLIDOCONTACTO,TELEFONO,FAX,LINEADIRECCION1,LINEADIRECCION2,CIUDAD,REGION,PAIS,CODIGOPOSTAL,CODIGOEMPLEADOREPVENTAS,LIMITECREDITO) values (4,'Gerudo Valley','Link','Flaute','5552323129','5552323128','Oaks Avenue n?22',null,'New York',null,'USA','85495',22,12000);
Insert into CLIENTES (CODIGOCLIENTE,NOMBRECLIENTE,NOMBRECONTACTO,APELLIDOCONTACTO,TELEFONO,FAX,LINEADIRECCION1,LINEADIRECCION2,CIUDAD,REGION,PAIS,CODIGOPOSTAL,CODIGOEMPLEADOREPVENTAS,LIMITECREDITO) values (5,'Tendo Garden','Akane','Tendo','55591233210','55591233211','Null Street n?69',null,'Miami',null,'USA','696969',22,600000);
Insert into CLIENTES (CODIGOCLIENTE,NOMBRECLIENTE,NOMBRECONTACTO,APELLIDOCONTACTO,TELEFONO,FAX,LINEADIRECCION1,LINEADIRECCION2,CIUDAD,REGION,PAIS,CODIGOPOSTAL,CODIGOEMPLEADOREPVENTAS,LIMITECREDITO) values (6,'Lasas S.A.','Antonio','Lasas','34916540145','34914851312','C/Leganes 15',null,'Fuenlabrada','Madrid','Spain','28945',8,154310);
Insert into CLIENTES (CODIGOCLIENTE,NOMBRECLIENTE,NOMBRECONTACTO,APELLIDOCONTACTO,TELEFONO,FAX,LINEADIRECCION1,LINEADIRECCION2,CIUDAD,REGION,PAIS,CODIGOPOSTAL,CODIGOEMPLEADOREPVENTAS,LIMITECREDITO) values (7,'Beragua','Jose','Bermejo','654987321','916549872','C/pintor segundo','Getafe','Madrid','Madrid','Espa?a','28942',11,20000);
Insert into CLIENTES (CODIGOCLIENTE,NOMBRECLIENTE,NOMBRECONTACTO,APELLIDOCONTACTO,TELEFONO,FAX,LINEADIRECCION1,LINEADIRECCION2,CIUDAD,REGION,PAIS,CODIGOPOSTAL,CODIGOEMPLEADOREPVENTAS,LIMITECREDITO) values (8,'Club Golf Puerta del hierro','Paco','Lopez','62456810','919535678','C/sinesio delgado','Madrid','Madrid','Madrid','Espa?a','28930',11,40000);
Insert into CLIENTES (CODIGOCLIENTE,NOMBRECLIENTE,NOMBRECONTACTO,APELLIDOCONTACTO,TELEFONO,FAX,LINEADIRECCION1,LINEADIRECCION2,CIUDAD,REGION,PAIS,CODIGOPOSTAL,CODIGOEMPLEADOREPVENTAS,LIMITECREDITO) values (9,'Naturagua','Guillermo','Rengifo','689234750','916428956','C/majadahonda','Boadilla','Madrid','Madrid','Espa?a','28947',11,32000);
Insert into CLIENTES (CODIGOCLIENTE,NOMBRECLIENTE,NOMBRECONTACTO,APELLIDOCONTACTO,TELEFONO,FAX,LINEADIRECCION1,LINEADIRECCION2,CIUDAD,REGION,PAIS,CODIGOPOSTAL,CODIGOEMPLEADOREPVENTAS,LIMITECREDITO) values (10,'DaraDistribuciones','David','Serrano','675598001','916421756','C/azores','Fuenlabrada','Madrid','Madrid','Espa?a','28946',11,50000);
Insert into CLIENTES (CODIGOCLIENTE,NOMBRECLIENTE,NOMBRECONTACTO,APELLIDOCONTACTO,TELEFONO,FAX,LINEADIRECCION1,LINEADIRECCION2,CIUDAD,REGION,PAIS,CODIGOPOSTAL,CODIGOEMPLEADOREPVENTAS,LIMITECREDITO) values (11,'Madrile?a de riegos','Jose','Taca?o','655983045','916689215','C/Laga?as','Fuenlabrada','Madrid','Madrid','Espa?a','28943',11,20000);
Insert into CLIENTES (CODIGOCLIENTE,NOMBRECLIENTE,NOMBRECONTACTO,APELLIDOCONTACTO,TELEFONO,FAX,LINEADIRECCION1,LINEADIRECCION2,CIUDAD,REGION,PAIS,CODIGOPOSTAL,CODIGOEMPLEADOREPVENTAS,LIMITECREDITO) values (12,'Lasas S.A.','Antonio','Lasas','34916540145','34914851312','C/Leganes 15',null,'Fuenlabrada','Madrid','Spain','28945',8,154310);
Insert into CLIENTES (CODIGOCLIENTE,NOMBRECLIENTE,NOMBRECONTACTO,APELLIDOCONTACTO,TELEFONO,FAX,LINEADIRECCION1,LINEADIRECCION2,CIUDAD,REGION,PAIS,CODIGOPOSTAL,CODIGOEMPLEADOREPVENTAS,LIMITECREDITO) values (13,'Camunas Jardines S.L.','Pedro','Camunas','34914873241','34914871541','C/Virgenes 45','C/Princesas 2 1?B','San Lorenzo del Escorial','Madrid','Spain','28145',8,16481);
Insert into CLIENTES (CODIGOCLIENTE,NOMBRECLIENTE,NOMBRECONTACTO,APELLIDOCONTACTO,TELEFONO,FAX,LINEADIRECCION1,LINEADIRECCION2,CIUDAD,REGION,PAIS,CODIGOPOSTAL,CODIGOEMPLEADOREPVENTAS,LIMITECREDITO) values (14,'Dardena S.A.','Juan','Rodriguez','34912453217','34912484764','C/Nueva York 74',null,'Madrid','Madrid','Spain','28003',8,321000);
Insert into CLIENTES (CODIGOCLIENTE,NOMBRECLIENTE,NOMBRECONTACTO,APELLIDOCONTACTO,TELEFONO,FAX,LINEADIRECCION1,LINEADIRECCION2,CIUDAD,REGION,PAIS,CODIGOPOSTAL,CODIGOEMPLEADOREPVENTAS,LIMITECREDITO) values (15,'Jardin de Flores','Javier','Villar','654865643','914538776','C/ O?a 34',null,'Madrid','Madrid','Espa?a','28950',30,40000);
Insert into CLIENTES (CODIGOCLIENTE,NOMBRECLIENTE,NOMBRECONTACTO,APELLIDOCONTACTO,TELEFONO,FAX,LINEADIRECCION1,LINEADIRECCION2,CIUDAD,REGION,PAIS,CODIGOPOSTAL,CODIGOEMPLEADOREPVENTAS,LIMITECREDITO) values (16,'Flores Marivi','Maria','Rodriguez','666555444','912458657','C/Leganes24',null,'Fuenlabrada','Madrid','Espa?a','28945',5,1500);
Insert into CLIENTES (CODIGOCLIENTE,NOMBRECLIENTE,NOMBRECONTACTO,APELLIDOCONTACTO,TELEFONO,FAX,LINEADIRECCION1,LINEADIRECCION2,CIUDAD,REGION,PAIS,CODIGOPOSTAL,CODIGOEMPLEADOREPVENTAS,LIMITECREDITO) values (17,'Flowers, S.A','Beatriz','Fernandez','698754159','978453216','C/Luis Salquillo4',null,'Montornes del valles','Barcelona','Espa?a','24586',5,3500);
Insert into CLIENTES (CODIGOCLIENTE,NOMBRECLIENTE,NOMBRECONTACTO,APELLIDOCONTACTO,TELEFONO,FAX,LINEADIRECCION1,LINEADIRECCION2,CIUDAD,REGION,PAIS,CODIGOPOSTAL,CODIGOEMPLEADOREPVENTAS,LIMITECREDITO) values (18,'Naturajardin','Victoria','Cruz','612343529','916548735','Plaza Magall?n 15',null,'Madrid','Madrid','Espa?a','28011',30,5050);
Insert into CLIENTES (CODIGOCLIENTE,NOMBRECLIENTE,NOMBRECONTACTO,APELLIDOCONTACTO,TELEFONO,FAX,LINEADIRECCION1,LINEADIRECCION2,CIUDAD,REGION,PAIS,CODIGOPOSTAL,CODIGOEMPLEADOREPVENTAS,LIMITECREDITO) values (19,'Golf S.A.','Luis','Martinez','916458762','912354475','C/Estancado',null,'Santa cruz de Tenerife','Islas Canarias','Espa?a','38297',12,30000);
Insert into CLIENTES (CODIGOCLIENTE,NOMBRECLIENTE,NOMBRECONTACTO,APELLIDOCONTACTO,TELEFONO,FAX,LINEADIRECCION1,LINEADIRECCION2,CIUDAD,REGION,PAIS,CODIGOPOSTAL,CODIGOEMPLEADOREPVENTAS,LIMITECREDITO) values (20,'AYMERICH GOLF MANAGEMENT, SL','Mario','Suarez','964493072','964493063','C/Letardo',null,'Barcelona','Catalu?a','Espa?a','12320',12,20000);
Insert into CLIENTES (CODIGOCLIENTE,NOMBRECLIENTE,NOMBRECONTACTO,APELLIDOCONTACTO,TELEFONO,FAX,LINEADIRECCION1,LINEADIRECCION2,CIUDAD,REGION,PAIS,CODIGOPOSTAL,CODIGOEMPLEADOREPVENTAS,LIMITECREDITO) values (21,'Aloha','Cristian','Rodrigez','916485852','914489898','C/Roman 3',null,'Canarias','Canarias','Espa?a','35488',12,50000);
Insert into CLIENTES (CODIGOCLIENTE,NOMBRECLIENTE,NOMBRECONTACTO,APELLIDOCONTACTO,TELEFONO,FAX,LINEADIRECCION1,LINEADIRECCION2,CIUDAD,REGION,PAIS,CODIGOPOSTAL,CODIGOEMPLEADOREPVENTAS,LIMITECREDITO) values (22,'El Prat','Francisco','Camacho','916882323','916493211','Avenida Tibidabo',null,' Barcelona','Catalu?a','Espa?a','12320',12,30000);
Insert into CLIENTES (CODIGOCLIENTE,NOMBRECLIENTE,NOMBRECONTACTO,APELLIDOCONTACTO,TELEFONO,FAX,LINEADIRECCION1,LINEADIRECCION2,CIUDAD,REGION,PAIS,CODIGOPOSTAL,CODIGOEMPLEADOREPVENTAS,LIMITECREDITO) values (23,'Sotogrande','Maria','Santillana','915576622','914825645','C/Paseo del Parque',null,'Sotogrande','Cadiz','Espa?a','11310',12,60000);
Insert into CLIENTES (CODIGOCLIENTE,NOMBRECLIENTE,NOMBRECONTACTO,APELLIDOCONTACTO,TELEFONO,FAX,LINEADIRECCION1,LINEADIRECCION2,CIUDAD,REGION,PAIS,CODIGOPOSTAL,CODIGOEMPLEADOREPVENTAS,LIMITECREDITO) values (24,'Vivero Humanes','Federico','Gomez','654987690','916040875','C/Miguel Echegaray 54',null,'Humanes','Madrid','Espa?a','28970',30,7430);
Insert into CLIENTES (CODIGOCLIENTE,NOMBRECLIENTE,NOMBRECONTACTO,APELLIDOCONTACTO,TELEFONO,FAX,LINEADIRECCION1,LINEADIRECCION2,CIUDAD,REGION,PAIS,CODIGOPOSTAL,CODIGOEMPLEADOREPVENTAS,LIMITECREDITO) values (25,'Fuenla City','Tony','Mu?oz Mena','675842139','915483754','C/Callo 52',null,'Fuenlabrada','Madrid','Espa?a','28574',5,4500);
Insert into CLIENTES (CODIGOCLIENTE,NOMBRECLIENTE,NOMBRECONTACTO,APELLIDOCONTACTO,TELEFONO,FAX,LINEADIRECCION1,LINEADIRECCION2,CIUDAD,REGION,PAIS,CODIGOPOSTAL,CODIGOEMPLEADOREPVENTAS,LIMITECREDITO) values (26,'Jardines y Mansiones CACTUS SL','Eva Mar?a','S?nchez','916877445','914477777','Pol?gono Industrial Maspalomas, N?52','M?stoles','Madrid','Madrid','Espa?a','29874',9,76000);
Insert into CLIENTES (CODIGOCLIENTE,NOMBRECLIENTE,NOMBRECONTACTO,APELLIDOCONTACTO,TELEFONO,FAX,LINEADIRECCION1,LINEADIRECCION2,CIUDAD,REGION,PAIS,CODIGOPOSTAL,CODIGOEMPLEADOREPVENTAS,LIMITECREDITO) values (27,'Jardiner?as Mat?as SL','Mat?as','San Mart?n','916544147','917897474','C/Francisco Arce, N?44','Bustarviejo','Madrid','Madrid','Espa?a','37845',9,100500);
Insert into CLIENTES (CODIGOCLIENTE,NOMBRECLIENTE,NOMBRECONTACTO,APELLIDOCONTACTO,TELEFONO,FAX,LINEADIRECCION1,LINEADIRECCION2,CIUDAD,REGION,PAIS,CODIGOPOSTAL,CODIGOEMPLEADOREPVENTAS,LIMITECREDITO) values (28,'Agrojardin','Benito','Lopez','675432926','916549264','C/Mar Caspio 43',null,'Getafe','Madrid','Espa?a','28904',30,8040);
Insert into CLIENTES (CODIGOCLIENTE,NOMBRECLIENTE,NOMBRECONTACTO,APELLIDOCONTACTO,TELEFONO,FAX,LINEADIRECCION1,LINEADIRECCION2,CIUDAD,REGION,PAIS,CODIGOPOSTAL,CODIGOEMPLEADOREPVENTAS,LIMITECREDITO) values (29,'Top Campo','Joseluis','Sanchez','685746512','974315924','C/Ibiza 32',null,'Humanes','Madrid','Espa?a','28574',5,5500);
Insert into CLIENTES (CODIGOCLIENTE,NOMBRECLIENTE,NOMBRECONTACTO,APELLIDOCONTACTO,TELEFONO,FAX,LINEADIRECCION1,LINEADIRECCION2,CIUDAD,REGION,PAIS,CODIGOPOSTAL,CODIGOEMPLEADOREPVENTAS,LIMITECREDITO) values (30,'Jardineria Sara','Sara','Marquez','675124537','912475843','C/Lima 1',null,'Fenlabrada','Madrid','Espa?a','27584',5,7500);
Insert into CLIENTES (CODIGOCLIENTE,NOMBRECLIENTE,NOMBRECONTACTO,APELLIDOCONTACTO,TELEFONO,FAX,LINEADIRECCION1,LINEADIRECCION2,CIUDAD,REGION,PAIS,CODIGOPOSTAL,CODIGOEMPLEADOREPVENTAS,LIMITECREDITO) values (31,'Campohermoso','Luis','Jimenez','645925376','916159116','C/Peru 78',null,'Fuenlabrada','Madrid','Espa?a','28945',30,3250);
Insert into CLIENTES (CODIGOCLIENTE,NOMBRECLIENTE,NOMBRECONTACTO,APELLIDOCONTACTO,TELEFONO,FAX,LINEADIRECCION1,LINEADIRECCION2,CIUDAD,REGION,PAIS,CODIGOPOSTAL,CODIGOEMPLEADOREPVENTAS,LIMITECREDITO) values (32,'france telecom','Fraï¿½ois','Toulou','(33)5120578961','(33)5120578961','6 place d Alleray 15ï¿½me',null,'Paris',null,'France','75010',16,10000);
Insert into CLIENTES (CODIGOCLIENTE,NOMBRECLIENTE,NOMBRECONTACTO,APELLIDOCONTACTO,TELEFONO,FAX,LINEADIRECCION1,LINEADIRECCION2,CIUDAD,REGION,PAIS,CODIGOPOSTAL,CODIGOEMPLEADOREPVENTAS,LIMITECREDITO) values (33,'Mus?e du Louvre','Pierre','Delacroux','(33)0140205050','(33)0140205442','Quai du Louvre',null,'Paris',null,'France','75058',16,30000);
Insert into CLIENTES (CODIGOCLIENTE,NOMBRECLIENTE,NOMBRECONTACTO,APELLIDOCONTACTO,TELEFONO,FAX,LINEADIRECCION1,LINEADIRECCION2,CIUDAD,REGION,PAIS,CODIGOPOSTAL,CODIGOEMPLEADOREPVENTAS,LIMITECREDITO) values (35,'Tutifruti S.A','Jacob','Jones','2 9261-2433','2 9283-1695','level 24, St. Martins Tower.-31 Market St.',null,'Sydney','Nueva Gales del Sur','Australia','2000',31,10000);
Insert into CLIENTES (CODIGOCLIENTE,NOMBRECLIENTE,NOMBRECONTACTO,APELLIDOCONTACTO,TELEFONO,FAX,LINEADIRECCION1,LINEADIRECCION2,CIUDAD,REGION,PAIS,CODIGOPOSTAL,CODIGOEMPLEADOREPVENTAS,LIMITECREDITO) values (36,'FLORES S.L.','Antonio','Romero','654352981','685249700','Avenida Espa?a',null,'Madrid','Fuenlabrada','Espa?a','29643',18,6000);
Insert into CLIENTES (CODIGOCLIENTE,NOMBRECLIENTE,NOMBRECONTACTO,APELLIDOCONTACTO,TELEFONO,FAX,LINEADIRECCION1,LINEADIRECCION2,CIUDAD,REGION,PAIS,CODIGOPOSTAL,CODIGOEMPLEADOREPVENTAS,LIMITECREDITO) values (37,'THE MAGIC GARDEN','Richard','Mcain','926523468','9364875882','Lihgting Park',null,'London','London','United Kingdom','65930',18,10000);
Insert into CLIENTES (CODIGOCLIENTE,NOMBRECLIENTE,NOMBRECONTACTO,APELLIDOCONTACTO,TELEFONO,FAX,LINEADIRECCION1,LINEADIRECCION2,CIUDAD,REGION,PAIS,CODIGOPOSTAL,CODIGOEMPLEADOREPVENTAS,LIMITECREDITO) values (38,'El Jardin Viviente S.L','Justin','Smith','2 8005-7161','2 8005-7162','176 Cumberland Street The rocks',null,'Sydney','Nueva Gales del Sur','Australia','2003',31,8000);
REM INSERTING into DETALLEPEDIDOS
SET DEFINE OFF;
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (1,'FR-67',10,70,3);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (1,'OR-127',40,4,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (1,'OR-141',25,4,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (1,'OR-241',15,19,4);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (1,'OR-99',23,14,5);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (2,'FR-4',3,29,6);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (2,'FR-40',7,8,7);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (2,'OR-140',50,4,3);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (2,'OR-141',20,5,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (2,'OR-159',12,6,5);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (2,'OR-227',67,64,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (2,'OR-247',5,462,4);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (3,'FR-48',120,9,6);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (3,'OR-122',32,5,4);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (3,'OR-123',11,5,5);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (3,'OR-213',30,266,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (3,'OR-217',15,65,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (3,'OR-218',24,25,3);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (4,'FR-31',12,8,7);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (4,'FR-34',42,8,6);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (4,'FR-40',42,9,8);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (4,'OR-152',3,6,5);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (4,'OR-155',4,6,3);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (4,'OR-156',17,9,4);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (4,'OR-157',38,10,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (4,'OR-222',21,59,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (8,'FR-106',3,11,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (8,'FR-108',1,32,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (8,'FR-11',10,100,3);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (9,'AR-001',80,1,3);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (9,'AR-008',450,1,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (9,'FR-106',80,8,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (9,'FR-69',15,91,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (10,'FR-82',5,70,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (10,'FR-91',30,75,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (10,'OR-234',5,64,3);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (11,'AR-006',180,1,3);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (11,'OR-247',80,8,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (12,'AR-009',290,1,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (13,'11679',5,14,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (13,'21636',12,14,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (13,'FR-11',5,100,3);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (14,'FR-100',8,11,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (14,'FR-13',13,57,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (15,'FR-84',4,13,3);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (15,'OR-101',2,6,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (15,'OR-156',6,10,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (15,'OR-203',9,10,4);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (16,'30310',12,12,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (16,'FR-36',10,9,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (17,'11679',5,14,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (17,'22225',5,12,3);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (17,'FR-37',5,9,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (17,'FR-64',5,22,4);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (17,'OR-136',5,18,5);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (18,'22225',4,12,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (18,'FR-22',2,4,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (18,'OR-159',10,6,3);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (19,'30310',9,12,5);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (19,'FR-23',6,8,4);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (19,'FR-75',1,32,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (19,'FR-84',5,13,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (19,'OR-208',20,4,3);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (20,'11679',14,14,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (20,'30310',8,12,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (21,'21636',5,14,3);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (21,'FR-18',22,4,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (21,'FR-53',3,8,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (22,'OR-240',1,6,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (23,'AR-002',110,1,4);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (23,'FR-107',50,22,3);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (23,'FR-85',4,70,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (23,'OR-249',30,5,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (24,'22225',3,15,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (24,'FR-1',4,7,4);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (24,'FR-23',2,7,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (24,'OR-241',10,20,3);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (25,'FR-77',15,69,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (25,'FR-9',4,30,3);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (25,'FR-94',10,30,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (26,'FR-15',9,25,3);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (26,'OR-188',4,25,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (26,'OR-218',14,25,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (27,'OR-101',22,6,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (27,'OR-102',22,6,3);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (27,'OR-186',40,6,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (28,'FR-11',8,99,3);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (28,'OR-213',3,266,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (28,'OR-247',1,462,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (29,'FR-82',4,70,4);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (29,'FR-9',4,28,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (29,'FR-94',20,31,5);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (29,'OR-129',2,111,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (29,'OR-160',10,9,3);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (30,'AR-004',10,1,6);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (30,'FR-108',2,32,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (30,'FR-12',2,19,3);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (30,'FR-72',4,31,5);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (30,'FR-89',10,45,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (30,'OR-120',5,5,4);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (31,'AR-009',25,2,3);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (31,'FR-102',1,20,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (31,'FR-4',6,29,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (32,'11679',1,14,4);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (32,'21636',4,15,5);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (32,'22225',1,15,3);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (32,'OR-128',29,100,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (32,'OR-193',5,20,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (33,'FR-17',423,2,4);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (33,'FR-29',120,8,3);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (33,'OR-214',212,10,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (33,'OR-247',150,462,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (34,'FR-3',56,7,4);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (34,'FR-7',12,29,3);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (34,'OR-172',20,18,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (34,'OR-174',24,18,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (35,'21636',12,14,4);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (35,'FR-47',55,8,3);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (35,'OR-165',3,10,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (35,'OR-181',36,10,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (35,'OR-225',72,10,5);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (36,'30310',4,12,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (36,'FR-1',2,7,3);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (36,'OR-147',6,7,4);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (36,'OR-203',1,12,5);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (36,'OR-99',15,13,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (37,'FR-105',4,70,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (37,'FR-57',203,8,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (37,'OR-176',38,10,3);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (38,'11679',5,14,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (38,'21636',2,14,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (39,'22225',3,12,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (39,'30310',6,12,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (40,'AR-001',4,1,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (40,'AR-002',8,1,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (41,'AR-003',5,1,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (41,'AR-004',5,1,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (42,'AR-005',3,1,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (42,'AR-006',1,1,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (43,'AR-007',9,1,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (44,'AR-008',5,1,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (45,'AR-009',6,1,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (45,'AR-010',4,1,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (46,'FR-1',4,7,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (46,'FR-10',8,7,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (47,'FR-100',9,11,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (47,'FR-101',5,13,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (48,'FR-102',1,18,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (48,'FR-103',1,25,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (48,'OR-234',50,64,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (48,'OR-236',45,49,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (48,'OR-237',50,19,3);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (50,'OR-225',12,10,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (50,'OR-226',15,38,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (50,'OR-227',44,64,3);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (51,'OR-209',50,10,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (51,'OR-210',80,39,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (51,'OR-211',70,59,3);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (53,'FR-2',1,7,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (53,'FR-85',1,70,3);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (53,'FR-86',2,11,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (53,'OR-116',6,7,4);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (54,'11679',3,14,3);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (54,'FR-100',45,10,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (54,'FR-18',5,4,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (54,'FR-79',3,22,4);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (54,'OR-116',8,7,6);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (54,'OR-123',3,5,5);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (54,'OR-168',2,10,7);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (55,'OR-115',9,7,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (55,'OR-213',2,266,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (55,'OR-227',6,64,5);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (55,'OR-243',2,64,4);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (55,'OR-247',1,462,3);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (56,'OR-129',1,115,5);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (56,'OR-130',10,18,6);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (56,'OR-179',1,6,3);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (56,'OR-196',3,10,4);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (56,'OR-207',4,4,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (56,'OR-250',3,10,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (57,'FR-69',6,91,4);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (57,'FR-81',3,49,3);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (57,'FR-84',2,13,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (57,'FR-94',6,9,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (58,'OR-102',65,18,3);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (58,'OR-139',80,4,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (58,'OR-172',69,15,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (58,'OR-177',150,15,4);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (74,'FR-67',15,70,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (74,'OR-227',34,64,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (74,'OR-247',42,8,3);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (75,'AR-006',60,1,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (75,'FR-87',24,22,3);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (75,'OR-157',46,10,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (76,'AR-009',250,1,5);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (76,'FR-79',40,22,3);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (76,'FR-87',24,22,4);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (76,'FR-94',35,9,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (76,'OR-196',25,10,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (77,'22225',34,12,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (77,'30310',15,12,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (78,'FR-53',25,8,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (78,'FR-85',56,70,3);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (78,'OR-157',42,10,4);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (78,'OR-208',30,4,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (79,'OR-240',50,6,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (80,'FR-11',40,100,3);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (80,'FR-36',47,9,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (80,'OR-136',75,18,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (81,'OR-208',30,4,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (82,'OR-227',34,64,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (83,'OR-208',30,4,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (89,'FR-108',3,32,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (89,'FR-3',15,7,6);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (89,'FR-42',12,8,4);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (89,'FR-66',5,49,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (89,'FR-87',4,22,3);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (89,'OR-157',8,10,5);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (90,'AR-001',19,1,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (90,'AR-002',10,1,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (90,'AR-003',12,1,3);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (91,'FR-100',52,11,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (91,'FR-101',14,13,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (91,'FR-102',35,18,3);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (92,'FR-108',12,23,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (92,'FR-11',20,100,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (92,'FR-12',30,21,3);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (93,'FR-54',25,9,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (93,'FR-58',51,11,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (93,'FR-60',3,32,3);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (94,'11679',12,14,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (94,'FR-11',33,100,3);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (94,'FR-4',79,29,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (95,'FR-10',9,7,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (95,'FR-75',6,32,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (95,'FR-82',5,70,3);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (96,'FR-43',6,8,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (96,'FR-6',16,7,4);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (96,'FR-71',10,22,3);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (96,'FR-90',4,70,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (97,'FR-41',12,8,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (97,'FR-54',14,9,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (97,'OR-156',10,10,3);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (98,'FR-33',14,8,4);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (98,'FR-56',16,8,3);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (98,'FR-60',8,32,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (98,'FR-8',18,6,5);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (98,'FR-85',6,70,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (99,'OR-157',15,10,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (99,'OR-227',30,64,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (100,'FR-87',20,22,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (100,'FR-94',40,9,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (101,'AR-006',50,1,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (101,'AR-009',159,1,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (102,'22225',32,12,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (102,'30310',23,12,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (103,'FR-53',12,8,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (103,'OR-208',52,4,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (104,'FR-85',9,70,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (104,'OR-157',113,10,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (105,'OR-227',21,64,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (105,'OR-240',27,6,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (106,'AR-009',231,1,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (106,'OR-136',47,18,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (107,'30310',143,12,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (107,'FR-11',15,100,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (108,'FR-53',53,8,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (108,'OR-208',59,4,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (109,'FR-22',8,4,5);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (109,'FR-36',12,9,3);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (109,'FR-45',14,8,4);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (109,'OR-104',20,10,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (109,'OR-119',10,5,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (109,'OR-125',3,5,6);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (109,'OR-130',2,18,7);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (110,'AR-010',6,1,3);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (110,'FR-1',14,7,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (110,'FR-16',1,45,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (116,'21636',5,14,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (116,'AR-001',32,1,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (116,'AR-005',18,1,5);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (116,'FR-33',13,8,3);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (116,'OR-200',10,4,4);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (117,'FR-78',2,15,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (117,'FR-80',1,32,3);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (117,'OR-146',17,4,2);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (117,'OR-179',4,6,4);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (128,'AR-004',15,1,1);
Insert into DETALLEPEDIDOS (CODIGOPEDIDO,CODIGOPRODUCTO,CANTIDAD,PRECIOUNIDAD,NUMEROLINEA) values (128,'OR-150',18,2,2);
REM INSERTING into EMPLEADOS
SET DEFINE OFF;
Insert into EMPLEADOS (CODIGOEMPLEADO,NOMBRE,APELLIDO1,APELLIDO2,EXTENSION,EMAIL,CODIGOOFICINA,CODIGOJEFE,PUESTO) values (1,'Marcos','Maga?a','Perez','3897','marcos@jardineria.es','TAL-ES',null,'Director General');
Insert into EMPLEADOS (CODIGOEMPLEADO,NOMBRE,APELLIDO1,APELLIDO2,EXTENSION,EMAIL,CODIGOOFICINA,CODIGOJEFE,PUESTO) values (2,'Ruben','L?pez','Martinez','2899','rlopez@jardineria.es','TAL-ES',1,'Subdirector Marketing');
Insert into EMPLEADOS (CODIGOEMPLEADO,NOMBRE,APELLIDO1,APELLIDO2,EXTENSION,EMAIL,CODIGOOFICINA,CODIGOJEFE,PUESTO) values (3,'Alberto','Soria','Carrasco','2837','asoria@jardineria.es','TAL-ES',2,'Subdirector Ventas');
Insert into EMPLEADOS (CODIGOEMPLEADO,NOMBRE,APELLIDO1,APELLIDO2,EXTENSION,EMAIL,CODIGOOFICINA,CODIGOJEFE,PUESTO) values (4,'Maria','Sol?s','Jerez','2847','msolis@jardineria.es','TAL-ES',2,'Secretaria');
Insert into EMPLEADOS (CODIGOEMPLEADO,NOMBRE,APELLIDO1,APELLIDO2,EXTENSION,EMAIL,CODIGOOFICINA,CODIGOJEFE,PUESTO) values (5,'Felipe','Rosas','Marquez','2844','frosas@jardineria.es','TAL-ES',3,'Representante Ventas');
Insert into EMPLEADOS (CODIGOEMPLEADO,NOMBRE,APELLIDO1,APELLIDO2,EXTENSION,EMAIL,CODIGOOFICINA,CODIGOJEFE,PUESTO) values (6,'Juan Carlos','Ortiz','Serrano','2845','cortiz@jardineria.es','TAL-ES',3,'Representante Ventas');
Insert into EMPLEADOS (CODIGOEMPLEADO,NOMBRE,APELLIDO1,APELLIDO2,EXTENSION,EMAIL,CODIGOOFICINA,CODIGOJEFE,PUESTO) values (7,'Carlos','Soria','Jimenez','2444','csoria@jardineria.es','MAD-ES',3,'Director Oficina');
Insert into EMPLEADOS (CODIGOEMPLEADO,NOMBRE,APELLIDO1,APELLIDO2,EXTENSION,EMAIL,CODIGOOFICINA,CODIGOJEFE,PUESTO) values (8,'Mariano','L?pez','Murcia','2442','mlopez@jardineria.es','MAD-ES',7,'Representante Ventas');
Insert into EMPLEADOS (CODIGOEMPLEADO,NOMBRE,APELLIDO1,APELLIDO2,EXTENSION,EMAIL,CODIGOOFICINA,CODIGOJEFE,PUESTO) values (9,'Lucio','Campoamor','Mart?n','2442','lcampoamor@jardineria.es','MAD-ES',7,'Representante Ventas');
Insert into EMPLEADOS (CODIGOEMPLEADO,NOMBRE,APELLIDO1,APELLIDO2,EXTENSION,EMAIL,CODIGOOFICINA,CODIGOJEFE,PUESTO) values (10,'Hilario','Rodriguez','Huertas','2444','hrodriguez@jardineria.es','MAD-ES',7,'Representante Ventas');
Insert into EMPLEADOS (CODIGOEMPLEADO,NOMBRE,APELLIDO1,APELLIDO2,EXTENSION,EMAIL,CODIGOOFICINA,CODIGOJEFE,PUESTO) values (11,'Emmanuel','Maga?a','Perez','2518','manu@jardineria.es','BCN-ES',3,'Director Oficina');
Insert into EMPLEADOS (CODIGOEMPLEADO,NOMBRE,APELLIDO1,APELLIDO2,EXTENSION,EMAIL,CODIGOOFICINA,CODIGOJEFE,PUESTO) values (12,'Jos? Manuel','Martinez','De la Osa','2519','jmmart@hotmail.es','BCN-ES',11,'Representante Ventas');
Insert into EMPLEADOS (CODIGOEMPLEADO,NOMBRE,APELLIDO1,APELLIDO2,EXTENSION,EMAIL,CODIGOOFICINA,CODIGOJEFE,PUESTO) values (13,'David','Palma','Aceituno','2519','dpalma@jardineria.es','BCN-ES',11,'Representante Ventas');
Insert into EMPLEADOS (CODIGOEMPLEADO,NOMBRE,APELLIDO1,APELLIDO2,EXTENSION,EMAIL,CODIGOOFICINA,CODIGOJEFE,PUESTO) values (14,'Oscar','Palma','Aceituno','2519','opalma@jardineria.es','BCN-ES',11,'Representante Ventas');
Insert into EMPLEADOS (CODIGOEMPLEADO,NOMBRE,APELLIDO1,APELLIDO2,EXTENSION,EMAIL,CODIGOOFICINA,CODIGOJEFE,PUESTO) values (15,'Francois','Fignon',null,'9981','ffignon@gardening.com','PAR-FR',3,'Director Oficina');
Insert into EMPLEADOS (CODIGOEMPLEADO,NOMBRE,APELLIDO1,APELLIDO2,EXTENSION,EMAIL,CODIGOOFICINA,CODIGOJEFE,PUESTO) values (16,'Lionel','Narvaez',null,'9982','lnarvaez@gardening.com','PAR-FR',15,'Representante Ventas');
Insert into EMPLEADOS (CODIGOEMPLEADO,NOMBRE,APELLIDO1,APELLIDO2,EXTENSION,EMAIL,CODIGOOFICINA,CODIGOJEFE,PUESTO) values (17,'Laurent','Serra',null,'9982','lserra@gardening.com','PAR-FR',15,'Representante Ventas');
Insert into EMPLEADOS (CODIGOEMPLEADO,NOMBRE,APELLIDO1,APELLIDO2,EXTENSION,EMAIL,CODIGOOFICINA,CODIGOJEFE,PUESTO) values (18,'Michael','Bolton',null,'7454','mbolton@gardening.com','SFC-USA',3,'Director Oficina');
Insert into EMPLEADOS (CODIGOEMPLEADO,NOMBRE,APELLIDO1,APELLIDO2,EXTENSION,EMAIL,CODIGOOFICINA,CODIGOJEFE,PUESTO) values (19,'Walter Santiago','Sanchez','Lopez','7454','wssanchez@gardening.com','SFC-USA',18,'Representante Ventas');
Insert into EMPLEADOS (CODIGOEMPLEADO,NOMBRE,APELLIDO1,APELLIDO2,EXTENSION,EMAIL,CODIGOOFICINA,CODIGOJEFE,PUESTO) values (20,'Hilary','Washington',null,'7565','hwashington@gardening.com','BOS-USA',3,'Director Oficina');
Insert into EMPLEADOS (CODIGOEMPLEADO,NOMBRE,APELLIDO1,APELLIDO2,EXTENSION,EMAIL,CODIGOOFICINA,CODIGOJEFE,PUESTO) values (21,'Marcus','Paxton',null,'7565','mpaxton@gardening.com','BOS-USA',20,'Representante Ventas');
Insert into EMPLEADOS (CODIGOEMPLEADO,NOMBRE,APELLIDO1,APELLIDO2,EXTENSION,EMAIL,CODIGOOFICINA,CODIGOJEFE,PUESTO) values (22,'Lorena','Paxton',null,'7665','lpaxton@gardening.com','BOS-USA',20,'Representante Ventas');
Insert into EMPLEADOS (CODIGOEMPLEADO,NOMBRE,APELLIDO1,APELLIDO2,EXTENSION,EMAIL,CODIGOOFICINA,CODIGOJEFE,PUESTO) values (23,'Nei','Nishikori',null,'8734','nnishikori@gardening.com','TOK-JP',3,'Director Oficina');
Insert into EMPLEADOS (CODIGOEMPLEADO,NOMBRE,APELLIDO1,APELLIDO2,EXTENSION,EMAIL,CODIGOOFICINA,CODIGOJEFE,PUESTO) values (24,'Narumi','Riko',null,'8734','nriko@gardening.com','TOK-JP',23,'Representante Ventas');
Insert into EMPLEADOS (CODIGOEMPLEADO,NOMBRE,APELLIDO1,APELLIDO2,EXTENSION,EMAIL,CODIGOOFICINA,CODIGOJEFE,PUESTO) values (25,'Takuma','Nomura',null,'8735','tnomura@gardening.com','TOK-JP',23,'Representante Ventas');
Insert into EMPLEADOS (CODIGOEMPLEADO,NOMBRE,APELLIDO1,APELLIDO2,EXTENSION,EMAIL,CODIGOOFICINA,CODIGOJEFE,PUESTO) values (26,'Amy','Johnson',null,'3321','ajohnson@gardening.com','LON-UK',3,'Director Oficina');
Insert into EMPLEADOS (CODIGOEMPLEADO,NOMBRE,APELLIDO1,APELLIDO2,EXTENSION,EMAIL,CODIGOOFICINA,CODIGOJEFE,PUESTO) values (27,'Larry','Westfalls',null,'3322','lwestfalls@gardening.com','LON-UK',26,'Representante Ventas');
Insert into EMPLEADOS (CODIGOEMPLEADO,NOMBRE,APELLIDO1,APELLIDO2,EXTENSION,EMAIL,CODIGOOFICINA,CODIGOJEFE,PUESTO) values (28,'John','Walton',null,'3322','jwalton@gardening.com','LON-UK',26,'Representante Ventas');
Insert into EMPLEADOS (CODIGOEMPLEADO,NOMBRE,APELLIDO1,APELLIDO2,EXTENSION,EMAIL,CODIGOOFICINA,CODIGOJEFE,PUESTO) values (29,'Kevin','Fallmer',null,'3210','kfalmer@gardening.com','SYD-AU',3,'Director Oficina');
Insert into EMPLEADOS (CODIGOEMPLEADO,NOMBRE,APELLIDO1,APELLIDO2,EXTENSION,EMAIL,CODIGOOFICINA,CODIGOJEFE,PUESTO) values (30,'Julian','Bellinelli',null,'3211','jbellinelli@gardening.com','SYD-AU',29,'Representante Ventas');
Insert into EMPLEADOS (CODIGOEMPLEADO,NOMBRE,APELLIDO1,APELLIDO2,EXTENSION,EMAIL,CODIGOOFICINA,CODIGOJEFE,PUESTO) values (31,'Mariko','Kishi',null,'3211','mkishi@gardening.com','SYD-AU',29,'Representante Ventas');
REM INSERTING into GAMASPRODUCTOS
SET DEFINE OFF;
Insert into GAMASPRODUCTOS (GAMA) values ('Arom?ticas');
Insert into GAMASPRODUCTOS (GAMA) values ('Frutales');
Insert into GAMASPRODUCTOS (GAMA) values ('Herbaceas');
Insert into GAMASPRODUCTOS (GAMA) values ('Herramientas');
Insert into GAMASPRODUCTOS (GAMA) values ('Ornamentales');
REM INSERTING into OFICINAS
SET DEFINE OFF;
Insert into OFICINAS (CODIGOOFICINA,CIUDAD,PAIS,REGION,CODIGOPOSTAL,TELEFONO,LINEADIRECCION1,LINEADIRECCION2) values ('BCN-ES','Barcelona','Espa?a','Barcelona','08019','+34 93 3561182','Avenida Diagonal, 38','3A escalera Derecha');
Insert into OFICINAS (CODIGOOFICINA,CIUDAD,PAIS,REGION,CODIGOPOSTAL,TELEFONO,LINEADIRECCION1,LINEADIRECCION2) values ('BOS-USA','Boston','EEUU','MA','02108','+1 215 837 0825','1550 Court Place','Suite 102');
Insert into OFICINAS (CODIGOOFICINA,CIUDAD,PAIS,REGION,CODIGOPOSTAL,TELEFONO,LINEADIRECCION1,LINEADIRECCION2) values ('LON-UK','Londres','Inglaterra','EMEA','EC2N 1HN','+44 20 78772041','52 Old Broad Street','Ground Floor');
Insert into OFICINAS (CODIGOOFICINA,CIUDAD,PAIS,REGION,CODIGOPOSTAL,TELEFONO,LINEADIRECCION1,LINEADIRECCION2) values ('MAD-ES','Madrid','Espa?a','Madrid','28032','+34 91 7514487','Bulevar Indalecio Prieto, 32',null);
Insert into OFICINAS (CODIGOOFICINA,CIUDAD,PAIS,REGION,CODIGOPOSTAL,TELEFONO,LINEADIRECCION1,LINEADIRECCION2) values ('PAR-FR','Paris','Francia','EMEA','75017','+33 14 723 4404','29 Rue Jouffroy d''abbans',null);
Insert into OFICINAS (CODIGOOFICINA,CIUDAD,PAIS,REGION,CODIGOPOSTAL,TELEFONO,LINEADIRECCION1,LINEADIRECCION2) values ('SFC-USA','San Francisco','EEUU','CA','94080','+1 650 219 4782','100 Market Street','Suite 300');
Insert into OFICINAS (CODIGOOFICINA,CIUDAD,PAIS,REGION,CODIGOPOSTAL,TELEFONO,LINEADIRECCION1,LINEADIRECCION2) values ('SYD-AU','Sydney','Australia','APAC','NSW 2010','+61 2 9264 2451','5-11 Wentworth Avenue','Floor #2');
Insert into OFICINAS (CODIGOOFICINA,CIUDAD,PAIS,REGION,CODIGOPOSTAL,TELEFONO,LINEADIRECCION1,LINEADIRECCION2) values ('TAL-ES','Talavera de la Reina','Espa?a','Castilla-LaMancha','45632','+34 925 867231','Francisco Aguirre, 32','5? piso (exterior)');
Insert into OFICINAS (CODIGOOFICINA,CIUDAD,PAIS,REGION,CODIGOPOSTAL,TELEFONO,LINEADIRECCION1,LINEADIRECCION2) values ('TOK-JP','Tokyo','Jap?n','Chiyoda-Ku','102-8578','+81 33 224 5000','4-1 Kioicho',null);
REM INSERTING into PAGOS
SET DEFINE OFF;
Insert into PAGOS (CODIGOCLIENTE,FORMAPAGO,IDTRANSACCION,FECHAPAGO,CANTIDAD) values (1,'PayPal','ak-std-000001',to_date('10/12/08','DD/MM/RR'),2000);
Insert into PAGOS (CODIGOCLIENTE,FORMAPAGO,IDTRANSACCION,FECHAPAGO,CANTIDAD) values (1,'PayPal','ak-std-000002',to_date('12/10/08','DD/MM/RR'),2000);
Insert into PAGOS (CODIGOCLIENTE,FORMAPAGO,IDTRANSACCION,FECHAPAGO,CANTIDAD) values (3,'PayPal','ak-std-000003',to_date('16/01/09','DD/MM/RR'),5000);
Insert into PAGOS (CODIGOCLIENTE,FORMAPAGO,IDTRANSACCION,FECHAPAGO,CANTIDAD) values (3,'PayPal','ak-std-000004',to_date('16/02/09','DD/MM/RR'),5000);
Insert into PAGOS (CODIGOCLIENTE,FORMAPAGO,IDTRANSACCION,FECHAPAGO,CANTIDAD) values (3,'PayPal','ak-std-000005',to_date('19/02/09','DD/MM/RR'),926);
Insert into PAGOS (CODIGOCLIENTE,FORMAPAGO,IDTRANSACCION,FECHAPAGO,CANTIDAD) values (4,'PayPal','ak-std-000006',to_date('08/01/07','DD/MM/RR'),20000);
Insert into PAGOS (CODIGOCLIENTE,FORMAPAGO,IDTRANSACCION,FECHAPAGO,CANTIDAD) values (4,'PayPal','ak-std-000007',to_date('08/01/07','DD/MM/RR'),20000);
Insert into PAGOS (CODIGOCLIENTE,FORMAPAGO,IDTRANSACCION,FECHAPAGO,CANTIDAD) values (4,'PayPal','ak-std-000008',to_date('08/01/07','DD/MM/RR'),20000);
Insert into PAGOS (CODIGOCLIENTE,FORMAPAGO,IDTRANSACCION,FECHAPAGO,CANTIDAD) values (4,'PayPal','ak-std-000009',to_date('08/01/07','DD/MM/RR'),20000);
Insert into PAGOS (CODIGOCLIENTE,FORMAPAGO,IDTRANSACCION,FECHAPAGO,CANTIDAD) values (4,'PayPal','ak-std-000010',to_date('08/01/07','DD/MM/RR'),1849);
Insert into PAGOS (CODIGOCLIENTE,FORMAPAGO,IDTRANSACCION,FECHAPAGO,CANTIDAD) values (5,'Transferencia','ak-std-000011',to_date('18/01/06','DD/MM/RR'),23794);
Insert into PAGOS (CODIGOCLIENTE,FORMAPAGO,IDTRANSACCION,FECHAPAGO,CANTIDAD) values (7,'Cheque','ak-std-000012',to_date('13/01/09','DD/MM/RR'),2390);
Insert into PAGOS (CODIGOCLIENTE,FORMAPAGO,IDTRANSACCION,FECHAPAGO,CANTIDAD) values (9,'PayPal','ak-std-000013',to_date('06/01/09','DD/MM/RR'),929);
Insert into PAGOS (CODIGOCLIENTE,FORMAPAGO,IDTRANSACCION,FECHAPAGO,CANTIDAD) values (13,'PayPal','ak-std-000014',to_date('04/08/08','DD/MM/RR'),2246);
Insert into PAGOS (CODIGOCLIENTE,FORMAPAGO,IDTRANSACCION,FECHAPAGO,CANTIDAD) values (14,'PayPal','ak-std-000015',to_date('15/07/08','DD/MM/RR'),4160);
Insert into PAGOS (CODIGOCLIENTE,FORMAPAGO,IDTRANSACCION,FECHAPAGO,CANTIDAD) values (15,'PayPal','ak-std-000016',to_date('15/01/09','DD/MM/RR'),2081);
Insert into PAGOS (CODIGOCLIENTE,FORMAPAGO,IDTRANSACCION,FECHAPAGO,CANTIDAD) values (15,'PayPal','ak-std-000035',to_date('15/02/09','DD/MM/RR'),10000);
Insert into PAGOS (CODIGOCLIENTE,FORMAPAGO,IDTRANSACCION,FECHAPAGO,CANTIDAD) values (16,'PayPal','ak-std-000017',to_date('16/02/09','DD/MM/RR'),4399);
Insert into PAGOS (CODIGOCLIENTE,FORMAPAGO,IDTRANSACCION,FECHAPAGO,CANTIDAD) values (19,'PayPal','ak-std-000018',to_date('06/03/09','DD/MM/RR'),232);
Insert into PAGOS (CODIGOCLIENTE,FORMAPAGO,IDTRANSACCION,FECHAPAGO,CANTIDAD) values (23,'PayPal','ak-std-000019',to_date('26/03/09','DD/MM/RR'),272);
Insert into PAGOS (CODIGOCLIENTE,FORMAPAGO,IDTRANSACCION,FECHAPAGO,CANTIDAD) values (26,'PayPal','ak-std-000020',to_date('18/03/08','DD/MM/RR'),18846);
Insert into PAGOS (CODIGOCLIENTE,FORMAPAGO,IDTRANSACCION,FECHAPAGO,CANTIDAD) values (27,'PayPal','ak-std-000021',to_date('08/02/09','DD/MM/RR'),10972);
Insert into PAGOS (CODIGOCLIENTE,FORMAPAGO,IDTRANSACCION,FECHAPAGO,CANTIDAD) values (28,'PayPal','ak-std-000022',to_date('13/01/09','DD/MM/RR'),8489);
Insert into PAGOS (CODIGOCLIENTE,FORMAPAGO,IDTRANSACCION,FECHAPAGO,CANTIDAD) values (30,'PayPal','ak-std-000024',to_date('16/01/09','DD/MM/RR'),7863);
Insert into PAGOS (CODIGOCLIENTE,FORMAPAGO,IDTRANSACCION,FECHAPAGO,CANTIDAD) values (35,'PayPal','ak-std-000025',to_date('10/06/07','DD/MM/RR'),3321);
Insert into PAGOS (CODIGOCLIENTE,FORMAPAGO,IDTRANSACCION,FECHAPAGO,CANTIDAD) values (38,'PayPal','ak-std-000026',to_date('26/05/06','DD/MM/RR'),1171);
REM INSERTING into PEDIDOS
SET DEFINE OFF;
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (1,to_date('17/01/06','DD/MM/RR'),to_date('19/01/06','DD/MM/RR'),to_date('19/01/06','DD/MM/RR'),'Entregado',5);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (2,to_date('23/10/07','DD/MM/RR'),to_date('28/10/07','DD/MM/RR'),to_date('26/10/07','DD/MM/RR'),'Entregado',5);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (3,to_date('20/06/08','DD/MM/RR'),to_date('25/06/08','DD/MM/RR'),null,'Rechazado',5);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (4,to_date('20/01/09','DD/MM/RR'),to_date('26/01/09','DD/MM/RR'),null,'Pendiente',5);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (8,to_date('09/11/08','DD/MM/RR'),to_date('14/11/08','DD/MM/RR'),to_date('14/11/08','DD/MM/RR'),'Entregado',1);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (9,to_date('22/12/08','DD/MM/RR'),to_date('27/12/08','DD/MM/RR'),to_date('28/12/08','DD/MM/RR'),'Entregado',1);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (10,to_date('15/01/09','DD/MM/RR'),to_date('20/01/09','DD/MM/RR'),null,'Pendiente',3);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (11,to_date('20/01/09','DD/MM/RR'),to_date('27/01/09','DD/MM/RR'),null,'Pendiente',1);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (12,to_date('22/01/09','DD/MM/RR'),to_date('27/01/09','DD/MM/RR'),null,'Pendiente',1);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (13,to_date('12/01/09','DD/MM/RR'),to_date('14/01/09','DD/MM/RR'),to_date('15/01/09','DD/MM/RR'),'entregado',7);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (14,to_date('02/01/09','DD/MM/RR'),to_date('02/01/09','DD/MM/RR'),null,'rechazado',7);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (15,to_date('09/01/09','DD/MM/RR'),to_date('12/01/09','DD/MM/RR'),to_date('11/01/09','DD/MM/RR'),'entregado',7);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (16,to_date('06/01/09','DD/MM/RR'),to_date('07/01/09','DD/MM/RR'),to_date('15/01/09','DD/MM/RR'),'entregado',7);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (17,to_date('08/01/09','DD/MM/RR'),to_date('09/01/09','DD/MM/RR'),to_date('11/01/09','DD/MM/RR'),'entregado',7);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (18,to_date('05/01/09','DD/MM/RR'),to_date('06/01/09','DD/MM/RR'),to_date('07/01/09','DD/MM/RR'),'entregado',9);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (19,to_date('18/01/09','DD/MM/RR'),to_date('12/02/09','DD/MM/RR'),null,'pendiente',9);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (20,to_date('20/01/09','DD/MM/RR'),to_date('15/02/09','DD/MM/RR'),null,'pendiente',9);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (21,to_date('09/01/09','DD/MM/RR'),to_date('09/01/09','DD/MM/RR'),to_date('09/01/09','DD/MM/RR'),'rechazado',9);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (22,to_date('11/01/09','DD/MM/RR'),to_date('11/01/09','DD/MM/RR'),to_date('13/01/09','DD/MM/RR'),'entregado',9);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (23,to_date('30/12/08','DD/MM/RR'),to_date('10/01/09','DD/MM/RR'),null,'Rechazado',5);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (24,to_date('14/07/08','DD/MM/RR'),to_date('31/07/08','DD/MM/RR'),to_date('25/07/08','DD/MM/RR'),'Entregado',14);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (25,to_date('02/02/09','DD/MM/RR'),to_date('08/02/09','DD/MM/RR'),null,'Rechazado',1);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (26,to_date('06/02/09','DD/MM/RR'),to_date('12/02/09','DD/MM/RR'),null,'Rechazado',3);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (27,to_date('07/02/09','DD/MM/RR'),to_date('13/02/09','DD/MM/RR'),null,'Entregado',3);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (28,to_date('10/02/09','DD/MM/RR'),to_date('17/02/09','DD/MM/RR'),to_date('20/02/09','DD/MM/RR'),'Entregado',3);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (29,to_date('01/08/08','DD/MM/RR'),to_date('01/09/08','DD/MM/RR'),to_date('01/09/08','DD/MM/RR'),'Rechazado',14);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (30,to_date('03/08/08','DD/MM/RR'),to_date('03/09/08','DD/MM/RR'),to_date('31/08/08','DD/MM/RR'),'Entregado',13);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (31,to_date('04/09/08','DD/MM/RR'),to_date('30/09/08','DD/MM/RR'),to_date('04/10/08','DD/MM/RR'),'Rechazado',13);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (32,to_date('07/01/07','DD/MM/RR'),to_date('19/01/07','DD/MM/RR'),to_date('27/01/07','DD/MM/RR'),'Entregado',4);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (33,to_date('20/05/07','DD/MM/RR'),to_date('28/05/07','DD/MM/RR'),null,'Rechazado',4);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (34,to_date('20/06/07','DD/MM/RR'),to_date('28/06/08','DD/MM/RR'),to_date('28/06/08','DD/MM/RR'),'Entregado',4);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (35,to_date('10/03/08','DD/MM/RR'),to_date('20/03/09','DD/MM/RR'),null,'Rechazado',4);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (36,to_date('15/10/08','DD/MM/RR'),to_date('15/12/08','DD/MM/RR'),to_date('10/12/08','DD/MM/RR'),'Entregado',14);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (37,to_date('03/11/08','DD/MM/RR'),to_date('13/11/09','DD/MM/RR'),null,'Pendiente',4);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (38,to_date('05/03/09','DD/MM/RR'),to_date('06/03/09','DD/MM/RR'),to_date('07/03/09','DD/MM/RR'),'Entregado',19);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (39,to_date('06/03/09','DD/MM/RR'),to_date('07/03/09','DD/MM/RR'),to_date('09/03/09','DD/MM/RR'),'Pendiente',19);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (40,to_date('09/03/09','DD/MM/RR'),to_date('10/03/09','DD/MM/RR'),to_date('13/03/09','DD/MM/RR'),'Rechazado',19);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (41,to_date('12/03/09','DD/MM/RR'),to_date('13/03/09','DD/MM/RR'),to_date('13/03/09','DD/MM/RR'),'Entregado',19);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (42,to_date('22/03/09','DD/MM/RR'),to_date('23/03/09','DD/MM/RR'),to_date('27/03/09','DD/MM/RR'),'Entregado',19);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (43,to_date('25/03/09','DD/MM/RR'),to_date('26/03/09','DD/MM/RR'),to_date('28/03/09','DD/MM/RR'),'Pendiente',23);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (44,to_date('26/03/09','DD/MM/RR'),to_date('27/03/09','DD/MM/RR'),to_date('30/03/09','DD/MM/RR'),'Pendiente',23);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (45,to_date('01/04/09','DD/MM/RR'),to_date('04/03/09','DD/MM/RR'),to_date('07/03/09','DD/MM/RR'),'Entregado',23);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (46,to_date('03/04/09','DD/MM/RR'),to_date('04/03/09','DD/MM/RR'),to_date('05/03/09','DD/MM/RR'),'Rechazado',23);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (47,to_date('15/04/09','DD/MM/RR'),to_date('17/03/09','DD/MM/RR'),to_date('17/03/09','DD/MM/RR'),'Entregado',23);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (48,to_date('17/03/08','DD/MM/RR'),to_date('30/03/08','DD/MM/RR'),to_date('29/03/08','DD/MM/RR'),'Entregado',26);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (50,to_date('17/03/08','DD/MM/RR'),to_date('09/08/08','DD/MM/RR'),null,'Pendiente',26);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (51,to_date('01/10/08','DD/MM/RR'),to_date('14/10/08','DD/MM/RR'),to_date('14/10/08','DD/MM/RR'),'Entregado',26);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (52,to_date('07/12/08','DD/MM/RR'),to_date('21/12/08','DD/MM/RR'),null,'Pendiente',26);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (53,to_date('15/10/08','DD/MM/RR'),to_date('15/11/08','DD/MM/RR'),to_date('09/11/08','DD/MM/RR'),'Entregado',13);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (54,to_date('11/01/09','DD/MM/RR'),to_date('11/02/09','DD/MM/RR'),null,'Pendiente',14);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (55,to_date('10/12/08','DD/MM/RR'),to_date('10/01/09','DD/MM/RR'),to_date('11/01/09','DD/MM/RR'),'Entregado',14);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (56,to_date('19/12/08','DD/MM/RR'),to_date('20/01/09','DD/MM/RR'),null,'Rechazado',13);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (57,to_date('05/01/09','DD/MM/RR'),to_date('05/02/09','DD/MM/RR'),null,'Pendiente',13);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (58,to_date('24/01/09','DD/MM/RR'),to_date('31/01/09','DD/MM/RR'),to_date('30/01/09','DD/MM/RR'),'Entregado',3);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (59,to_date('09/11/08','DD/MM/RR'),to_date('14/11/08','DD/MM/RR'),to_date('14/11/08','DD/MM/RR'),'Entregado',1);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (60,to_date('22/12/08','DD/MM/RR'),to_date('27/12/08','DD/MM/RR'),to_date('28/12/08','DD/MM/RR'),'Entregado',1);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (61,to_date('15/01/09','DD/MM/RR'),to_date('20/01/09','DD/MM/RR'),null,'Pendiente',3);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (62,to_date('20/01/09','DD/MM/RR'),to_date('27/01/09','DD/MM/RR'),null,'Pendiente',1);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (63,to_date('22/01/09','DD/MM/RR'),to_date('27/01/09','DD/MM/RR'),null,'Pendiente',1);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (64,to_date('24/01/09','DD/MM/RR'),to_date('31/01/09','DD/MM/RR'),to_date('30/01/09','DD/MM/RR'),'Entregado',1);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (65,to_date('02/02/09','DD/MM/RR'),to_date('08/02/09','DD/MM/RR'),null,'Rechazado',1);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (66,to_date('06/02/09','DD/MM/RR'),to_date('12/02/09','DD/MM/RR'),null,'Rechazado',3);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (67,to_date('07/02/09','DD/MM/RR'),to_date('13/02/09','DD/MM/RR'),null,'Entregado',3);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (68,to_date('10/02/09','DD/MM/RR'),to_date('17/02/09','DD/MM/RR'),to_date('20/02/09','DD/MM/RR'),'Entregado',3);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (74,to_date('14/01/09','DD/MM/RR'),to_date('22/01/09','DD/MM/RR'),null,'Rechazado',15);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (75,to_date('11/01/09','DD/MM/RR'),to_date('13/01/09','DD/MM/RR'),to_date('13/01/09','DD/MM/RR'),'Entregado',15);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (76,to_date('15/11/08','DD/MM/RR'),to_date('23/11/08','DD/MM/RR'),to_date('23/11/08','DD/MM/RR'),'Entregado',15);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (77,to_date('03/01/09','DD/MM/RR'),to_date('08/01/09','DD/MM/RR'),null,'Pendiente',15);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (78,to_date('15/12/08','DD/MM/RR'),to_date('17/12/08','DD/MM/RR'),to_date('17/12/08','DD/MM/RR'),'Entregado',15);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (79,to_date('12/01/09','DD/MM/RR'),to_date('13/01/09','DD/MM/RR'),to_date('13/01/09','DD/MM/RR'),'Entregado',28);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (80,to_date('25/01/09','DD/MM/RR'),to_date('26/01/09','DD/MM/RR'),null,'Pendiente',28);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (81,to_date('18/01/09','DD/MM/RR'),to_date('24/01/09','DD/MM/RR'),null,'Rechazado',28);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (82,to_date('20/01/09','DD/MM/RR'),to_date('29/01/09','DD/MM/RR'),to_date('29/01/09','DD/MM/RR'),'Entregado',28);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (83,to_date('24/01/09','DD/MM/RR'),to_date('28/01/09','DD/MM/RR'),null,'Entregado',28);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (89,to_date('05/10/07','DD/MM/RR'),to_date('13/12/07','DD/MM/RR'),to_date('10/12/07','DD/MM/RR'),'Entregado',35);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (90,to_date('07/02/09','DD/MM/RR'),to_date('17/02/08','DD/MM/RR'),null,'Pendiente',27);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (91,to_date('18/03/09','DD/MM/RR'),to_date('29/03/09','DD/MM/RR'),to_date('27/03/09','DD/MM/RR'),'Entregado',27);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (92,to_date('19/04/09','DD/MM/RR'),to_date('30/04/09','DD/MM/RR'),to_date('03/05/09','DD/MM/RR'),'Entregado',27);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (93,to_date('03/05/09','DD/MM/RR'),to_date('30/05/09','DD/MM/RR'),to_date('17/05/09','DD/MM/RR'),'Entregado',27);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (94,to_date('18/10/09','DD/MM/RR'),to_date('01/11/09','DD/MM/RR'),null,'Pendiente',27);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (95,to_date('04/01/08','DD/MM/RR'),to_date('19/01/08','DD/MM/RR'),to_date('19/01/08','DD/MM/RR'),'Entregado',35);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (96,to_date('20/03/08','DD/MM/RR'),to_date('12/04/08','DD/MM/RR'),to_date('13/04/08','DD/MM/RR'),'Entregado',35);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (97,to_date('08/10/08','DD/MM/RR'),to_date('25/11/08','DD/MM/RR'),to_date('25/11/08','DD/MM/RR'),'Entregado',35);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (98,to_date('08/01/09','DD/MM/RR'),to_date('13/02/09','DD/MM/RR'),null,'Pediente',35);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (99,to_date('15/02/09','DD/MM/RR'),to_date('27/02/09','DD/MM/RR'),null,'Pendiente',16);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (100,to_date('10/01/09','DD/MM/RR'),to_date('15/01/09','DD/MM/RR'),to_date('15/01/09','DD/MM/RR'),'Entregado',16);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (101,to_date('07/03/09','DD/MM/RR'),to_date('27/03/09','DD/MM/RR'),null,'Rechazado',16);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (102,to_date('28/12/08','DD/MM/RR'),to_date('08/01/09','DD/MM/RR'),to_date('08/01/09','DD/MM/RR'),'Entregado',16);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (103,to_date('15/01/09','DD/MM/RR'),to_date('20/01/09','DD/MM/RR'),to_date('24/01/09','DD/MM/RR'),'Pendiente',30);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (104,to_date('02/03/09','DD/MM/RR'),to_date('06/03/09','DD/MM/RR'),to_date('06/03/09','DD/MM/RR'),'Entregado',30);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (105,to_date('14/02/09','DD/MM/RR'),to_date('20/02/09','DD/MM/RR'),null,'Rechazado',30);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (106,to_date('13/05/09','DD/MM/RR'),to_date('15/05/09','DD/MM/RR'),to_date('20/05/09','DD/MM/RR'),'Pendiente',30);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (107,to_date('06/04/09','DD/MM/RR'),to_date('10/04/09','DD/MM/RR'),to_date('10/04/09','DD/MM/RR'),'Entregado',30);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (108,to_date('09/04/09','DD/MM/RR'),to_date('15/04/09','DD/MM/RR'),to_date('15/04/09','DD/MM/RR'),'Entregado',16);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (109,to_date('25/05/06','DD/MM/RR'),to_date('28/07/06','DD/MM/RR'),to_date('28/07/06','DD/MM/RR'),'Entregado',38);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (110,to_date('19/03/07','DD/MM/RR'),to_date('24/04/07','DD/MM/RR'),to_date('24/04/07','DD/MM/RR'),'Entregado',38);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (111,to_date('05/03/08','DD/MM/RR'),to_date('30/03/08','DD/MM/RR'),to_date('30/03/08','DD/MM/RR'),'Entregado',36);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (112,to_date('05/03/09','DD/MM/RR'),to_date('06/04/09','DD/MM/RR'),to_date('07/05/09','DD/MM/RR'),'Pendiente',36);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (113,to_date('28/10/08','DD/MM/RR'),to_date('09/11/08','DD/MM/RR'),to_date('09/01/09','DD/MM/RR'),'Rechazado',36);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (114,to_date('15/01/09','DD/MM/RR'),to_date('29/01/09','DD/MM/RR'),to_date('31/01/09','DD/MM/RR'),'Entregado',36);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (115,to_date('29/11/08','DD/MM/RR'),to_date('26/01/09','DD/MM/RR'),to_date('27/02/09','DD/MM/RR'),'Pendiente',36);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (116,to_date('28/06/08','DD/MM/RR'),to_date('01/08/08','DD/MM/RR'),to_date('01/08/08','DD/MM/RR'),'Entregado',38);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (117,to_date('25/08/08','DD/MM/RR'),to_date('01/10/08','DD/MM/RR'),null,'Rechazado',38);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (118,to_date('15/02/09','DD/MM/RR'),to_date('27/02/09','DD/MM/RR'),null,'Pendiente',16);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (119,to_date('10/01/09','DD/MM/RR'),to_date('15/01/09','DD/MM/RR'),to_date('15/01/09','DD/MM/RR'),'Entregado',16);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (120,to_date('07/03/09','DD/MM/RR'),to_date('27/03/09','DD/MM/RR'),null,'Rechazado',16);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (121,to_date('28/12/08','DD/MM/RR'),to_date('08/01/09','DD/MM/RR'),to_date('08/01/09','DD/MM/RR'),'Entregado',16);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (122,to_date('09/04/09','DD/MM/RR'),to_date('15/04/09','DD/MM/RR'),to_date('15/04/09','DD/MM/RR'),'Entregado',16);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (123,to_date('15/01/09','DD/MM/RR'),to_date('20/01/09','DD/MM/RR'),to_date('24/01/09','DD/MM/RR'),'Pendiente',30);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (124,to_date('02/03/09','DD/MM/RR'),to_date('06/03/09','DD/MM/RR'),to_date('06/03/09','DD/MM/RR'),'Entregado',30);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (125,to_date('14/02/09','DD/MM/RR'),to_date('20/02/09','DD/MM/RR'),null,'Rechazado',30);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (126,to_date('13/05/09','DD/MM/RR'),to_date('15/05/09','DD/MM/RR'),to_date('20/05/09','DD/MM/RR'),'Pendiente',30);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (127,to_date('06/04/09','DD/MM/RR'),to_date('10/04/09','DD/MM/RR'),to_date('10/04/09','DD/MM/RR'),'Entregado',30);
Insert into PEDIDOS (CODIGOPEDIDO,FECHAPEDIDO,FECHAESPERADA,FECHAENTREGA,ESTADO,CODIGOCLIENTE) values (128,to_date('10/11/08','DD/MM/RR'),to_date('10/12/08','DD/MM/RR'),to_date('29/12/08','DD/MM/RR'),'Rechazado',38);
REM INSERTING into PRODUCTOS
SET DEFINE OFF;
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('11679','Sierra de Poda 400MM','Herramientas','0,258','HiperGarden Tools',15,14,11);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('21636','Pala','Herramientas','0,156','HiperGarden Tools',15,14,13);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('22225','Rastrillo de Jard?n','Herramientas','1,064','HiperGarden Tools',15,12,11);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('30310','Azad?n','Herramientas','0,168','HiperGarden Tools',15,12,11);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('AR-001','Ajedrea','Arom?ticas','15-20','Murcia Seasons',140,1,0);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('AR-002','Lav?ndula Dentata','Arom?ticas','15-20','Murcia Seasons',140,1,0);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('AR-003','Mejorana','Arom?ticas','15-20','Murcia Seasons',140,1,0);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('AR-004','Melissa ','Arom?ticas','15-20','Murcia Seasons',140,1,0);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('AR-005','Mentha Sativa','Arom?ticas','15-20','Murcia Seasons',140,1,0);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-14','Calamondin Mini','Frutales',null,'Frutales Talavera S.A',15,10,8);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-15','Calamondin Copa ','Frutales',null,'Frutales Talavera S.A',15,25,20);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-16','Calamondin Copa EXTRA Con FRUTA','Frutales','100-120','Frutales Talavera S.A',15,45,36);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-17','Rosal bajo 1ï¿½ -En maceta-inicio brotaci?n','Frutales',null,'Frutales Talavera S.A',15,2,1);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-18','ROSAL TREPADOR','Frutales',null,'Frutales Talavera S.A',350,4,3);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-19','Camelia Blanco, Chrysler Rojo, Soraya Naranja, ','Frutales',null,'NaranjasValencianas.com',350,4,3);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-2','Naranjo -Plant?n joven 1 a?o injerto','Frutales',null,'NaranjasValencianas.com',15,6,4);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-20','Landora Amarillo, Rose Gaujard bicolor blanco-rojo','Frutales',null,'Frutales Talavera S.A',350,4,3);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-21','Kordes Perfect bicolor rojo-amarillo, Roundelay rojo fuerte','Frutales',null,'Frutales Talavera S.A',350,4,3);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-22','Pitimini rojo','Frutales',null,'Frutales Talavera S.A',350,4,3);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-23','Rosal copa ','Frutales',null,'Frutales Talavera S.A',400,8,6);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-24','Albaricoquero Corbato','Frutales',null,'Melocotones de Cieza S.A.',400,8,6);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('AR-006','Petrosilium Hortense (Peregil)','Arom?ticas','15-20','Murcia Seasons',140,1,0);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('AR-007','Salvia Mix','Arom?ticas','15-20','Murcia Seasons',140,1,0);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('AR-008','Thymus Citriodra (Tomillo lim?n)','Arom?ticas','15-20','Murcia Seasons',140,1,0);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('AR-009','Thymus Vulgaris','Arom?ticas','15-20','Murcia Seasons',140,1,0);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('AR-010','Santolina Chamaecyparys','Arom?ticas','15-20','Murcia Seasons',140,1,0);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-1','Expositor C?tricos Mix','Frutales','100-120','Frutales Talavera S.A',15,7,5);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-10','Limonero 2 a?os injerto','Frutales',null,'NaranjasValencianas.com',15,7,5);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-100','Nectarina','Frutales','8/10','Frutales Talavera S.A',50,11,8);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-101','Nogal','Frutales','8/10','Frutales Talavera S.A',50,13,10);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-102','Olea-Olivos','Frutales','8/10','Frutales Talavera S.A',50,18,14);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-103','Olea-Olivos','Frutales','10/12','Frutales Talavera S.A',50,25,20);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-104','Olea-Olivos','Frutales','12/4','Frutales Talavera S.A',50,49,39);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-105','Olea-Olivos','Frutales','14/16','Frutales Talavera S.A',50,70,56);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-106','Peral','Frutales','8/10','Frutales Talavera S.A',50,11,8);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-107','Peral','Frutales','10/12','Frutales Talavera S.A',50,22,17);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-108','Peral','Frutales','12/14','Frutales Talavera S.A',50,32,25);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-11','Limonero 30/40','Frutales',null,'NaranjasValencianas.com',15,100,80);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-12','Kunquat ','Frutales',null,'NaranjasValencianas.com',15,21,16);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-13','Kunquat  EXTRA con FRUTA','Frutales','150-170','NaranjasValencianas.com',15,57,45);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-45','Melocotonero Amarillo de Agosto','Frutales',null,'Melocotones de Cieza S.A.',400,8,6);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-46','Melocotonero Federica','Frutales',null,'Melocotones de Cieza S.A.',400,8,6);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-47','Melocotonero Paraguayo','Frutales',null,'Melocotones de Cieza S.A.',400,8,6);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-48','Nogal Com?n','Frutales',null,'Frutales Talavera S.A',400,9,7);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-49','Parra Uva de Mesa','Frutales',null,'Frutales Talavera S.A',400,8,6);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-5','Mandarino -Plant?n joven','Frutales',null,'Frutales Talavera S.A',15,6,4);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-50','Peral Castell','Frutales',null,'Frutales Talavera S.A',400,8,6);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-51','Peral Williams','Frutales',null,'Frutales Talavera S.A',400,8,6);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-52','Peral Conference','Frutales',null,'Frutales Talavera S.A',400,8,6);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-53','Peral Blanq. de Aranjuez','Frutales',null,'Frutales Talavera S.A',400,8,6);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-54','N?spero Tanaca','Frutales',null,'Frutales Talavera S.A',400,9,7);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-63','Cerezo','Frutales','8/10','Jerte Distribuciones S.L.',300,11,8);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-64','Cerezo','Frutales','10/12','Jerte Distribuciones S.L.',15,22,17);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-65','Cerezo','Frutales','12/14','Jerte Distribuciones S.L.',200,32,25);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-66','Cerezo','Frutales','14/16','Jerte Distribuciones S.L.',50,49,39);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-67','Cerezo','Frutales','16/18','Jerte Distribuciones S.L.',50,70,56);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-68','Cerezo','Frutales','18/20','Jerte Distribuciones S.L.',50,80,64);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-69','Cerezo','Frutales','20/25','Jerte Distribuciones S.L.',50,91,72);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-7','Mandarino calibre 8/10','Frutales',null,'Frutales Talavera S.A',15,29,23);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-70','Ciruelo','Frutales','8/10','Frutales Talavera S.A',50,11,8);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-71','Ciruelo','Frutales','10/12','Frutales Talavera S.A',50,22,17);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-72','Ciruelo','Frutales','12/14','Frutales Talavera S.A',50,32,25);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-73','Granado','Frutales','8/10','Frutales Talavera S.A',50,13,10);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-74','Granado','Frutales','10/12','Frutales Talavera S.A',50,22,17);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-75','Granado','Frutales','12/14','Frutales Talavera S.A',50,32,25);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-76','Granado','Frutales','14/16','Frutales Talavera S.A',50,49,39);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-77','Granado','Frutales','16/18','Frutales Talavera S.A',50,70,56);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-78','Higuera','Frutales','8/10','Frutales Talavera S.A',50,15,12);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-79','Higuera','Frutales','10/12','Frutales Talavera S.A',50,22,17);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-55','Olivo Cipresino','Frutales',null,'Frutales Talavera S.A',400,8,6);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-56','Nectarina','Frutales',null,'Frutales Talavera S.A',400,8,6);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-57','Kaki Rojo Brillante','Frutales',null,'NaranjasValencianas.com',400,9,7);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-58','Albaricoquero','Frutales','8/10','Melocotones de Cieza S.A.',200,11,8);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-59','Albaricoquero','Frutales','10/12','Melocotones de Cieza S.A.',200,22,17);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-6','Mandarino 2 a?os injerto','Frutales',null,'Frutales Talavera S.A',15,7,5);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-60','Albaricoquero','Frutales','12/14','Melocotones de Cieza S.A.',200,32,25);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-61','Albaricoquero','Frutales','14/16','Melocotones de Cieza S.A.',200,49,39);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-62','Albaricoquero','Frutales','16/18','Melocotones de Cieza S.A.',200,70,56);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-25','Albaricoquero Moniqui','Frutales',null,'Melocotones de Cieza S.A.',400,8,6);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-26','Albaricoquero Kurrot','Frutales',null,'Melocotones de Cieza S.A.',400,8,6);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-27','Cerezo Burlat','Frutales',null,'Jerte Distribuciones S.L.',400,8,6);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-28','Cerezo Picota','Frutales',null,'Jerte Distribuciones S.L.',400,8,6);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-29','Cerezo Napole?n','Frutales',null,'Jerte Distribuciones S.L.',400,8,6);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-3','Naranjo 2 a?os injerto','Frutales',null,'NaranjasValencianas.com',15,7,5);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-30','Ciruelo R. Claudia Verde   ','Frutales',null,'Frutales Talavera S.A',400,8,6);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-31','Ciruelo Santa Rosa','Frutales',null,'Frutales Talavera S.A',400,8,6);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-32','Ciruelo Golden Japan','Frutales',null,'Frutales Talavera S.A',400,8,6);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-33','Ciruelo Friar','Frutales',null,'Frutales Talavera S.A',400,8,6);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-34','Ciruelo Reina C. De Ollins','Frutales',null,'Frutales Talavera S.A',400,8,6);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-35','Ciruelo Claudia Negra','Frutales',null,'Frutales Talavera S.A',400,8,6);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-36','Granado Mollar de Elche','Frutales',null,'Frutales Talavera S.A',400,9,7);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-37','Higuera Napolitana','Frutales',null,'Frutales Talavera S.A',400,9,7);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-38','Higuera Verdal','Frutales',null,'Frutales Talavera S.A',400,9,7);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-39','Higuera Breva','Frutales',null,'Frutales Talavera S.A',400,9,7);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-4','Naranjo calibre 8/10','Frutales',null,'NaranjasValencianas.com',15,29,23);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-40','Manzano Starking Delicious','Frutales',null,'Frutales Talavera S.A',400,8,6);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-41','Manzano Reineta','Frutales',null,'Frutales Talavera S.A',400,8,6);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-42','Manzano Golden Delicious','Frutales',null,'Frutales Talavera S.A',400,8,6);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-43','Membrillero Gigante de Wranja','Frutales',null,'Frutales Talavera S.A',400,8,6);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-44','Melocotonero Spring Crest','Frutales',null,'Melocotones de Cieza S.A.',400,8,6);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-104','Mimosa Semilla Cyanophylla    ','Ornamentales','200-225','Viveros EL OASIS',100,10,8);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-105','Mimosa Semilla Espectabilis  ','Ornamentales','160-170','Viveros EL OASIS',100,6,4);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-106','Mimosa Semilla Longifolia   ','Ornamentales','200-225','Viveros EL OASIS',100,10,8);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-107','Mimosa Semilla Floribunda 4 estaciones','Ornamentales','120-140','Viveros EL OASIS',100,6,4);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-108','Abelia Floribunda','Ornamentales','35-45','Viveros EL OASIS',100,5,4);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-109','Callistemom (Mix)','Ornamentales','35-45','Viveros EL OASIS',100,5,4);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-110','Callistemom (Mix)','Ornamentales','40-60','Viveros EL OASIS',100,2,1);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-111','Corylus Avellana \"Contorta\"','Ornamentales','35-45','Viveros EL OASIS',100,5,4);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-112','Escallonia (Mix)','Ornamentales','35-45','Viveros EL OASIS',120,5,4);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-113','Evonimus Emerald Gayeti','Ornamentales','35-45','Viveros EL OASIS',120,5,4);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-114','Evonimus Pulchellus','Ornamentales','35-45','Viveros EL OASIS',120,5,4);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-115','Forsytia Intermedia \"Lynwood\"','Ornamentales','35-45','Viveros EL OASIS',120,7,5);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-116','Hibiscus Syriacus  \"Diana\" -Blanco Puro','Ornamentales','35-45','Viveros EL OASIS',120,7,5);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-117','Hibiscus Syriacus  \"Helene\" -Blanco-C.rojo','Ornamentales','35-45','Viveros EL OASIS',120,7,5);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-118','Hibiscus Syriacus \"Pink Giant\" Rosa','Ornamentales','35-45','Viveros EL OASIS',120,7,5);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-119','Laurus Nobilis Arbusto - Ramificado Bajo','Ornamentales','40-50','Viveros EL OASIS',120,5,4);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-120','Lonicera Nitida ','Ornamentales','35-45','Viveros EL OASIS',120,5,4);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-121','Lonicera Nitida \"Maigrum\"','Ornamentales','35-45','Viveros EL OASIS',120,5,4);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-122','Lonicera Pileata','Ornamentales','35-45','Viveros EL OASIS',120,5,4);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-123','Philadelphus \"Virginal\"','Ornamentales','35-45','Viveros EL OASIS',120,5,4);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-124','Prunus pisardii  ','Ornamentales','35-45','Viveros EL OASIS',120,5,4);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-125','Viburnum Tinus \"Eve Price\"','Ornamentales','35-45','Viveros EL OASIS',120,5,4);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-126','Weigelia \"Bristol Ruby\"','Ornamentales','35-45','Viveros EL OASIS',120,5,4);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-127','Camelia japonica','Ornamentales','40-60','Viveros EL OASIS',50,7,5);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-128','Camelia japonica ejemplar','Ornamentales','200-250','Viveros EL OASIS',50,98,78);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-129','Camelia japonica ejemplar','Ornamentales','250-300','Viveros EL OASIS',50,110,88);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-130','Callistemom COPA','Ornamentales','110/120','Viveros EL OASIS',50,18,14);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-131','Leptospermum formado PIRAMIDE','Ornamentales','80-100','Viveros EL OASIS',50,18,14);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-132','Leptospermum COPA','Ornamentales','110/120','Viveros EL OASIS',50,18,14);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-133','Nerium oleander-CALIDAD \"GARDEN\"','Ornamentales','40-45','Viveros EL OASIS',50,2,1);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-134','Nerium Oleander Arbusto GRANDE','Ornamentales','160-200','Viveros EL OASIS',100,38,30);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-135','Nerium oleander COPA  Calibre 6/8','Ornamentales','50-60','Viveros EL OASIS',100,5,4);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-136','Nerium oleander ARBOL Calibre 8/10','Ornamentales','225-250','Viveros EL OASIS',100,18,14);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-137','ROSAL TREPADOR','Ornamentales',null,'Viveros EL OASIS',100,4,3);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-138','Camelia Blanco, Chrysler Rojo, Soraya Naranja, ','Ornamentales',null,'Viveros EL OASIS',100,4,3);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-139','Landora Amarillo, Rose Gaujard bicolor blanco-rojo','Ornamentales',null,'Viveros EL OASIS',100,4,3);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-140','Kordes Perfect bicolor rojo-amarillo, Roundelay rojo fuerte','Ornamentales',null,'Viveros EL OASIS',100,4,3);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-141','Pitimini rojo','Ornamentales',null,'Viveros EL OASIS',100,4,3);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-142','Solanum Jazminoide','Ornamentales','150-160','Viveros EL OASIS',100,2,1);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-143','Wisteria Sinensis  azul, rosa, blanca','Ornamentales',null,'Viveros EL OASIS',100,9,7);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-144','Wisteria Sinensis INJERTADAS DECï¿½','Ornamentales','140-150','Viveros EL OASIS',100,12,9);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-145','Bougamvillea Sanderiana Tutor','Ornamentales','80-100','Viveros EL OASIS',100,2,1);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-146','Bougamvillea Sanderiana Tutor','Ornamentales','125-150','Viveros EL OASIS',100,4,3);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-147','Bougamvillea Sanderiana Tutor','Ornamentales','180-200','Viveros EL OASIS',100,7,5);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-148','Bougamvillea Sanderiana Espaldera','Ornamentales','45-50','Viveros EL OASIS',100,7,5);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-149','Bougamvillea Sanderiana Espaldera','Ornamentales','140-150','Viveros EL OASIS',100,17,13);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-150','Bougamvillea roja, naranja','Ornamentales','110-130','Viveros EL OASIS',100,2,1);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-151','Bougamvillea Sanderiana, 3 tut. piramide','Ornamentales',null,'Viveros EL OASIS',100,6,4);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-152','Expositor ?rboles clima continental','Ornamentales','170-200','Viveros EL OASIS',100,6,4);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-153','Expositor ?rboles clima mediterr?neo','Ornamentales','170-200','Viveros EL OASIS',100,6,4);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-154','Expositor ?rboles borde del mar','Ornamentales','170-200','Viveros EL OASIS',100,6,4);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-155','Acer Negundo  ','Ornamentales','200-225','Viveros EL OASIS',100,6,4);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-156','Acer platanoides  ','Ornamentales','200-225','Viveros EL OASIS',100,10,8);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-157','Acer Pseudoplatanus ','Ornamentales','200-225','Viveros EL OASIS',100,10,8);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-158','Brachychiton Acerifolius  ','Ornamentales','200-225','Viveros EL OASIS',100,6,4);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-159','Brachychiton Discolor  ','Ornamentales','200-225','Viveros EL OASIS',100,6,4);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-160','Brachychiton Rupestris','Ornamentales','170-200','Viveros EL OASIS',100,10,8);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-161','Cassia Corimbosa  ','Ornamentales','200-225','Viveros EL OASIS',100,6,4);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-162','Cassia Corimbosa ','Ornamentales','200-225','Viveros EL OASIS',100,10,8);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-163','Chitalpa Summer Bells   ','Ornamentales','200-225','Viveros EL OASIS',80,10,8);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-164','Erytrina Kafra','Ornamentales','170-180','Viveros EL OASIS',80,6,4);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-165','Erytrina Kafra','Ornamentales','200-225','Viveros EL OASIS',80,10,8);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-166','Eucalyptus Citriodora  ','Ornamentales','170-200','Viveros EL OASIS',80,6,4);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-167','Eucalyptus Ficifolia  ','Ornamentales','170-200','Viveros EL OASIS',80,6,4);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-168','Eucalyptus Ficifolia   ','Ornamentales','200-225','Viveros EL OASIS',80,10,8);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-169','Hibiscus Syriacus  Var. Injertadas 1 Tallo ','Ornamentales','170-200','Viveros EL OASIS',80,12,9);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-170','Lagunaria Patersonii  ','Ornamentales','140-150','Viveros EL OASIS',80,6,4);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-171','Lagunaria Patersonii   ','Ornamentales','200-225','Viveros EL OASIS',80,10,8);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-172','Lagunaria patersonii  calibre 8/10','Ornamentales','200-225','Viveros EL OASIS',80,18,14);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-173','Morus Alba  ','Ornamentales','200-225','Viveros EL OASIS',80,6,4);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-174','Morus Alba  calibre 8/10','Ornamentales','200-225','Viveros EL OASIS',80,18,14);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-175','Platanus Acerifolia   ','Ornamentales','200-225','Viveros EL OASIS',80,10,8);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-176','Prunus pisardii  ','Ornamentales','200-225','Viveros EL OASIS',80,10,8);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-177','Robinia Pseudoacacia Casque Rouge   ','Ornamentales','200-225','Viveros EL OASIS',80,15,12);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-178','Salix Babylonica  Pendula  ','Ornamentales','170-200','Viveros EL OASIS',80,6,4);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-179','Sesbania Punicea   ','Ornamentales','170-200','Viveros EL OASIS',80,6,4);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-180','Tamarix  Ramosissima Pink Cascade   ','Ornamentales','170-200','Viveros EL OASIS',80,6,4);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-181','Tamarix  Ramosissima Pink Cascade   ','Ornamentales','200-225','Viveros EL OASIS',80,10,8);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-182','Tecoma Stands   ','Ornamentales','200-225','Viveros EL OASIS',80,6,4);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-183','Tecoma Stands  ','Ornamentales','200-225','Viveros EL OASIS',80,10,8);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-184','Tipuana Tipu  ','Ornamentales','170-200','Viveros EL OASIS',80,6,4);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-185','Pleioblastus distichus-Bamb? enano','Ornamentales','15-20','Viveros EL OASIS',80,6,4);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-186','Sasa palmata ','Ornamentales','20-30','Viveros EL OASIS',80,6,4);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-187','Sasa palmata ','Ornamentales','40-45','Viveros EL OASIS',80,10,8);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-188','Sasa palmata ','Ornamentales','50-60','Viveros EL OASIS',80,25,20);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-189','Phylostachys aurea','Ornamentales','180-200','Viveros EL OASIS',80,22,17);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-190','Phylostachys aurea','Ornamentales','250-300','Viveros EL OASIS',80,32,25);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-191','Phylostachys Bambusa Spectabilis','Ornamentales','180-200','Viveros EL OASIS',80,24,19);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-192','Phylostachys biseti','Ornamentales','160-170','Viveros EL OASIS',80,22,17);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-193','Phylostachys biseti','Ornamentales','160-180','Viveros EL OASIS',80,20,16);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-194','Pseudosasa japonica (Metake)','Ornamentales','225-250','Viveros EL OASIS',80,20,16);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-195','Pseudosasa japonica (Metake) ','Ornamentales','30-40','Viveros EL OASIS',80,6,4);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-196','Cedrus Deodara ','Ornamentales','80-100','Viveros EL OASIS',80,10,8);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-197','Cedrus Deodara \"Feeling Blue\" Novedad','Ornamentales','rastrero','Viveros EL OASIS',80,12,9);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-198','Juniperus chinensis \"Blue Alps\"','Ornamentales','20-30','Viveros EL OASIS',80,4,3);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-199','Juniperus Chinensis Stricta','Ornamentales','20-30','Viveros EL OASIS',80,4,3);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-200','Juniperus horizontalis Wiltonii','Ornamentales','20-30','Viveros EL OASIS',80,4,3);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-201','Juniperus squamata \"Blue Star\"','Ornamentales','20-30','Viveros EL OASIS',80,4,3);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-202','Juniperus x media Phitzeriana verde','Ornamentales','20-30','Viveros EL OASIS',80,4,3);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-203','Pinus Canariensis','Ornamentales','80-100','Viveros EL OASIS',80,10,8);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-204','Pinus Halepensis','Ornamentales','160-180','Viveros EL OASIS',80,10,8);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-205','Pinus Pinea -Pino Pi?onero','Ornamentales','70-80','Viveros EL OASIS',80,10,8);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-206','Thuja Esmeralda ','Ornamentales','80-100','Viveros EL OASIS',80,5,4);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-207','Tuja Occidentalis Woodwardii','Ornamentales','20-30','Viveros EL OASIS',80,4,3);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-208','Tuja orientalis \"Aurea nana\"','Ornamentales','20-30','Viveros EL OASIS',80,4,3);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-209','Archontophoenix Cunninghamiana','Ornamentales','80 - 100','Viveros EL OASIS',80,10,8);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-210','Beucarnea Recurvata','Ornamentales','130  - 150','Viveros EL OASIS',2,39,31);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-211','Beucarnea Recurvata','Ornamentales','180 - 200','Viveros EL OASIS',5,59,47);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-212','Bismarckia Nobilis','Ornamentales','200 - 220','Viveros EL OASIS',4,217,173);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-213','Bismarckia Nobilis','Ornamentales','240 - 260','Viveros EL OASIS',4,266,212);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-214','Brahea Armata','Ornamentales','45 - 60','Viveros EL OASIS',0,10,8);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-215','Brahea Armata','Ornamentales','120 - 140','Viveros EL OASIS',100,112,89);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-216','Brahea Edulis','Ornamentales','80 - 100','Viveros EL OASIS',100,19,15);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-217','Brahea Edulis','Ornamentales','140 - 160','Viveros EL OASIS',100,64,51);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-218','Butia Capitata','Ornamentales','70 - 90','Viveros EL OASIS',100,25,20);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-219','Butia Capitata','Ornamentales','90 - 110','Viveros EL OASIS',100,29,23);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-220','Butia Capitata','Ornamentales','90 - 120','Viveros EL OASIS',100,36,28);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-221','Butia Capitata','Ornamentales','85 - 105','Viveros EL OASIS',100,59,47);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-222','Butia Capitata','Ornamentales','130 - 150','Viveros EL OASIS',100,87,69);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-223','Chamaerops Humilis','Ornamentales','40 - 45','Viveros EL OASIS',100,4,3);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-224','Chamaerops Humilis','Ornamentales','50 - 60','Viveros EL OASIS',100,7,5);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-225','Chamaerops Humilis','Ornamentales','70 - 90','Viveros EL OASIS',100,10,8);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-226','Chamaerops Humilis','Ornamentales','115 - 130','Viveros EL OASIS',100,38,30);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-227','Chamaerops Humilis','Ornamentales','130 - 150','Viveros EL OASIS',100,64,51);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-228','Chamaerops Humilis \"Cerifera\"','Ornamentales','70 - 80','Viveros EL OASIS',100,32,25);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-229','Chrysalidocarpus Lutescens -ARECA','Ornamentales','130 - 150','Viveros EL OASIS',100,22,17);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-8','Limonero -Plant?n joven','Frutales',null,'NaranjasValencianas.com',15,6,4);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-80','Higuera','Frutales','12/14','Frutales Talavera S.A',50,32,25);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-81','Higuera','Frutales','14/16','Frutales Talavera S.A',50,49,39);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-82','Higuera','Frutales','16/18','Frutales Talavera S.A',50,70,56);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-83','Higuera','Frutales','18/20','Frutales Talavera S.A',50,80,64);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-84','Kaki','Frutales','8/10','NaranjasValencianas.com',50,13,10);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-85','Kaki','Frutales','16/18','NaranjasValencianas.com',50,70,56);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-86','Manzano','Frutales','8/10','Frutales Talavera S.A',50,11,8);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-87','Manzano','Frutales','10/12','Frutales Talavera S.A',50,22,17);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-88','Manzano','Frutales','12/14','Frutales Talavera S.A',50,32,25);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-89','Manzano','Frutales','14/16','Frutales Talavera S.A',50,49,39);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-9','Limonero calibre 8/10','Frutales',null,'NaranjasValencianas.com',15,29,23);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-90','N?spero','Frutales','16/18','Frutales Talavera S.A',50,70,56);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-91','N?spero','Frutales','18/20','Frutales Talavera S.A',50,80,64);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-92','Melocotonero','Frutales','8/10','Melocotones de Cieza S.A.',50,11,8);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-93','Melocotonero','Frutales','10/12','Melocotones de Cieza S.A.',50,22,17);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-94','Melocotonero','Frutales','12/14','Melocotones de Cieza S.A.',50,32,25);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-95','Melocotonero','Frutales','14/16','Melocotones de Cieza S.A.',50,49,39);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-96','Membrillero','Frutales','8/10','Frutales Talavera S.A',50,11,8);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-97','Membrillero','Frutales','10/12','Frutales Talavera S.A',50,22,17);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-98','Membrillero','Frutales','12/14','Frutales Talavera S.A',50,32,25);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('FR-99','Membrillero','Frutales','14/16','Frutales Talavera S.A',50,49,39);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-001','Arbustos Mix Maceta','Ornamentales','40-60','Valencia Garden Service',25,5,4);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-100','Mimosa Injerto CLASICA Dealbata ','Ornamentales','100-110','Viveros EL OASIS',100,12,9);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-101','Expositor Mimosa Semilla Mix','Ornamentales','170-200','Viveros EL OASIS',100,6,4);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-102','Mimosa Semilla Bayleyana  ','Ornamentales','170-200','Viveros EL OASIS',100,6,4);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-103','Mimosa Semilla Bayleyana   ','Ornamentales','200-225','Viveros EL OASIS',100,10,8);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-230','Cordyline Australis -DRACAENA','Ornamentales','190 - 210','Viveros EL OASIS',100,38,30);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-231','Cycas Revoluta','Ornamentales','55 - 65','Viveros EL OASIS',100,15,12);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-232','Cycas Revoluta','Ornamentales','80 - 90','Viveros EL OASIS',100,34,27);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-233','Dracaena Drago','Ornamentales','60 - 70','Viveros EL OASIS',1,13,10);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-234','Dracaena Drago','Ornamentales','130 - 150','Viveros EL OASIS',2,64,51);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-235','Dracaena Drago','Ornamentales','150 - 175','Viveros EL OASIS',2,92,73);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-236','Jubaea Chilensis','Ornamentales',null,'Viveros EL OASIS',100,49,39);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-237','Livistonia Australis','Ornamentales','100 - 125','Viveros EL OASIS',50,19,15);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-238','Livistonia Decipiens','Ornamentales','90 - 110','Viveros EL OASIS',50,19,15);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-239','Livistonia Decipiens','Ornamentales','180 - 200','Viveros EL OASIS',50,49,39);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-240','Phoenix Canariensis','Ornamentales','110 - 130','Viveros EL OASIS',50,6,4);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-241','Phoenix Canariensis','Ornamentales','180 - 200','Viveros EL OASIS',50,19,15);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-242','Rhaphis Excelsa','Ornamentales','80 - 100','Viveros EL OASIS',50,21,16);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-243','Rhaphis Humilis','Ornamentales','150- 170','Viveros EL OASIS',50,64,51);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-244','Sabal Minor','Ornamentales','60 - 75','Viveros EL OASIS',50,11,8);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-245','Sabal Minor','Ornamentales','120 - 140','Viveros EL OASIS',50,34,27);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-246','Trachycarpus Fortunei','Ornamentales','90 - 105','Viveros EL OASIS',50,18,14);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-247','Trachycarpus Fortunei','Ornamentales','250-300','Viveros EL OASIS',2,462,369);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-248','Washingtonia Robusta','Ornamentales','60 - 70','Viveros EL OASIS',15,3,2);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-249','Washingtonia Robusta','Ornamentales','130 - 150','Viveros EL OASIS',15,5,4);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-250','Yucca Jewel','Ornamentales','80 - 105','Viveros EL OASIS',15,10,8);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-251','Zamia Furfuracaea','Ornamentales','90 - 110','Viveros EL OASIS',15,168,134);
Insert into PRODUCTOS (CODIGOPRODUCTO,NOMBRE,GAMA,DIMENSIONES,PROVEEDOR,CANTIDADENSTOCK,PRECIOVENTA,PRECIOPROVEEDOR) values ('OR-99','Mimosa DEALBATA Gaulois Astier  ','Ornamentales','200-225','Viveros EL OASIS',100,14,11);
--------------------------------------------------------
--  Constraints for Table PAGOS
--------------------------------------------------------

  ALTER TABLE "PAGOS" MODIFY ("CODIGOCLIENTE" NOT NULL ENABLE);
  ALTER TABLE "PAGOS" MODIFY ("FORMAPAGO" NOT NULL ENABLE);
  ALTER TABLE "PAGOS" MODIFY ("IDTRANSACCION" NOT NULL ENABLE);
  ALTER TABLE "PAGOS" MODIFY ("FECHAPAGO" NOT NULL ENABLE);
  ALTER TABLE "PAGOS" MODIFY ("CANTIDAD" NOT NULL ENABLE);
  ALTER TABLE "PAGOS" ADD PRIMARY KEY ("CODIGOCLIENTE", "IDTRANSACCION")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table OFICINAS
--------------------------------------------------------

  ALTER TABLE "OFICINAS" MODIFY ("CODIGOOFICINA" NOT NULL ENABLE);
  ALTER TABLE "OFICINAS" MODIFY ("CIUDAD" NOT NULL ENABLE);
  ALTER TABLE "OFICINAS" MODIFY ("PAIS" NOT NULL ENABLE);
  ALTER TABLE "OFICINAS" MODIFY ("CODIGOPOSTAL" NOT NULL ENABLE);
  ALTER TABLE "OFICINAS" MODIFY ("TELEFONO" NOT NULL ENABLE);
  ALTER TABLE "OFICINAS" MODIFY ("LINEADIRECCION1" NOT NULL ENABLE);
  ALTER TABLE "OFICINAS" ADD PRIMARY KEY ("CODIGOOFICINA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table EMPLEADOS
--------------------------------------------------------

  ALTER TABLE "EMPLEADOS" MODIFY ("CODIGOEMPLEADO" NOT NULL ENABLE);
  ALTER TABLE "EMPLEADOS" MODIFY ("NOMBRE" NOT NULL ENABLE);
  ALTER TABLE "EMPLEADOS" MODIFY ("APELLIDO1" NOT NULL ENABLE);
  ALTER TABLE "EMPLEADOS" MODIFY ("EXTENSION" NOT NULL ENABLE);
  ALTER TABLE "EMPLEADOS" MODIFY ("EMAIL" NOT NULL ENABLE);
  ALTER TABLE "EMPLEADOS" MODIFY ("CODIGOOFICINA" NOT NULL ENABLE);
  ALTER TABLE "EMPLEADOS" ADD PRIMARY KEY ("CODIGOEMPLEADO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CLIENTES
--------------------------------------------------------

  ALTER TABLE "CLIENTES" MODIFY ("CODIGOCLIENTE" NOT NULL ENABLE);
  ALTER TABLE "CLIENTES" MODIFY ("NOMBRECLIENTE" NOT NULL ENABLE);
  ALTER TABLE "CLIENTES" MODIFY ("TELEFONO" NOT NULL ENABLE);
  ALTER TABLE "CLIENTES" MODIFY ("FAX" NOT NULL ENABLE);
  ALTER TABLE "CLIENTES" MODIFY ("LINEADIRECCION1" NOT NULL ENABLE);
  ALTER TABLE "CLIENTES" MODIFY ("CIUDAD" NOT NULL ENABLE);
  ALTER TABLE "CLIENTES" ADD PRIMARY KEY ("CODIGOCLIENTE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table DETALLEPEDIDOS
--------------------------------------------------------

  ALTER TABLE "DETALLEPEDIDOS" MODIFY ("CODIGOPEDIDO" NOT NULL ENABLE);
  ALTER TABLE "DETALLEPEDIDOS" MODIFY ("CODIGOPRODUCTO" NOT NULL ENABLE);
  ALTER TABLE "DETALLEPEDIDOS" MODIFY ("CANTIDAD" NOT NULL ENABLE);
  ALTER TABLE "DETALLEPEDIDOS" MODIFY ("PRECIOUNIDAD" NOT NULL ENABLE);
  ALTER TABLE "DETALLEPEDIDOS" MODIFY ("NUMEROLINEA" NOT NULL ENABLE);
  ALTER TABLE "DETALLEPEDIDOS" ADD PRIMARY KEY ("CODIGOPEDIDO", "CODIGOPRODUCTO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PRODUCTOS
--------------------------------------------------------

  ALTER TABLE "PRODUCTOS" MODIFY ("CODIGOPRODUCTO" NOT NULL ENABLE);
  ALTER TABLE "PRODUCTOS" MODIFY ("NOMBRE" NOT NULL ENABLE);
  ALTER TABLE "PRODUCTOS" MODIFY ("GAMA" NOT NULL ENABLE);
  ALTER TABLE "PRODUCTOS" MODIFY ("CANTIDADENSTOCK" NOT NULL ENABLE);
  ALTER TABLE "PRODUCTOS" MODIFY ("PRECIOVENTA" NOT NULL ENABLE);
  ALTER TABLE "PRODUCTOS" ADD PRIMARY KEY ("CODIGOPRODUCTO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PEDIDOS
--------------------------------------------------------

  ALTER TABLE "PEDIDOS" MODIFY ("CODIGOPEDIDO" NOT NULL ENABLE);
  ALTER TABLE "PEDIDOS" MODIFY ("FECHAPEDIDO" NOT NULL ENABLE);
  ALTER TABLE "PEDIDOS" MODIFY ("FECHAESPERADA" NOT NULL ENABLE);
  ALTER TABLE "PEDIDOS" MODIFY ("ESTADO" NOT NULL ENABLE);
  ALTER TABLE "PEDIDOS" MODIFY ("CODIGOCLIENTE" NOT NULL ENABLE);
  ALTER TABLE "PEDIDOS" ADD PRIMARY KEY ("CODIGOPEDIDO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table GAMASPRODUCTOS
--------------------------------------------------------

  ALTER TABLE "GAMASPRODUCTOS" MODIFY ("GAMA" NOT NULL ENABLE);
  ALTER TABLE "GAMASPRODUCTOS" ADD PRIMARY KEY ("GAMA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CLIENTES
--------------------------------------------------------

  ALTER TABLE "CLIENTES" ADD CONSTRAINT "CLIENTES_EMPLEADOSFK" FOREIGN KEY ("CODIGOEMPLEADOREPVENTAS")
	  REFERENCES "EMPLEADOS" ("CODIGOEMPLEADO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table DETALLEPEDIDOS
--------------------------------------------------------

  ALTER TABLE "DETALLEPEDIDOS" ADD CONSTRAINT "DETALLEPEDIDOS_PEDIDOFK" FOREIGN KEY ("CODIGOPEDIDO")
	  REFERENCES "PEDIDOS" ("CODIGOPEDIDO") ENABLE;
  ALTER TABLE "DETALLEPEDIDOS" ADD CONSTRAINT "DETALLEPEDIDOS_PRODUCTOFK" FOREIGN KEY ("CODIGOPRODUCTO")
	  REFERENCES "PRODUCTOS" ("CODIGOPRODUCTO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table EMPLEADOS
--------------------------------------------------------

  ALTER TABLE "EMPLEADOS" ADD CONSTRAINT "EMPLEADOS_OFICINASFK" FOREIGN KEY ("CODIGOOFICINA")
	  REFERENCES "OFICINAS" ("CODIGOOFICINA") ENABLE;
  ALTER TABLE "EMPLEADOS" ADD CONSTRAINT "EMPLEADOS_EMPLEADOSFK" FOREIGN KEY ("CODIGOJEFE")
	  REFERENCES "EMPLEADOS" ("CODIGOEMPLEADO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PAGOS
--------------------------------------------------------

  ALTER TABLE "PAGOS" ADD CONSTRAINT "PAGOS_CLIENTEFK" FOREIGN KEY ("CODIGOCLIENTE")
	  REFERENCES "CLIENTES" ("CODIGOCLIENTE") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PEDIDOS
--------------------------------------------------------

  ALTER TABLE "PEDIDOS" ADD CONSTRAINT "PEDIDOS_CLIENTE" FOREIGN KEY ("CODIGOCLIENTE")
	  REFERENCES "CLIENTES" ("CODIGOCLIENTE") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PRODUCTOS
--------------------------------------------------------

  ALTER TABLE "PRODUCTOS" ADD CONSTRAINT "PRODUCTOS_GAMAFK" FOREIGN KEY ("GAMA")
	  REFERENCES "GAMASPRODUCTOS" ("GAMA") ENABLE;


/PL/SQUIL

// Mostrar el nombre de un cliente dado su cï¿½digo //

ACCEPT codigo PROMPT 'Introduce el cï¿½digo del cliente';

DECLARE
    nombre clientes.nombrecliente%TYPE;
BEGIN
    SELECT nombrecliente INTO nombre FROM clientes
    WHERE codigocliente = '&codigo';
    DBMS_OUTPUT.put_line ('El nombre del cliente con cï¿½digo ' || &codigo || ' es ' || nombre);
EXCEPTION
    WHEN no_data_found THEN
        DBMS_OUTPUT.put_line ('No se ha encontrado  el cliente');
END;


// Mostrar el precioVenta y la gama de un producto dado su cï¿½digo //

ACCEPT codigo PROMPT 'Introduce el cï¿½digo del producto';

DECLARE
    p productos.precioventa%TYPE;
    g productos.gama%TYPE;
BEGIN
    SELECT precioventa INTO p FROM productos
    WHERE codigoproducto LIKE '&codigo';
    SELECT gama INTO g FROM productos 
    WHERE codigoproduco LIKE '&codigo';
    DBMS_OUTPUT.put_line ('El precio del producto con codigo ' || &codigo || ' es ' || p || ' y su gama es ' || g);
    
// Mostrar toda la informacion de un pedido dado su cï¿½digo
(fechaEsperada, fechaEntrega, fechapedido, estado, comentarios) //

ACCEPT codigo PROMPT 'Introduce el codigo del pedido';
DECLARE
    fechaEsp pedidos.fechaesperada%TYPE;
    fechaEnt pedidos.fechaentrega%TYPE;
    fechaPed pedidos.fechapedido%TYPE;
    est pedidos.estado%TYPE;
    come pedidos.comentarios%TYPE;
BEGIN 
    SELECT fechaesperada
    INTO fechaEsp FROM pedidos
    WHERE codigopedido LIKE '&codigo';
    
    SELECT fechaesperada
    INTO fechaEsp FROM pedidos
    WHERE codigopedido LIKE '&codigo';
    
    SELECT fechapedido
    INTO fechaPed FROM pedidos
    WHERE codigopedido LIKE '&codigo';
    
    SELECT estado
    INTO est FROM pedidos
    WHERE codigopedido LIKE '&codigo';
    
    SELECT comentarios
    INTO comt FROM pedidos
    WHERE codigopedido LIKE '&codigo';
    DBMS_OUTPUT.put_line ('La fecha esperada es ' || &codigo || ' es ' || );
    
// Realizar una funciï¿½n que devuelva la suma de pagos que ha realizado
un cliente. Pasa el cï¿½digo por teclado. //

ACCEPT codigo PROMPT 'Introduce el cï¿½digo del cliente';
DECLARE
    suma pagos.cantidad%TYPE;
BEGIN
    SELECT SUM(cantidad) INTO suma FROM pagos
    WHERE codigocliente='&codigo';
    DBMS_OUTPUT.put_line ('La suma de pagos es ' || &codigo || ' es ' || suma);
END;

// Mostrar el nombre de un cliente dado su cï¿½digo. Controla en caso de
//que nou se encuentre, mostrando un mensaje por ejemplo //


ACCEPT codigo PROMPT 'Introduce el codigo del pedido';
DECLARE
    precio detallepedidos.preciounidad%TYPE;
    canti detallepedidos.cantidad%TYPE;
SELECT cantidad, preciounidad FROM detallepedidos   
    WHERE poch('|| &type || ' es ' || es ');
    
//Realizar una funciï¿½n que devuelva la suma de pagos que ha realizado
//un cliente. Pasa el cï¿½digo por teclado. Controla en caso de que no se
//encuentre, en ese caso devuelve un -1.

ACCEPT codigo PROMPT 'Introduce el codigo';

DECLARE
    suma pagos.cantidad%ROWTYPE;
SELECT
    SELECT SUM(cantidad) INTO 
    
//Muestra todos los clientes que no hayan hecho pagos. Hazlo con un loop.

DECLARE 
    FOR i IN(SELECT nombrecliente FROM clientes WHERE codigocliente NOT IN (SELECT codigocliente FROM pagos) LOOP
    DBMS_OUTPUT.put_line ( 'Los clientes que nou han pagado' || &codigo || 'son ' || i);  
    END LOOP;
END;

//Haz un procedimiento para modificar el precio de venta de los productos.
//Se le pedirï¿½ al usuario un precio. En caso de que el producto tenga su
//precio a nulo, se actualizarï¿½ asignï¿½ndole la cantidad introducida. En
//caso contrario se le sumarï¿½ al precio existente.

ACCEPT precio PROMPT 'Introduce el ID del producto';
ACCEPT precio PROMPT 'Introduce el precio del producto';

DECLARE
    p productos.precioventa%TYPE;
BEGIN
    SELECT precioventa INTO p FROM productos WHERE codigoproducto LIKE '%produc%';
    IF (p IS NULL) THEN
    UPDATE productos SET precioventa = &precio WHERE codigoproducto LIKE '%produc%';
    ELSE
    UPDATE productos SET precioventa = precioventa + &precio WHERE codigoproducto LIKE '%produc%';
    END IF;
END;


//Haz un procedimiento para insertar nuevos productos. Se le pedirï¿½ al usuario una
//cantidad y un proveedor. Se insertarï¿½n nuevos productos en la tabla,
//insertando los cï¿½digos desde el ï¿½ltimo utilizado hasta la cantidad
//indicada por el usuario.


//12.Haz un para insertar nuevos productos. Se le pedirï¿½ al usuario una
//cantidad y un proveedor. Se insertarï¿½n nuevos productos en la tabla,
//insertando los cï¿½digos desde el ï¿½ltimo utilizado hasta la cantidad
//indicada por el usuario.
ACCEPT nom PROMPT "Introduce el nombre del cliente"
ACCEPT prod1 PROMPT "Introduce el nombre del primer producto"
ACCEPT prod2 PROMPT "Introduce el nombre del segundo producto"
ACCEPT prod3 PROMPT "Introduce el nombre del tercer producto"

DECLARE 
    codp pedidos.codigopedido%TYPE;
    nump NUMBER(1) >= 0;
    codcli clientes.codigocliente%TYPE;
    codpr1 productos.codigoproducto%TYPE;
    codpr2 productos.codigoproducto%TYPE;
    codpr3 productos.codigoproducto%TYPE;
BEGIN
    SELECT MAX(codigopedido)+1 INTO codp FROM pedidos;
    SELECT codigocliente INTO codcli FROM clientes WHERE nombrecliente LIKE '&nomcli&' ON nombre JOIN '&nomcli&';
END;
    
    INSERT INTO productos VALUES ;
    
DROP TABLE clientes CASCADE CONSTRAINT;
DROP TABLE detallepedidos CASCADE CONSTRAINT;
DROP TABLE empleados CASCADE CONSTRAINT;
DROP TABLE gamasproductos CASCADE CONSTRAINT;
DROP TABLE oficinas CASCADE CONSTRAINT;
DROP TABLE pedidos CASCADE CONSTRAINT;
DROP TABLE direccion CASCADE CONSTRAINT;
DROP TABLE productos CASCADE CONSTRAINT;
DROP TABLE pagos CASCADE CONSTRAINT;

CREATE TABLE restaurante 
(
    codires NUMERIC(5) GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER NOCYCLE NOT NULL ENABLE PRIMARY KEY,
    nombre VARCHAR2(50),
    direccion VARCHAR2(80),
    horariosem CLOB,
    localidades CLOB NOT NULL
);

CREATE TABLE categoria
(
    codcategor NUMERIC(2) GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER NOCYCLE NOT NULL ENABLE PRIMARY KEY,
    numcategor VARCHAR2(20) NOT NULL UNIQUE
);

CREATE TABLE platos
(   
    codipla NUMERIC(5) GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER NOCYCLE NOT NULL ENABLE PRIMARY KEY,
    nombreplato VARCHAR2(60) NOT NULL,
    descriplato VARCHAR2(100),
    precio NUMERIC(5,2) NOT NULL,
    categoriapla NUMERIC(2) NOT NULL,
    
    CONSTRAINT fk_categoria_pla FOREIGN KEY (categoriapla) REFERENCES categoria(codcategor)
);

CREATE TABLE carta
(
    cartarest NUMERIC(5),
    cartaplat NUMERIC(5),
    
    CONSTRAINT pk_carta PRIMARY KEY (cartarest, cartaplat),
    CONSTRAINT fk_carta_rest FOREIGN KEY (cartarest) REFERENCES restaurante(codires),
    CONSTRAINT fk_carta_plat FOREIGN KEY (cartaplat) REFERENCES platos(codipla)
);

CREATE TABLE direccion
(
    codirec NUMERIC(5) GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER NOCYCLE NOT NULL ENABLE PRIMARY KEY,
    calle VARCHAR2(50) NOT NULL,
    numero NUMERIC(3) NOT NULL,
    piso VARCHAR2(5),
    localidad VARCHAR2(50) NOT NULL,
    codipostal NUMERIC(5) NOT NULL
);

CREATE TABLE clientes
(
    dni VARCHAR2(9) PRIMARY KEY,
    nombrecli VARCHAR2(50) NOT NULL,
    apellidos VARCHAR2(50) NOT NULL,
    direcclie NUMERIC(5),
    usuario VARCHAR2(50) NOT NULL,
    clave VARCHAR2(50) NOT NULL,
    telef NUMERIC(10) NOT NULL,
    
    CONSTRAINT fk_direc_clie FOREIGN KEY (direcclie) REFERENCES direccion(codirec)
);

CREATE TABLE pedidos (
    codipedido NUMERIC(10) GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER NOCYCLE NOT NULL ENABLE PRIMARY KEY,
    dniclien VARCHAR2(9) NOT NULL,
    fechapedi DATE NOT NULL,
    fechaentre DATE,
    estado VARCHAR2(10) CHECK (estado IN ('REST', 'CANCEL', 'RUTA', 'ENTREGADO', 'RECHAZADO')),
    importotal NUMERIC(10,2),
    codicupon VARCHAR2(10),
    
    CONSTRAINT fk_pedido_cliente FOREIGN KEY (dniclien) REFERENCES clientes(dni)
);

CREATE TABLE tiene 
(
    codipedido NUMERIC(10) NOT NULL,
    codipla NUMERIC(5) NOT NULL,
    cantidad NUMERIC(3) NOT NULL,
    comision NUMERIC(5,2) NOT NULL,
    
    CONSTRAINT pk_tiene PRIMARY KEY (codipedido, codipla),
    CONSTRAINT fk_contiene_pedido FOREIGN KEY (codipedido) REFERENCES pedidos(codipedido),
    CONSTRAINT fk_contiene_plato FOREIGN KEY (codipla) REFERENCES platos(codipla)
);

CREATE TABLE cupones
(
    codcupon VARCHAR2(10) PRIMARY KEY,
    fechacaduc DATE NOT NULL,
    descuento NUMERIC(5,2) CHECK (descuento BETWEEN 0 AND 100)
);


--CATEGORÃ?A
INSERT INTO categoria (codcategor, numcategor) VALUES (1, 'Ensaladas');
INSERT INTO categoria (codcategor, numcategor) VALUES (2, 'Platos principales');
INSERT INTO categoria (codcategor, numcategor) VALUES (3, 'Postres');

--DIRECCION
INSERT INTO direccion (codirec, calle, numero, piso, localidad, codipostal) VALUES(1,'Calle Mayor', 10, '3A', 'Madrid', 28013);
INSERT INTO direccion (codirec, calle, numero, piso, localidad, codipostal) VALUES(2,'Avenida Andalucia', 45, NULL, 'Sevilla', 41010);
INSERT INTO direccion (codirec, calle, numero, piso, localidad, codipostal) VALUES(3,'Gran Via', 13, '2B', 'Barcelona', 08010);
INSERT INTO direccion (codirec, calle, numero, piso, localidad, codipostal) VALUES(4,'Calle Reina Sofia', 6, NULL, 'Granada', 18630);
INSERT INTO direccion (codirec, calle, numero, piso, localidad, codipostal) VALUES(5,'Calle Keops', 25, '4C', 'Madrid', 17625);
INSERT INTO direccion (codirec, calle, numero, piso, localidad, codipostal) VALUES(6,'Avenida Malaga', 1, NULL, 'La Rioja', 21300);
INSERT INTO direccion (codirec, calle, numero, piso, localidad, codipostal) VALUES(7,'Puerta del Sol', 37, '1A', 'Girona', 09267);
INSERT INTO direccion (codirec, calle, numero, piso, localidad, codipostal) VALUES(8,'Calle Huertas', 23, '5C', 'Granada', 28772);
INSERT INTO direccion (codirec, calle, numero, piso, localidad, codipostal) VALUES(9,'Avenida de la Albufera', 67, '4B', 'Alicante', 16382);
INSERT INTO direccion (codirec, calle, numero, piso, localidad, codipostal) VALUES(10,'Calle Mayor', 2, NULL, 'Jaen', 01292);
INSERT INTO direccion (codirec, calle, numero, piso, localidad, codipostal) VALUES(11,'Avenida de America', 30, '2A', 'Badajoz', 92300);
INSERT INTO direccion (codirec, calle, numero, piso, localidad, codipostal) VALUES(12,'Calle Granada', 29, NULL, 'Murcia', 48065);

--RESTAURANTE
INSERT INTO restaurante (codires, nombre, direccion, horariosem, localidades) VALUES (1, 'Don Pepe', 'Calle Mayor 10, Madrid', 'Lunes a Domingo: 12:00-23:00', 'Madrid, Barajas');
INSERT INTO restaurante (codires, nombre, direccion, horariosem, localidades) VALUES (2, 'Bar Paco', 'Calle Reina Sofia 6, Granada', 'Miercoles a Domingo: 13:00-22:00', 'Granada, Alhendin');
INSERT INTO restaurante (codires, nombre, direccion, horariosem, localidades) VALUES (3, 'Restaurante Manolo', 'Puerta del Sol 37, Girona', 'Lunes a Sabado: 12:00-23:30', 'Girona, Lloret de mar');
INSERT INTO restaurante (codires, nombre, direccion, horariosem, localidades) VALUES (4, 'Camino de Santiago', 'Avda. de la Albufera 67, Alicante', 'Jueves a Domingo: 13:00-22:00', 'Alicante, Orihuela');
INSERT INTO restaurante (codires, nombre, direccion, horariosem, localidades) VALUES (5, 'Repica', 'Gran Via 13, Barcelona', 'Martes a Domingo: 14:00-23:00', 'Barcelona, Badalona');

--PLATOS
INSERT INTO platos (codipla, nombreplato, descriplato, precio, categoriapla) VALUES(1,'Ensalada Cesar', 'Lechuga, Pollo, Salsa Cesar', 8.50, 1);
INSERT INTO platos (codipla, nombreplato, descriplato, precio, categoriapla) VALUES(2,'Pizza Margarita', 'Tomate, queso mozzarella, albahaca', 12.00, 2);
INSERT INTO platos (codipla, nombreplato, descriplato, precio, categoriapla) VALUES(3,'Tarta de queso', 'Tarta de queso casera', 6.00, 3);
INSERT INTO platos (codipla, nombreplato, descriplato, precio, categoriapla) VALUES(4,'Callos', 'Ternera, Chorizo, Panceta, Guindilla, Morcilla, Laurel', 10.00, 3);
INSERT INTO platos (codipla, nombreplato, descriplato, precio, categoriapla) VALUES(5,'Rosca de Lomo', 'Huevo, Lechuga, Tomate, Lomo, Pimientos Verdes', 11.00, 2);
INSERT INTO platos (codipla, nombreplato, descriplato, precio, categoriapla) VALUES(6,'Pollo a la brasa', 'Pollo de Corral', 13.50, 1);
INSERT INTO platos (codipla, nombreplato, descriplato, precio, categoriapla) VALUES(7,'Almejas a la Marinera', 'Almejas, Ajo', 11.50, 3);
INSERT INTO platos (codipla, nombreplato, descriplato, precio, categoriapla) VALUES(8,'Tarta de Pistacho', 'Tarta de pistacho casera', 6.50, 1);
INSERT INTO platos (codipla, nombreplato, descriplato, precio, categoriapla) VALUES(9,'Hamburguesa Completa', 'Hamburguesa con lechuga, tomate y queso', 7.00, 2);
INSERT INTO platos (codipla, nombreplato, descriplato, precio, categoriapla) VALUES(10,'Calamares', 'Calamares Fritos', 12.00, 3);
INSERT INTO platos (codipla, nombreplato, descriplato, precio, categoriapla) VALUES(11,'Pulpo a la Brasa', 'Pata de pulpo', 18.00, 2);
INSERT INTO platos (codipla, nombreplato, descriplato, precio, categoriapla) VALUES(12,'Redondo de Ternera', 'Cebolla, Ternera, Laurel, Champinones, Zanahoria', 13.00, 1);

--CUPONES
INSERT INTO cupones (codcupon, fechacaduc, descuento) VALUES ('PRIMER10', '2025-12-31', 10.00);
INSERT INTO cupones (codcupon, fechacaduc, descuento) VALUES ('ENVIOGRATIS', '2025-07-31', 100.00);
INSERT INTO cupones (codcupon, fechacaduc, descuento) VALUES ('CENA2X1', '2025-05-15', 50.00);
INSERT INTO cupones (codcupon, fechacaduc, descuento) VALUES ('FINDESABOR', '2025-08-30', 20.00);
INSERT INTO cupones (codcupon, fechacaduc, descuento) VALUES ('REBAJA5', '2025-06-15', 5.00);

--CLIENTES
INSERT INTO clientes (dni, nombrecli, apellidos, direcclie, usuario, clave, telef) VALUES ('12345678A', 'Ana', 'Lopez Garcia', 1, 'analopez', 'clave123', 612345678);
INSERT INTO clientes (dni, nombrecli, apellidos, direcclie, usuario, clave, telef) VALUES ('23456789B', 'Carlos', 'Martin Perez', 2, 'cmartin', 'segura456', 622345679);
INSERT INTO clientes (dni, nombrecli, apellidos, direcclie, usuario, clave, telef) VALUES ('34567890C', 'Lucia', 'Fernandez Ruiz', 3, 'luciafr', 'password789', 632345680);
INSERT INTO clientes (dni, nombrecli, apellidos, direcclie, usuario, clave, telef) VALUES ('45678901D', 'Laura', 'Gomez Torres', 4, 'lauragt', 'pass789', 645678901);
INSERT INTO clientes (dni, nombrecli, apellidos, direcclie, usuario, clave, telef) VALUES ('75575532Q', 'David', 'Ruiz Alba', 5, 'davidruiz', 'clave123', 656789012);

--CARTA
INSERT INTO carta (cartarest, cartaplat) VALUES (1, 1);
INSERT INTO carta (cartarest, cartaplat) VALUES (1, 2);
INSERT INTO carta (cartarest, cartaplat) VALUES (2, 3);
INSERT INTO carta (cartarest, cartaplat) VALUES (3, 4);
INSERT INTO carta (cartarest, cartaplat) VALUES (4, 5);

--PEDIDOS
INSERT INTO pedidos (codipedido, dniclien, fechapedi, fechaentre, estado, importotal, codicupon) VALUES (1, '12345678A', '2025-04-01', '2025-04-01', 'ENTREGADO', 20.00, 'PRIMER10');
INSERT INTO pedidos (codipedido, dniclien, fechapedi, fechaentre, estado, importotal, codicupon) VALUES (2, '23456789B','2025-04-02','2025-04-02', 'ENTREGADO', 15.00, 'ENVIOGRATIS');
INSERT INTO pedidos (codipedido, dniclien, fechapedi, fechaentre, estado, importotal, codicupon) VALUES (3, '34567890C', '2025-04-03', NULL, 'RUTA', 18.50, NULL);
INSERT INTO pedidos (codipedido, dniclien, fechapedi, fechaentre, estado, importotal, codicupon) VALUES (4, '45678901D', '2025-04-06', '2025-04-06', 'ENTREGADO', 26.00, NULL);
INSERT INTO pedidos (codipedido, dniclien, fechapedi, fechaentre, estado, importotal, codicupon) VALUES (5, '75575532Q', '2025-04-07', NULL, 'REST', 15.50, 'CENA2X1');

--TIENE
INSERT INTO tiene (codipedido, codipla, cantidad, comision) VALUES (1, 1, 1, 0.50);
INSERT INTO tiene (codipedido, codipla, cantidad, comision) VALUES (2, 2, 1, 0.80);
INSERT INTO tiene (codipedido, codipla, cantidad, comision) VALUES (3, 3, 2, 0.40);
INSERT INTO tiene (codipedido, codipla, cantidad, comision) VALUES (4, 4, 1, 0.60);
INSERT INTO tiene (codipedido, codipla, cantidad, comision) VALUES (5, 5, 3, 0.25);

//PROGRAMAS EN PL/SQL
//PROCEDIMIENTO1

ACCEPT dni PROMPT 'Introduce tu dni';
DECLARE
    dnicli clientes.dniclientes%TYPE;
    pedidos INT;
BEGIN
    SELECT*FROM clientes WHERE dniclientes LIKE '&dni';
EXCEPTION
    WHEN NO_DATA_FOUND THEN 
        DBMS_OUTPUT.put_line ('No existe ningun cliente que tenga ese DNI');
END;


//CURSORES
        
CREATE TABLE cliente (
    id NUMBER PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL
);

-- Tabla trabajador
CREATE TABLE trabajador (
    id NUMBER PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL,
    sueldo NUMBER(10,2) NOT NULL
);

-- Tabla tratamiento
CREATE TABLE tratamiento (
    id NUMBER PRIMARY KEY,
    descripcion VARCHAR2(200),
    precio NUMBER(10,2) NOT NULL
);

-- Tabla cita
CREATE TABLE cita (
    id_cli NUMBER NOT NULL,
    id_tra NUMBER NOT NULL,
    id_trat NUMBER NOT NULL,
    fecha DATE NOT NULL,
    PRIMARY KEY (id_cli, id_tra, id_trat, fecha),
    FOREIGN KEY (id_cli) REFERENCES cliente(id),
    FOREIGN KEY (id_tra) REFERENCES trabajador(id),
    FOREIGN KEY (id_trat) REFERENCES tratamiento(id)
);

-- Clientes
INSERT INTO cliente (id, nombre) VALUES (1, 'Laura Méndez');
INSERT INTO cliente (id, nombre) VALUES (2, 'Carlos Ruiz');
INSERT INTO cliente (id, nombre) VALUES (3, 'Ana Torres');
INSERT INTO cliente (id, nombre) VALUES (4, 'Javier López');
INSERT INTO cliente (id, nombre) VALUES (5, 'Sofía García');

-- Trabajadores
INSERT INTO trabajador (id, nombre, sueldo) VALUES (101, 'Marcos Pérez', 2850.00);
INSERT INTO trabajador (id, nombre, sueldo) VALUES (102, 'Clara Díaz', 1750.50);
INSERT INTO trabajador (id, nombre, sueldo) VALUES (103, 'Elena Vargas', 2950.75);
INSERT INTO trabajador (id, nombre, sueldo) VALUES (104, 'Pedro Gómez', 1550.00);
INSERT INTO trabajador (id, nombre, sueldo) VALUES (105, 'Marta Rojas', 1850.00);

-- Tratamientos
INSERT INTO tratamiento (id, descripcion, precio) VALUES (10, 'Limpieza dental', 50.00);
INSERT INTO tratamiento (id, descripcion, precio) VALUES (20, 'Empaste composite', 85.50);
INSERT INTO tratamiento (id, descripcion, precio) VALUES (30, 'Ortodoncia inicial', 1200.00);
INSERT INTO tratamiento (id, descripcion, precio) VALUES (40, 'Blanqueamiento', 150.00);
INSERT INTO tratamiento (id, descripcion, precio) VALUES (50, 'Extracción muela', 200.00);

-- Citas
INSERT INTO cita (id_cli, id_tra, id_trat, fecha) VALUES (1, 101, 10, DATE '2024-03-01');
INSERT INTO cita (id_cli, id_tra, id_trat, fecha) VALUES (2, 103, 30, DATE '2024-03-02');
INSERT INTO cita (id_cli, id_tra, id_trat, fecha) VALUES (3, 105, 10, DATE '2024-03-03');
INSERT INTO cita (id_cli, id_tra, id_trat, fecha) VALUES (4, 101, 20, DATE '2024-03-04');
INSERT INTO cita (id_cli, id_tra, id_trat, fecha) VALUES (5, 103, 40, DATE '2024-03-05');
INSERT INTO cita (id_cli, id_tra, id_trat, fecha) VALUES (1, 102, 50, DATE '2024-03-06');
INSERT INTO cita (id_cli, id_tra, id_trat, fecha) VALUES (2, 105, 10, DATE '2024-03-07');
INSERT INTO cita (id_cli, id_tra, id_trat, fecha) VALUES (3, 101, 30, DATE '2024-03-08');
INSERT INTO cita (id_cli, id_tra, id_trat, fecha) VALUES (4, 103, 40, DATE '2024-03-09');
INSERT INTO cita (id_cli, id_tra, id_trat, fecha) VALUES (5, 102, 20, DATE '2024-03-10');
INSERT INTO cita (id_cli, id_tra, id_trat, fecha) VALUES (1, 105, 50, DATE '2024-03-11');
INSERT INTO cita (id_cli, id_tra, id_trat, fecha) VALUES (2, 101, 10, DATE '2024-03-12');
INSERT INTO cita (id_cli, id_tra, id_trat, fecha) VALUES (3, 103, 20, DATE '2024-03-13');
INSERT INTO cita (id_cli, id_tra, id_trat, fecha) VALUES (4, 105, 30, DATE '2024-03-14');
INSERT INTO cita (id_cli, id_tra, id_trat, fecha) VALUES (5, 101, 40, DATE '2024-03-15');

DECLARE 
    CURSOR sueldos IS SELECT nombre FOR trabajador ORDER BY sueldo;
    nomTrab trabajador.nombre%TYPE;
BEGIN
    OPEN sueldos;
    FETCH sueldos INTO nomTrab;
    DBMS_OUTPUT.put_line 

DECLARE 
    CURSOR cu IS SELECT fecha, nombre, descripcion FROM cita, tratamiento, cliente 
    WHEN id_cli = cliente.id AND id_trat = tratamiento.id;
    fecha cita.fecha%TYPE;
    nomb cliente.nombre%TYPE;
    trat tratamiento.descripcion%TYPE;
BEGIN
    OPEN cu;
    FOR i IN 1..2 LOOP
    FETCH cu INTO fecha, nomb, trat;
    DBMS_OUTPUT.put_line('Fecha:|| el cliente || nomCl');
END LOOP;

//Ejercicio 3

DECLARE
    CURSOR cur_trat IS SELECT descripcion, precio AND tratamiento;
    descrip tratamiento%TYPE;
    preci tratamiento%TYPE;
BEGIN
    OPEN cur_trat;
    LOOP
    FETCH cur_trat INTO descrip, preci;
    END WHEN cur_trat%NOTFOUND;
    DBMS_OUTPUT.put_line('Nombre: ' ||trat.descripcion);
    DBMS_OUTPUT.put_line('Precio: ' ||trat.precio);
END LOOP;
CLOSE cur_trat;
EXIT;

//Ejercicio 4

DECLARE
    CURSOR cur_trat IS SELECT DISTINCT tratamiento.id, descripcion FROM 
BEGIN

END;


SELECT nombre CONT (id_tra) FROM tr

DECLARE 
    CURSOR tra IS SELECT descripcion, COUNT (id_trat) FROM trabajadores JOIN cita ON id_trat = id GROUP BY descripcion;
    desc tratamiento.descripcion%TYPE;
    num NUMBER;
BEGIN
    OPEN tra;
    LOOP
    FETCH tra INTO desc, num;
    EXIT WHEN tra%NOTFOUND;
    DBMS_OUTPUT.put_line('El tratamiento ' || desc || ' se ha hecho ' || num || ' veces ');
    END LOOP;
    CLOSE tra;
END;

DECLARE 
    CURSOR sueldo_trabajador IS SELECT nombre, sueldo+4 COUNT(cita.*)
    FROM trabajador
    JOIN cita ON id_tra = id
    GROUP BY nombre;
nom nombre%TYPE;
suel NUMBER
BEGIN
    OPEN sueldo_trabajador
    LOOP
    FETCH sueldo_trabajador INTO nom, suel;
    DBMS_OUTPUT.put_line('A ' || nom || ' se deben pagar ' || suel );
END LOOP;
CLOSE sueldo_trabajador;
END;


accep nomCli PROMPT 'Nombre del cliente';
DECLARE 
    CURSOR nomClase IS SELECT fecha, descripcion
    FROM cita
    JOIN tratamiento ON tratamiento.id = id_trat 
    JOIN cliente ON cliente.id = i_cli;
    fech cita.fecha%TYPE;
    trat tratamiento.descripcion%TYPE;
BEGIN

END;


//VETERINARIA//

-- Creación de tablas
CREATE TABLE tipo_animal (
    id NUMBER PRIMARY KEY,
    descripcion VARCHAR2(50) NOT NULL UNIQUE
);

CREATE TABLE raza_animal (
    id NUMBER PRIMARY KEY,
    descripcion VARCHAR2(50) NOT NULL UNIQUE
);

CREATE TABLE duenio (
    id NUMBER PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL,
    edad NUMBER,
    dni VARCHAR2(10) NOT NULL UNIQUE
);

CREATE TABLE tratamiento (
    id NUMBER PRIMARY KEY,
    descripcion VARCHAR2(100) NOT NULL UNIQUE
);

CREATE TABLE animal (
    id NUMBER PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL,
    id_tipo NUMBER NOT NULL,
    id_raza NUMBER,
    edad NUMBER,
    peso NUMBER,
    id_duenio NUMBER NOT NULL,
    FOREIGN KEY (id_tipo) REFERENCES tipo_animal(id),
    FOREIGN KEY (id_raza) REFERENCES raza_animal(id),
    FOREIGN KEY (id_duenio) REFERENCES duenio(id)
);

CREATE TABLE ingreso (
    id_animal NUMBER NOT NULL,
    fecha_ingreso DATE NOT NULL,
    fecha_salida DATE,
    id_tratamiento NUMBER NOT NULL,
    PRIMARY KEY (id_animal, fecha_ingreso),
    FOREIGN KEY (id_animal) REFERENCES animal(id),
    FOREIGN KEY (id_tratamiento) REFERENCES tratamiento(id)
);

-- Tipos de animales
INSERT INTO tipo_animal (id, descripcion) VALUES (1, 'Perro');
INSERT INTO tipo_animal (id, descripcion) VALUES (2, 'Gato');
INSERT INTO tipo_animal (id, descripcion) VALUES (3, 'Conejo');

-- Razas de animales
INSERT INTO raza_animal (id, descripcion) VALUES (1, 'Labrador Retriever');
INSERT INTO raza_animal (id, descripcion) VALUES (2, 'Siames');
INSERT INTO raza_animal (id, descripcion) VALUES (3, 'Persa');

-- Dueños
INSERT INTO duenio (id, nombre, edad, dni) VALUES (1, 'Juan Pérez', 30, '12345678A');
INSERT INTO duenio (id, nombre, edad, dni) VALUES (2, 'María García', 25, '87654321B');
INSERT INTO duenio (id, nombre, edad, dni) VALUES (3, 'Carlos López', 40, '11223344C');

-- Tratamientos
INSERT INTO tratamiento (id, descripcion) VALUES (1, 'Vacunación anual');
INSERT INTO tratamiento (id, descripcion) VALUES (2, 'Esterilización');
INSERT INTO tratamiento (id, descripcion) VALUES (3, 'Cirugía menor');

-- Animales
INSERT INTO animal VALUES (1, 'Max', 1, 1, 5, 30.5, 1);

INSERT INTO animal VALUES (2, 'Luna', 2, 2, 3, 4.2, 2);

INSERT INTO animal VALUES (3, 'Bugs', 3, null, 2, 2.1, 3);

-- Ingresos
INSERT INTO ingreso VALUES (1, '10/05/2024', '10/05/2024', 1);

INSERT INTO ingreso VALUES (2, '11/05/2024', '11/05/2024', 2);

INSERT INTO ingreso VALUES (3, '11/05/2024', null, 3);


//Ejercicio 3//

CREATE OR REPLACE TRIGGER cambiarNomAnimal 
AFTER UPDATE OF nombre ON animal FOR EACH ROW
DECLARE
BEGIN
dbms_output.put_line('La mascota llamada ' || :old.nombre || ' pasa a llamarse ' || :new.nombre);
END cambiarNomAnimal;

UDPATE animal SET nombre = 'Willy' WHERE id= 1;

//Ejercicio 4//

CREATE OR REPLACE TRIGGER cambiarPesoAnimal
AFTER UPDATE OF peso ON animal FOR EACH ROW
BEGIN
IF (:old peso > new.peso) THEN
dbms_output.put_line(:old.nombre || ' ha perdido ' || (:old.peso-:new.peso) || ' kilos ');
ELSE IF(:old.peso < :new.peso) THEN
dbms_output.put_line(:old.nombre || ' ha ganado ' || (:new.peso-:old.peso) || ' kilos ');
ELSE
dbms_output.put_line(:old.nombre || ' mantiene el mismo peso ');
END IF;
END cambiarPesoAnimal;

UPDATE animal SET peso = 20 WHERE id = 1;

//Ejercicio 5//

CREATE OR REPLACE TRIGGER ingresoSinTratamiento 
BEFORE INSERT ON ingreso FOR EACH ROW
BEGIN
IF (:new.id_tratamiento IS NULL) THEN
dbms_output.put_line( ' No se ha introducido tratamiento ' );
END IF;
END ingresoSinTratamiento;

INSERT INTO ingreso( id_animal, fecha_ingreso, fecha_salida) VALUES (1, ' 16/05/25 ', ' 18/05/25 ');

//Ejercicio 6// INCOMPLETO

CREATE OR REPLACE TRIGGER insertNueMascota 
AFTER INSERT ON animal FOR EACH ROW
DECLARE
fecha DATE;
BEGIN

END insertNueMascota;
    
//Ejercicio 7// INCOMPLETO

CREATE TABLE cantidad_animales (
id_animal NUMBER PRIMARY KEY,
cantidad NUMBER DEFAULT 0,

CONSTRAINT fk_cantidad_animales_tipo FOREIGN KEY (id_tipo) REFERENCES tipo_animal(id)
);

CREATE O REPLACE TRIGGER contarAnimales
AFTER INSERT ON animal FOR EACH ROW
BEGIN
IF
END contarAnimales;

//Ejercicio 8//

CREATE TABLE antiguos_clientes(
    id NUMBER PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL,
    edad NUMBER,
    dni VARCHAR2(10) NOT NULL UNIQUE
);

CREATE OR REPLACE TRIGGER borrarClientes
AFTER DELETE ON duenio FOR EACH ROW
BEGIN
DELETE FROM animal WHERE id_duenio = :old.id;
INSERT INTO antiguos_clientes VALUES(:old.id, :old.nombre, :old.edad, :old.dni);
END borrarCliente;

DELETE FROM duenio WHERE id = 1;









    

     


    




    
    



    



CREATE TABLE Estrella 
(
    Nombre VARCHAR2(50) PRIMARY KEY,
    Dirección VARCHAR2(100) NOT NULL UNIQUE,
    Sexo VARCHAR2(1) CHECK (Sexo IN ('H', 'M')),
    Fecha_Nacimiento Date 
);

CREATE TABLE Estudio
(
  Nombre VARCHAR2(50) PRIMARY KEY,
  Dirección VARCHAR2(100) NOT NULL UNIQUE
);

CREATE TABLE Película
(
    Titulo VARCHAR2(50),
    Anio NUMBER(4,0), CHECK (anio > 1900),
    Duración NUMERIC(3,0),
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
    dirección VARCHAR (20) NOT NULL
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
('11111111Z', 'Lucía', '12/07/2002', 'Granada', 'M');
INSERT INTO clientes (dni, nombre, fecha_nac, direccion, sexo) VALUES 
('22222222B', 'Mónica', '18/12/2008', 'Jaén', 'M');
INSERT INTO clientes (dni, nombre, fecha_nac, direccion, sexo) VALUES 
('12345678C', 'Luis', '03/01/2005', 'Granada', 'H');
INSERT INTO clientes (dni, nombre, fecha_nac, direccion, sexo) VALUES 
('33333333R', 'César', '08/09/2003', 'Granada', 'H');
INSERT INTO clientes (dni, nombre, fecha_nac, direccion, sexo) VALUES 
('55555555T', 'Roberto', '24/11/2008', 'Granada', 'H');

ALTER TABLE producto
MODIFY NUMBER(2,0);

ALTER TABLE producto
MODIFY precio NULL;

INSERT INTO productos (cod_prod, nombre, stock, precio, tipo) VALUES
(1, 'Lápiz negro', 100, 0.75, '1');
INSERT INTO productos (cod_prod, nombre, stock, precio, tipo) VALUES
(2, 'Bolígrafo azul', 85, NULL, '1');
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
DELETE FROM clientes WHERE direccion= 'Málaga';
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
WHERE nombre='Bolígrafo azul';

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
SELECT clientes.nombre, precio.cantidad*1.21 FROM clientes, compras, productos WHERE productos.cod_prod= compras.producto AND compras.clientes=clientes.DNI AND clientes.direccion='Málaga'; 
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

CREATE TABLE dueños
(
    matricula VARCHAR2(10),
    persona NUMERIC(3),
    f_ini DATE NOT NULL,
    f_fin DATE,
    
    CONSTRAINT pk_dueños PRIMARY KEY(matricula, persona),
    CONSTRAINT fk_dueños_coche FOREIGN KEY (matrícula) REFERENCES coche(matricula),
    CONSTRAINT fk_dueños_persona FOREIGN KEY (persona) REFERENCES persona(id)
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

INSERT INTO persona (id,nombre,tlf) VALUES (1, 'Juan Pérez', 612345678);
INSERT INTO persona (id,nombre,tlf) VALUES (2, 'María Rodríguez', 655432189);
INSERT INTO persona (id,nombre,tlf) VALUES (3, 'Carlos López', 699876543);
INSERT INTO persona (id,nombre,tlf) VALUES (4, 'Ana Martínez', 667123456);
INSERT INTO persona (id,nombre,tlf) VALUES (5, 'Pedro García', 688987654);

INSERT INTO dueños (matricula, persona, f_ini, f_fin) VALUES ('1111AAA', 1, '01/01/2023', '15/05/2023');
INSERT INTO dueños (matricula, persona, f_ini, f_fin) VALUES ('2222BBB', 2, '10/05/2022', '28/02/2023');
INSERT INTO dueños (matricula, persona, f_ini, f_fin) VALUES ('3333CCC', 3, '15/12/2022', '20/09/2023');
INSERT INTO dueños (matricula, persona, f_ini, f_fin) VALUES ('4444DDD', 4, '05/03/2023', null);
INSERT INTO dueños (matricula, persona, f_ini, f_fin) VALUES ('5555EEE', 5, '20/08/2022', '10/01/2023');
INSERT INTO dueños (matricula, persona, f_ini, f_fin) VALUES ('6666FFF', 1, '01/04/2023', null);
INSERT INTO dueños (matricula, persona, f_ini, f_fin) VALUES ('7777GGG', 2, '25/06/2022', '18/04/2023');
INSERT INTO dueños (matricula, persona, f_ini, f_fin) VALUES ('8888HHH', 3, '30/11/2022', '12/07/2023');
INSERT INTO dueños (matricula, persona, f_ini, f_fin) VALUES ('9999III', 4, '10/02/2023', null);
INSERT INTO dueños (matricula, persona, f_ini, f_fin) VALUES ('1010JJJ', 5, '15/09/2022', '22/03/2023');
INSERT INTO dueños (matricula, persona, f_ini, f_fin) VALUES ('1111AAA', 2, '20/05/2023', null);
INSERT INTO dueños (matricula, persona, f_ini, f_fin) VALUES ('2222BBB', 3, '10/03/2023', null);
INSERT INTO dueños (matricula, persona, f_ini, f_fin) VALUES ('3333CCC', 4, '05/10/2023', null);
INSERT INTO dueños (matricula, persona, f_ini, f_fin) VALUES ('4444DDD', 5, '20/01/2023', '08/11/2023');
INSERT INTO dueños (matricula, persona, f_ini, f_fin) VALUES ('5555EEE', 1, '15/04/2023', null);

SELECT nombre FROM persona;
SELECT tlf FROM persona WHERE nombre = 'Juan Pérez';
SELECT persona FROM dueño WHERE matricula = '1111AAA' AND f_fin IS NULL;
SELECT DISTINCT color FROM coche WHERE marca = 'Honda';
SELECT marca, modelo FROM coche ORDER BY marca; 

SELECT nombre FROM dueño, persona WHERE dueño.persona=persona.id AND f_fin IS NULL; 
SELECT matricula, f_ini FROM coche, persona WHERE nombre.persona = 'Carlos Lopez';
SELECT f_ini FROM coche, dueño WHERE color.coche = 'Rojo';
SELECT color FROM coche, persona WHERE nombre.persona = 'Ana Martínez';
SELECT nombre FROM dueño, coche, persona WHERE dueño.matricula=coche.matricula

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
INSERT INTO ataques VALUES (8,'Puño HIelo',9,75,100,15,'Fisico');

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
SELECT nombre FROM pokemon WHERE peso > (select max(peso) FROM pokemon p, pok_tipo pt, tipo t WHERE p.id=pt.pokemon AND pt.tipo=t.id AND t.nombre='Eléctrico'
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
('11111111Z', 'Lucía', '12/05/2002', 'Granada', 'M');
INSERT INTO cliente (dni, nombre, fecha_nac, direccion, sexo) VALUES
('22222222B', 'Mónica', '18/12/2008', 'Jaén', 'M');
INSERT INTO cliente (dni, nombre, fecha_nac, direccion, sexo) VALUES
('12345678C', 'Luis', '18/02/2008', 'Granada', 'H');
INSERT INTO cliente (dni, nombre, fecha_nac, direccion, sexo) VALUES
('33333333R', 'César', '08/09/2003', 'Granada', 'H');
INSERT INTO cliente (dni, nombre, fecha_nac, direccion, sexo) VALUES
('55555555T', 'Roberto', '24/11/2008', 'Málaga', 'H');


ALTER TABLE producto
MODIFY tipo NUMBER(2,0);

ALTER TABLE producto
MODIFY precio NULL;

INSERT INTO producto (cod, nombre, stock, precio, tipo) VALUES
(1, 'Lápiz negro', 100, 0.75, 1);
INSERT INTO producto (cod, nombre, stock, precio, tipo) VALUES
(2, 'Bolígrafo azul', 85, 1.25, 1);
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
DELETE FROM cliente WHERE direccion='Málaga';
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
WHERE nombre='Bolígrafo azul';

UPDATE cliente
SET direccion='Málaga'
WHERE nombre='Mónica';

UPDATE producto
SET precio = precio + 0.25;

UPDATE compra
SET cantidad = cantidad + 1
WHERE producto=2;

UPDATE producto
SET precio = 1.25
WHERE tipo=1 OR tipo=2;

UPDATE cliente SET nombre='césar' WHERE nombre='César';

SELECT dni, nombre FROM cliente;

SELECT direccion FROM cliente;

SELECT * FROM compra;

UPDATE cliente SET direccion='Granada' WHERE direccion='GRANADA';

SELECT dni, nombre FROM cliente WHERE direccion='Granada' ORDER BY nombre ASC;

SELECT nombre FROM cliente WHERE sexo='M';

SELECT dni, nombre FROM cliente WHERE NOT direccion='Granada';

SELECT * FROM cliente WHERE nombre='Lucía';

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
WHERE compra.cliente=cliente.dni AND compra.producto=producto.cod AND cliente.nombre='Lucía';

DROP TABLE trabajador CASCADE CONSTRAINTS;
DROP TABLE tienda CASCADE CONSTRAINTS;
DROP TABLE oferta CASCADE CONSTRAINTS;

INSERT INTO trabajador VALUES(18, 'Pedro', 'Encargado', 'Cajas', 1);
INSERT INTO trabajador VALUES(21, 'Elena', 'Encargado', 'Reposición', 1);
INSERT INTO trabajador VALUES(35, 'Manuel', 'Suplente', 'Reposición', 1);

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
WHERE dni=compra.cliente AND producto.cod=compra.producto AND producto.nombre='Bolígrafo azul'
ORDER BY fecha_nac ASC;

SELECT DISTINCT cliente.nombre
FROM cliente, producto, compra
WHERE dni=compra.cliente AND producto.cod=compra.producto AND precio IS NOT NULL;

SELECT cliente.nombre, ROUND(precio*cantidad*1.21, 2)
FROM cliente, producto, compra
WHERE compra.cliente=dni AND producto.cod=compra.producto AND direccion='Málaga';

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
AND cliente.nombre='Lucía';

SELECT AVG (cantidad) FROM compra, producto 
WHERE producto=cod AND nombre='Bolígrafo azul';

SELECT COUNT (DISTINCT cliente) FROM  compra, producto
WHERE producto=cod AND nombre='Lápiz negro';

SELECT MAX (precio) FROM cliente cli, compra c, producto p

SELECT AVG (cantidad) FROM compra, cliente WHERE dni=cliente and nombre='Luis'
SELECT MAX (metros), MIN (metros), CAST(AVG(metros 
SELECT AVG(precio) FROM producto;

SELECT producto.nombre COUNT (ofertas*) FROM ofertas, productos WHERE ofertas.producto=cod_prod GROUP BY productos.nombre
SELECT producto COUNT (cliente) FROM compra GROUP BY producto
SELECT dirección COUNT (dni) FROM cliente WHERE dirección 

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
insert into equipo values (8,'Los 4 fantásticos');
insert into equipo values (9,'Starforce');
insert into equipo values (10,'Shield');

insert into poderes values (1,'Telepatia');
insert into poderes values (2,'Campo de fuerza');
insert into poderes values (3,'Bolas de Fuego');
insert into poderes values (4,'Invisibilidad');
insert into poderes values (5,'Super Fuerza');
insert into poderes values (6,'Regeneración');
insert into poderes values (7,'Deforma Realidad');
insert into poderes values (8,'Sentido arácnido');
insert into poderes values (9,'Teletransportación');
insert into poderes values (10,'Inteligencia');

insert into superpersona values (1,'Logan Patch','Lobezno','Canadá',2,'heroe');
insert into superpersona values (2,'Peter Parker','Spider-man','Nueva York',1,'heroe');
insert into superpersona values (3,'Steve Rogers','Capitán América','Nueva York',1,'heroe');
insert into superpersona values (4,'Bruce Banner','Hulk','EEUU',1,'heroe');
insert into superpersona values (5,'Tony Stark','Ironman','Nueva York',1,'heroe');
insert into superpersona values (6,'Erik magnus','Magneto','Alemán',2,'villano');
insert into superpersona values (7,'Rocket Raccoon','Rocket','Halfworld',3,'heroe');
insert into superpersona values (8,'TChalla','Black Panther','Wakanda',6,'heroe');
insert into superpersona values (9,'El titán loco','Thanos','Planeta Titán',5,'villano');
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



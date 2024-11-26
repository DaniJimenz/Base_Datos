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
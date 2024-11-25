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
    direccion VARCHAR2(40) NOT FULL UNIQUE,
    telefono NUMBER(9,0),
    cod_depto VARCHAR2(20) NOT FULL UNIQUE,
    cod_centro VARCHAR(20) NOT FULL UNIQUE
);

CREATE TABLE Alumno 
(
    control VARCHAR2(50) PRIMARY KEY,
    nombre VARCHAR2(50),
    direccion VARCHAR2(40)NOT FULL UNIQUE,
    control_del VARCHAR(
);

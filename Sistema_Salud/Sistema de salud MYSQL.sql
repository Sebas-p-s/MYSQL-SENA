CREATE DATABASE Famisanar;

USE Famisanar;

/*Aqui estan las creación de tablas*/
CREATE TABLE login (
	idusers INT auto_increment NOT NULL PRIMARY KEY,
    document varchar (20) NOT NULL,
    document_number BIGINT NOT NULL,
    login_password varchar (16) NOT NULL
);

/* usare el termino available para las especializaciones disponibles :P. 
El time_date lo usare para especificar la fecha usare DATETIME su forma de escribir es xxxx-xx-xx 00:00:00*/
CREATE TABLE consult (
	idconsult INT NOT NULL auto_increment PRIMARY KEY,
	available varchar (30) NOT NULL,
    name_doctor varchar (70) NOT NULL,
    time_date DATETIME NOT NULL
);

/* Aqui tengo una tabla para las inscripciones a las citas medicas*/
CREATE TABLE register (
	idregister INT NOT NULL auto_increment PRIMARY KEY,
    user_register varchar (70) NOT NULL,
    name_doctor varchar(70) NOT NULL,
    time_date DATETIME NOT NULL
);

/*Aqui estan los inserts o insercion de datos*/
INSERT INTO login value (
	NULL,
    "Cedula de ciudadania",
    10304711289,
    "Torrebabel10."
);

INSERT INTO  consult value (
	NULL,
    "Fisioterapia",
    "Maria Antonieta Rosal Caseres",
    '2025-10-22 18:00:00'
);

INSERT INTO register value (
	NULL,
    "Carlo Magno Rodriguez",
    "Maria Antonieta Rosal Caseres",
    '2025-10-22 18:00:00' 
);

/*Aqui estan las consultas*/
SELECT * FROM login;
SELECT * FROM consult;
SELECT * FROM register;


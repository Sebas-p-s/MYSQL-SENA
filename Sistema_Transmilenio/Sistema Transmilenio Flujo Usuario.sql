CREATE DATABASE Transmilenio;

USE Transmilenio;
/*Me ire por el flujo del pasajero*/
/*Creamos la tabla buy que es la tabla de compra de la tarjeta transmilenio*/
/*El user_name sera para el usuario o comprador de la tarjeta.
 Tambien el id user es para las cedulas, number card es para el numero de la tarjeta.*/
CREATE TABLE buy(
	idbuy INT  NOT NULL auto_increment PRIMARY KEY,
    user_name varchar (70) NOT NULL,
    id_user BIGINT NOT NULL,
    number_card BIGINT NOT NULL
);

/*El money card es para guardar el dato del dinero que esta en la tarjeta transmilenio*/
CREATE TABLE recharge(
	idrecharge INT NOT NULL auto_increment PRIMARY KEY,
	number_card BIGINT NOT NULL,
    recharge_vaLue INT NOT NULL,
    money_card INT NOT NULL,
    date_hour DATETIME NOT NULL
);

CREATE TABLE pay_bus(
	idpaybus INT NOT NULL auto_increment PRIMARY KEY,
	number_card BIGINT NOT NULL,
    value_paid INT NOT NULL,
    money_card INT NOT NULL,
    date_hour DATETIME NOT NULL
);

INSERT INTO buy value(
	NULL,
    "Juan Sebastian Hernadez Noboa",
    1038981035,
    1000940038
);

INSERT INTO recharge value(
	NULL,
    1000940038,
    15000,
    15000,
    '2025-10-22 13:00:00'
);

INSERT INTO pay_bus value(
	NULL,
    1000940038,
    3200,
    11800,
    '2025-10-22 14:00:00'
);

SELECT * FROM buy;
SELECT * FROM recharge;
SELECT * FROM pay_bus;
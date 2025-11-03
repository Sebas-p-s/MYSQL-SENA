 CREATE DATABASE TiendaTech;
 USE TiendaTech;
 
 /*Creamos la tabla productos*/
 CREATE TABLE Productos (
	 id_producto INT PRIMARY KEY AUTO_INCREMENT,
	 nombre_producto VARCHAR(100) NOT NULL,
	 categoria VARCHAR(50),
	 precio DECIMAL(10,2) NOT NULL,
	 stock INT DEFAULT 0,
	 fecha_ingreso DATE
 );
 
 /*Creamos la tabla clientes*/
 CREATE TABLE Clientes (
	 id_cliente INT PRIMARY KEY AUTO_INCREMENT,
	 nombre_cliente VARCHAR(100) NOT NULL,
	 ciudad VARCHAR(50),
	 correo VARCHAR(100),
	 fecha_registro DATE
 );
 
 /*Creamos la tabla ventas*/
 CREATE TABLE Ventas (
	 id_venta INT PRIMARY KEY AUTO_INCREMENT,
	 id_producto INT NOT NULL,
	 id_cliente INT NOT NULL,
	 cantidad INT NOT NULL,
	 valor_total DECIMAL(10,2),
	 fecha_venta DATE
 );
 
 /*En la tabla productos insertamos un computador con sus datos*/
 INSERT INTO Productos values (
	NULL,
    "Computador Samsung 2025",
    "Computador",
    1000,
    15,
    '2025-10-30'
 );
 
 /*Ahora en tabla productos insertamos un celular*/
 INSERT INTO Productos values (
	NULL,
    "Galaxy A31",
    "Celular",
    100,
    30,
    '2025-10-28'
 );
 
 /*En la tabla clientes insertamos un cliente*/
 INSERT INTO Clientes values (
	Null,
    "Juan Carlos Hernandez",
    "Bogota",
    "Carlos1@gmail.com",
    '2025-10-30'
 );
 
 /*En la tabla ventas insertamos una venta hecha del cliente con id 1*/
INSERT INTO Ventas values (
	NULL,
    1,
    1,
	3,
    30,
    '2025-11-15'
);

/*Aqui insertamos otro cliente en la tabla clientes*/
INSERT INTO CLientes values (
	NULL,
    "Sandra Paola Gimenez",
    "Medellin",
    "San2025@gmail.com",
    '2025-03-25'
);

/*En la tabla clientes volvemos otra vez a inserta otro cliente*/
INSERT INTO Clientes values (
	NULL,
    "Juan Carlos Martinez",
    "Boyaca",
    "hernadezca@gmail.com",
    '2025-04-10'
);

INSERT INTO Ventas values (
	NULL,
    2,
    2,
    3,
    300,
    '2025-05-26'
);

select * from Productos; /*Aqui muestro los productos disponibles*/
select * from ventas;
select * from Clientes
where month (fecha_registro) = 3 and year (fecha_registro) = 2025; /*Aqui hacemos que la busqueda sea nomas en tabla clientes y registrados en mayo*/

select * from Clientes
where month (fecha_registro) = 4 and year (fecha_registro) = 2025; /*Aqui hacemos que busque en abril de 2025*/

select sum(stock) as total_invetario
from Productos; /*Suma total del stock que tenemos*/

create view Resumen_ventas as
select 
	v.id_producto,
	p.nombre_producto,
	v.id_cliente,
	c.nombre_cliente, /*Aqui repasando es alias.nombre_variable de alguna tabla*/
	v.cantidad,
	v.valor_total,
	v.fecha_venta 
from productos p, clientes c,  ventas v /*Aqui le decimos que cada alias corresponda al tabla que le dijimos*/
where v.id_cliente = c.id_cliente /*Aqui le decimos que una variable es igual a otra variable*/
and v.id_producto = p.id_producto; /*Aqui cree mi vista para ver el resumen de las ventas*/

select * from resumen_ventas; /*Aqui cree un select para que me muestre esa busqueda con el orden que especifique*/

select 
	fecha_venta, /*Le decimos que use esa variable*/
    sum(valor_total) as ingreso_diario /*Que sume ese valor total y que sea como ingreso diario*/
from ventas /*Seleccionamos la tabla a usar*/
group by fecha_venta /*Las agrupa cuando tengan la misma fecha*/
order by fecha_venta; /*Aqui le decimos como debe ordenar para ver cuanto se vendio cada dia*/

create view ver_compra_cliente as /*Creo la vista*/
select
    c.nombre_cliente,
    p.nombre_producto, /*Les doy el alias y que seleccione*/
    v.cantidad,
    v.valor_total,
    v.fecha_venta
FROM Ventas v, Clientes c, Productos p /*Le digo cual es el alias de cada tabla*/
WHERE v.id_cliente = c.id_cliente /*Le digo que id son iguales en cada tabla*/
AND v.id_producto = p.id_producto
AND c.nombre_cliente = 'Sandra Paola Gimenez'; /*Aqui le decimos que el nombre del cliente de la tabla clientes debe ser igual a este*/

select * from ver_compra_cliente; /*Aqui le digo que me muestre esa view*/

drop view if exists ver_compra_cliente; /*Aqui le digo que la borre para si queremos cambiar el nombre no nos de error*/








 
 

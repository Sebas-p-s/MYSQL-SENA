CREATE DATABASE Carnes_Don_Rafa;
USE Carnes_Don_Rafa;

# Creamos la tabla de los proveedores
CREATE TABLE proveedores (
	id_proveedor INT PRIMARY KEY,
    nombre VARCHAR(80),
    ciudad VARCHAR(50),
    telefono VARCHAR(20)
);

# Insertamos algunos valores a la tabla proveedores
INSERT INTO proveedores VALUES
(1,'Ganadería La Esperanza','Medellín','3102222222'),
(2,'Ranchos del Norte','Montería','3153333333'),
(3,'Mega Vaca S.A','Sincelejo','3114444444'),
(4,'Cárnicos del Valle','Cali','3125555555'),
(5,'Ganaderos Unidos','Villavicencio','3109999999'),
(6,'Grupo Bovino','Pereira','3108888888'),
(7,'La Mejor Res','Bucaramanga','3111234567'),
(8,'AgroCarne','Medellín','3169876543'),
(9,'Santa María Ganadera','Armenia','3151919191'),
(10,'Zona Ganadera','Ibagué','3172020202');

# Creamos la tabla de compras de ganado
CREATE TABLE compras_ganado (
	id_compra INT PRIMARY KEY,
	id_proveedor INT,
    cantidad_cabezas INT,
    precio_total DECIMAL(10,2),
    fecha DATE,
    FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor)
);

# Insertamos algunos valores en la tabla de compras de ganado
INSERT INTO compras_ganado VALUES
(1,1,20,40000000,'2025-01-02'),
(2,2,15,31000000,'2025-01-10'),
(3,3,22,45000000,'2025-02-12'),
(4,4,18,37000000,'2025-02-22'),
(5,5,25,52000000,'2025-03-01'),
(6,6,12,25000000,'2025-03-11'),
(7,7,30,61000000,'2025-03-21'),
(8,8,10,20000000,'2025-03-28'),
(9,9,14,29000000,'2025-04-01'),
(10,10,16,31000000,'2025-04-05');

# Creamos la tabla plantas
CREATE TABLE plantas (
	id_planta INT PRIMARY KEY,
    nombre VARCHAR(80),
    ciudad VARCHAR(50),
    capacidad_toneladas INT
);

# Insertamos algunos valores en la tabla plantas
INSERT INTO plantas VALUES
(1,'Planta Norte','Medellín',400),
(2,'Planta Central','Bogotá',600),
(3,'Planta Valle','Cali',350),
(4,'Planta Llanos','Villavicencio',500),
(5,'Planta Costa','Barranquilla',450),
(6,'Planta Sol','Montería',300),
(7,'Planta Andes','Pereira',380),
(8,'Planta Dorada','Manizales',420),
(9,'Planta Río','Ibagué',390),
(10,'Planta Solinca','Neiva',360);

# Creamos la tabla empleados
CREATE TABLE empleados (
	id_empleado INT PRIMARY KEY,
    nombre VARCHAR(80),
    cargo VARCHAR(60),
    salario DECIMAL(10,2),
    id_planta INT,
    FOREIGN KEY (id_planta) REFERENCES plantas(id_planta)
);

# Insertamos algunos datos en la tabla empleados
INSERT INTO empleados VALUES
(1,'Carlos Pérez','Operario',1800000,1),
(2,'María Ruiz','Supervisora',2500000,1),
(3,'Jorge Medina','Calidad',2200000,2),
(4,'Laura Díaz','Operaria',1700000,2),
(5,'José Zapata','Administrador',3000000,3),
(6,'Ana Gómez','Operaria',1600000,4),
(7,'Mario López','Calidad',2100000,4),
(8,'Lucía Fernández','Supervisora',2600000,5),
(9,'José Rivera','Operario',1650000,6),
(10,'Natalia Acosta','Operaria',1750000,7);

# Creamos la tabla productos
CREATE TABLE productos (
	id_producto INT PRIMARY KEY,
    nombre VARCHAR(80),
    tipo VARCHAR(50),
    precio_kg DECIMAL(10,2)
);

# Insertamos algunos valores en la tabla productos
INSERT INTO productos VALUES
(1,'Carne de res premium','Carne fresca',20000),
(2,'Chorizo tradicional','Embutido',16000),
(3,'Salchichón ranchero','Embutido',15000),
(4,'Carne molida especial','Carne fresca',18000),
(5,'Morcilla criolla','Embutido',12000),
(6,'Lomo fino','Carne fresca',25000),
(7,'Costilla parrillera','Carne fresca',22000),
(8,'Jamón cocido','Procesado',19000),
(9,'Salchicha económica','Procesado',10000),
(10,'Pepperoni','Embutido',24000);

# Creamos la tabla inventario
CREATE TABLE inventario ( 
	id_inventario INT PRIMARY KEY,
    id_producto INT,
    cantidad_kg INT,
    fecha DATE,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

# Insertamos algunos valores en la tabla inventario
INSERT INTO inventario VALUES
(1,1,2000,'2025-01-05'),
(2,2,1500,'2025-01-10'),
(3,3,1400,'2025-01-20'),
(4,4,1000,'2025-01-30'),
(5,5,900,'2025-02-05'),
(6,6,700,'2025-02-15'),
(7,7,850,'2025-02-25'),
(8,8,1200,'2025-03-05'),
(9,9,1600,'2025-03-15'),
(10,10,600,'2025-03-22');

# Creamos la tabla de clientes
CREATE TABLE clientes (
	id_cliente INT PRIMARY KEY,
    nombre VARCHAR(80),
    ciudad VARCHAR(50),
    estado VARCHAR(50)
);

# Introducimos algunos valores en la tabla clientes
INSERT INTO clientes VALUES
(1,'Carnes Sabaneta','Medellín','Activo'),
(2,'Supermercado Olimpo','Cali','Activo'),
(3,'Carnicería el Rey','Bogotá','Activo'),
(4,'Charcutería San Luis','Medellín','Suspendido'),
(5,'Distribuidora La 14','Cali','Activo'),
(6,'La Hojita','Bucaramanga','Activo'),
(7,'Carnes Don Chucho','Manizales','Activo'),
(8,'Supermarket Caribe','Barranquilla','Activo'),
(9,'Granero Central','Ibagué','Suspendido'),
(10,'Mercar Fácil','Pereira','Activo');

# Creamos la tabla ventas
CREATE TABLE ventas (
	id_venta INT PRIMARY KEY,
    id_cliente INT,
    fecha DATE,
    total DECIMAL(10,2),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

# Insertamos algunos datos en la tabla ventas
INSERT INTO ventas VALUES
(1,1,'2025-01-05',5000000),
(2,2,'2025-01-10',4200000),
(3,3,'2025-01-15',3800000),
(4,4,'2025-01-20',2100000),
(5,5,'2025-02-01',6000000),
(6,6,'2025-02-10',3200000),
(7,7,'2025-02-15',2900000),
(8,8,'2025-03-01',6500000),
(9,9,'2025-03-10',1800000),
(10,10,'2025-03-18',4100000);

# Creamos la tabla detalle ventas
CREATE TABLE detalle_ventas (
	id_detalle INT PRIMARY KEY,
    id_venta INT,
    id_producto INT,
    cantidad_kg INT,
    FOREIGN KEY (id_venta) REFERENCES ventas(id_venta),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

# Insertamos algunos datos en la tabla detalle ventas
INSERT INTO detalle_ventas VALUES
(1,1,1,80),
(2,2,2,60),
(3,3,6,40),
(4,4,9,50),
(5,5,3,120),
(6,6,4,70),
(7,7,5,90),
(8,8,7,100),
(9,9,8,60),
(10,10,6,65);

# Creamos la tabla areas
CREATE TABLE areas (
	id_area INT PRIMARY KEY,
    nombre VARCHAR(80),
    responsable VARCHAR(80)
);

# Insertamos algunos valores en tabla areas
INSERT INTO areas VALUES
(1,'Corte','Carlos Pérez'),
(2,'Producción','María Ruiz'),
(3,'Empaque','Jorge Medina'),
(4,'Despacho','Laura Díaz'),
(5,'Calidad','José Zapata'),
(6,'Aseguramiento','Ana Gómez'),
(7,'Planeación','Mario López'),
(8,'Compras','Lucía Fernández'),
(9,'Ventas','José Rivera'),
(10,'Logística','Natalia Acosta');

# Aqui creamos una seleccion para ver unicamente de la tabla productos productos cuyo precio kg supere el valor promedio
SELECT nombre, precio_kg /*Seleccionamos los valores nombre y precio del kg*/
FROM productos /*Aqui le decimos que esos valores sean de la tabla productos*/
WHERE precio_kg > (SELECT AVG (precio_kg) FROM productos);/*Le decimos que la condicion sea que el precio del kg se superior al promedio */

# Creamos una seleccion para ver los clientes que tengan ventas mayores al promedio
SELECT nombre /*Seleccionamos el valor nombre*/
FROM clientes /*Seleccionamos de la tabla clientes*/
WHERE id_cliente IN (
	SELECT id_cliente FROM ventas
	WHERE total > (SELECT AVG(total) FROM ventas) /* Le decimos que de de id cliente de la tabla ventas deben ser nomas de los que superan las ventas promedio*/
);

# Creamos una seleccion que muestre productos vendidos por encima del promedio de ventas en kg
SELECT nombre /*Seleccionamos el valor nombre*/
FROM productos /*Seleccionamos de la tabla productos*/
WHERE id_producto IN (
	SELECT id_producto
    FROM detalle_ventas
    where cantidad_kg > (SELECT AVG (cantidad_kg) FROM detalle_ventas  /* Le decimos que de de id producto de la tabla detalle ventas deben ser nomas de los que superan cantidad de kg*/
    )
);

# Creamos una columna para email en tabla proveedores
ALTER TABLE proveedores
ADD email VARCHAR(100);

# Modificamos el tamaño de cuantos caracteres soporta la columna cargo
ALTER TABLE empleados
MODIFY cargo VARCHAR(100);

# Le decimos que aumente un 5% el salario de los empleados con el cargo operario
UPDATE empleados
SET salario = salario * 1.05
WHERE cargo = 'Operario';


# Borramos de la tabla clientes los que tengan estado suspendido
DELETE FROM detalle_ventas
WHERE id_venta IN (
    SELECT id_venta
    FROM ventas
    WHERE id_cliente IN (
        SELECT id_cliente 
        FROM clientes
        WHERE estado = 'Suspendido'
    )
);
/*Todo lo anterior fue para que no diera error por tenerlo en una tabla su relacion*/
 DELETE FROM ventas
WHERE id_cliente IN (
    SELECT id_cliente
    FROM clientes
    WHERE estado = 'Suspendido'
);
/*Todo lo anterior fue para que no diera error por tenerlo en una tabla su relacion*/
DELETE FROM clientes
WHERE estado = 'Suspendido';

# Creamos una transaccion
START TRANSACTION; /*Sirve para que debajo de esa linea haga todo eso en conjunto*/
UPDATE inventario
SET cantidad_kg = cantidad_kg - 100
WHERE id_producto = 1; /*Quitamos del producto con id 1 una cantidad de kg de 100*/
INSERT INTO ventas VALUES (11,3,'2025-04-01',3000000); /*Insertamos una nueva venta*/
COMMIT; /*Le confirmamos que lo haga*/

# Creamos una seguridad en la tabla
CREATE USER 'aprendiz'@'localhost' IDENTIFIED BY '12345'; /*Creamos un usuario aprendiz que solo puede entrar desde la pc local y le damos una contrase 12345*/
GRANT SELECT, INSERT ON carnes_don_rafa.* TO 'aprendiz'@'localhost'; 
/*Le decimos que puede seleccionar y insertar en la base de datos c_don_rafa y le decimos que esos permisos se asignen a usuario aprendiz*/





















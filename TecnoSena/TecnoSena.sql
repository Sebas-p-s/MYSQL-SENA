CREATE DATABASE TECNOSENA;
USE TECNOSENA;

# Se crea la tabla clientes
CREATE TABLE clientes(
	id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    ciudad VARCHAR(50),
    correo VARCHAR(100) UNIQUE,
    telefono VARCHAR(20) 
);

# Se crea la tabla productos
CREATE TABLE productos(
	id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    categoria VARCHAR(50),
    precio DECIMAL(10, 2),
    stock  INT
);

#Se crea la tabla tecnicos
CREATE TABLE tecnicos(
	id_tecnico INT AUTO_INCREMENT PRIMARY KEY,
    nombre_tecnico VARCHAR(100),
    especialidad VARCHAR(50),
    ciudad VARCHAR(50)
);

#Se crea la tabla ventas
CREATE TABLE ventas(
	id_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_producto INT,
    id_tecnico INT,
    fecha_venta DATE,
    cantidad INT,
    total DECIMAL(10,2),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
    FOREIGN KEY (id_tecnico) REFERENCES tecnicos(id_tecnico)
);

# Aqui haremos toda la insecion de datos de las tablas
INSERT INTO clientes(nombre,ciudad,correo,telefono) VALUES
('Ana Gómez', 'Medellín', 'ana.gomez@mail.com', '3014567890'),
('Carlos Ruiz', 'Bogotá', 'carlos.ruiz@mail.com', '3129876543'),
('Luisa Torres', 'Cali', 'luisa.torres@mail.com', '3201122334'),
('Juan Pérez', 'Barranquilla', 'juan.perez@mail.com', '3009988776');

INSERT INTO productos(nombre_producto,categoria,precio,stock) VALUES
('Laptop Lenovo', 'Computadores', 3200000, 8),
('Mouse Logitech', 'Periféricos', 80000, 50),
('Teclado Redragon', 'Periféricos', 150000, 30),
('Monitor Samsung 24"', 'Pantallas', 850000, 12),
('Disco Duro SSD 1TB', 'Almacenamiento', 420000, 20);

INSERT INTO tecnicos(nombre_tecnico,especialidad,ciudad) VALUES
('Mario López', 'Redes', 'Medellín'),
('Sandra Vélez', 'Soporte', 'Bogotá'),
('Héctor Ramírez', 'Hardware', 'Cali'),
('Diana Ortiz', 'Software', 'Barranquilla');

INSERT INTO ventas(id_cliente,id_producto,id_tecnico,fecha_venta,cantidad, total) VALUES
(1, 1, 2, '2025-11-01', 1, 3200000),
(2, 2, 1, '2025-11-02', 3, 240000),
(3, 4, 3, '2025-11-03', 1, 850000),
(4, 5, 4, '2025-11-04', 2, 840000),
(1, 3, 1, '2025-11-05', 2, 300000);


#Actividad: Insertamos el cliente Pedro Morales de cartagena
INSERT INTO clientes value(
	NULL,
    "Pedro Morales",
    "Cartagena",
    "pedrom@gmail.com",
    "32012934021"
);


#Actividad: Actualizamos el correo de Luisa Torres por luisa.t@mail.com
UPDATE clientes SET correo = "luisa.t@mail.com" WHERE id_cliente = 3;

#Actividad: Eliminamos el mouselogitech
DELETE FROM ventas WHERE id_producto = 2;
DELETE FROM productos WHERE id_producto = 2;

#Actividad: Aumentamos stock en 10 a todos los productos
UPDATE productos SET stock= stock + 10;

#Actividad: Cambiamos la especialidad de Hector Ramirez por tecnico
UPDATE tecnicos SET especialidad = "Mantenimiento" WHERE id_tecnico = 3;

#Actividad: Creamos la columna descuentos en la tabla ventas
ALTER TABLE ventas 
ADD descuento DECIMAL(5,2);

#Actividad: Creamos la tabla proovedores
CREATE TABLE proveedores(
	id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre_proovedor VARCHAR(100),
    contacto VARCHAR(20),
    ciudad VARCHAR(50)
);

#Actividad: Borramos completamente la tabla proveedores
DROP TABLE proveedores;

#Actividad: Limpiamos toda la tabla ventas sin que se borre la tabla como con el drop
TRUNCATE TABLE ventas;



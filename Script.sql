CREATE SCHEMA Libreria;
USE Libreria;

CREATE TABLE Sucursales (
id_sucur INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
dire VARCHAR(30) NOT NULL
);

CREATE TABLE Empleados (
id_emp INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
legajo INT NOT NULL,
nombre VARCHAR(30) NOT NULL,
dni INT NOT NULL,
id_sucur INT NOT NULL,
FOREIGN KEY (id_sucur) REFERENCES Sucursales(id_sucur)
);

CREATE TABLE Autores (
id_autor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL
);

CREATE TABLE editoriales (
id_edit INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
email VARCHAR(30) NOT NULL,
telefono INT
);

CREATE TABLE libros (
id_libro INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
genero VARCHAR(30) NOT NULL,
edicion VARCHAR(100),
id_autor INT NOT NULL,
id_edit INT NOT NULL,
FOREIGN KEY (id_autor) REFERENCES autores(id_autor),
FOREIGN KEY (id_edit) REFERENCES editoriales(id_edit) 
);

CREATE TABLE stock (
id_sucur INT NOT NULL,
id_libro INT NOT NULL,
unidad INT,
precio INT, 
FOREIGN KEY (id_sucur) REFERENCES sucursales(id_sucur),
FOREIGN KEY (id_libro) REFERENCES libros(id_libro)
);

CREATE TABLE clientes (
id_cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
dni INT NOT NULL,
direccion VARCHAR(50),
cd INT 
);

CREATE TABLE ventas (
id_venta INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
id_cliente INT NOT NULL,
id_emp INT NOT NULL,
fecha DATETIME NOT NULL,
pago VARCHAR(30),
total INT NOT NULL,
FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
FOREIGN KEY (id_emp) REFERENCES empleados(id_emp)
);

CREATE TABLE Item_venta (
id_item INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
id_venta INT NOT NULL,
id_libro INT NOT NULL,
unidades INT NOT NULL,
precio_unid INT NOT NULL,
precio_total INT NOT NULL,
FOREIGN KEY (id_venta) REFERENCES ventas (id_venta),
FOREIGN KEY (id_libro) REFERENCES libros(id_libro)
);

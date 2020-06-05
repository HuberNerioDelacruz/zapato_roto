/*Creacion de la base de datos y su estructura*/
CREATE DATABASE IF NOT EXISTS zapato_roto;

USE zapato_roto;

/*Tabla Identificacion*/
CREATE TABLE identificacion
(
  tipo_identificacion TINYINT PRIMARY KEY AUTO_INCREMENT,
  descripcion VARCHAR(21) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Tabla Clientes*/
CREATE TABLE clientes
(
  numero_identificacion VARCHAR(11) PRIMARY KEY,
  tipo_identificacion TINYINT NOT NULL,
  nombre VARCHAR(80) NOT NULL,
  pais VARCHAR(30) NOT NULL,
  FOREIGN KEY (tipo_identificacion) REFERENCES identificacion(tipo_identificacion) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Tabla Productos*/
CREATE TABLE productos
(
  id_producto CHAR(4) PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  talla TINYINT UNSIGNED NOT NULL,
  precio DECIMAL(5,1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Tabla Facturacion*/
CREATE TABLE facturacion
(
  id_facturacion INT UNSIGNED PRIMARY KEY,
  numero_identificacion VARCHAR(12) NOT NULL,
  impuesto DECIMAL(3,2) NOT NULL,
  descuento DECIMAL(3,2) DEFAULT 0,
  fecha DATE NOT NULL,
  total_a_pagar DECIMAL(8,2) NOT NULL,
  FOREIGN KEY (numero_identificacion) REFERENCES clientes(numero_identificacion) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Tabla Detalles*/
CREATE TABLE detalles
(
  id_facturacion INT UNSIGNED NOT NULL,
  id_producto CHAR(4) NOT NULL,
  productos_comprados INT NOT NULL,
  FOREIGN KEY (id_producto) REFERENCES productos(id_producto) ON DELETE RESTRICT ON UPDATE CASCADE,
  FOREIGN KEY (id_facturacion) REFERENCES facturacion(id_facturacion) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Tabla Inventarios*/
CREATE TABLE inventarios
(
  id_inventario TINYINT PRIMARY KEY AUTO_INCREMENT,
  id_producto CHAR(5) NOT NULL,
  tipo_de_movimiento ENUM('Entrada', 'Salida') NOT NULL,
  fecha DATE NOT NULL,
  cantidad INT NOT NULL,
  FOREIGN KEY (id_producto) REFERENCES productos(id_producto) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
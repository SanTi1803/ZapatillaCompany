-- Creación de la tabla de Empleados
CREATE TABLE Empleados (
  idEmpleado INT PRIMARY KEY AUTO_INCREMENT,
  nombreEmpleado VARCHAR(50),
  apellidoEmpleado VARCHAR(50),
  direccionEmpleado VARCHAR(100),
  telefonoEmpleado VARCHAR(20),
  salarioEmpleado DECIMAL(10,2)
);

-- Creación de la tabla de Clientes
CREATE TABLE Clientes (
  idCliente INT PRIMARY KEY AUTO_INCREMENT,
  nombreCliente VARCHAR(50),
  apellidoCliente VARCHAR(50),
  direccionCliente VARCHAR(100),
  telefonoCliente VARCHAR(20),
  correoCliente VARCHAR(50)
);

-- Creación de la tabla de Pedidos
CREATE TABLE Pedidos (
  idPedido INT PRIMARY KEY AUTO_INCREMENT,
  idCliente INT,
  idEmpleado INT,
  fechaPedido DATE,
  fechaEntrega DATE,
  CONSTRAINT FK_Cliente_Pedido FOREIGN KEY (idCliente) REFERENCES Clientes(idCliente),
  CONSTRAINT FK_Empleado_Pedido FOREIGN KEY (idEmpleado) REFERENCES Empleados(idEmpleado)
);

-- Creación de la tabla de Mercadería
CREATE TABLE Mercaderia (
  idMercaderia INT PRIMARY KEY AUTO_INCREMENT,
  nombreMercaderia VARCHAR(50),
  tallaMercaderia VARCHAR(10),
  colorMercaderia VARCHAR(20),
  precioMercaderia DECIMAL(10,2),
  cantidadStock INT
);

CREATE TABLE detalle_pedidos (
    idDetallePedido INT NOT NULL AUTO_INCREMENT,
    idPedido INT NOT NULL,
    idMercaderia INT NOT NULL,
    cantidadPedidos INT NOT NULL,
    PRIMARY KEY (idDetallePedido),
    FOREIGN KEY (idPedido) REFERENCES pedidos(idPedido),
    FOREIGN KEY (idMercaderia) REFERENCES mercaderia(idMercaderia)
);
DROP TABLE IF EXISTS pedido_producto;
DROP TABLE IF EXISTS Stock;
DROP TABLE IF EXISTS Productos;
DROP TABLE IF EXISTS Factura;
DROP TABLE IF EXISTS Clientes;
DROP TABLE IF EXISTS Pedido;
DROP TABLE IF EXISTS Tipo_Cliente;
DROP TABLE IF EXISTS Proveedor;

CREATE TABLE Stock(
    id INT NOT NULL,
    producto_id INT NOT NULL
);

ALTER TABLE Stock ADD CONSTRAINT PK_Stock PRIMARY KEY (id);

CREATE TABLE Clientes(
    id INT NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    email VARCHAR(40) NOT NULL,
    direccion VARCHAR(50) NULL,
    telefono VARCHAR(20) NOT NULL,
    tipo_id INT NOT NULL
);

ALTER TABLE Clientes
ADD CONSTRAINT PK_Clientes PRIMARY KEY (id),
ADD CONSTRAINT UQ_Clientes_email UNIQUE (email),
ADD CONSTRAINT UQ_Clientes_telefono UNIQUE (telefono);

CREATE TABLE Proveedor(
    id INT NOT NULL,
    nombre VARCHAR(255) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    telefono VARCHAR(255) NOT NULL
);

ALTER TABLE Proveedor 
ADD CONSTRAINT PK_Proveedor PRIMARY KEY (id),
ADD CONSTRAINT UQ_Proveedor_telefono UNIQUE (telefono);

CREATE TABLE pedido_producto(
    id INT NOT NULL,
    pedido_id INT NOT NULL,
    producto_id INT NOT NULL
);

ALTER TABLE pedido_producto ADD CONSTRAINT PK_pedido_producto PRIMARY KEY (id);

CREATE TABLE Tipo_Cliente(
    id INT NOT NULL,
    Tipo VARCHAR(255) NOT NULL,
    Nivel_Acceso INT NOT NULL
);

ALTER TABLE Tipo_Cliente ADD CONSTRAINT PK_Tipo_Cliente PRIMARY KEY (id);

CREATE TABLE Pedido(
    id INT NOT NULL,
    fecha_pedido DATE NOT NULL,
    valor_pedido DOUBLE(8, 2) NOT NULL,
    detalle_pedido TEXT NOT NULL
);

ALTER TABLE Pedido ADD CONSTRAINT PK_Pedido PRIMARY KEY (id);

CREATE TABLE Factura(
    id INT NOT NULL,
    fecha_factura DATE NOT NULL,
    valor_factura DOUBLE(8, 2) NOT NULL,
    cliente_id INT NOT NULL,
    pedido_id INT NOT NULL
);

ALTER TABLE Factura ADD CONSTRAINT PK_Factura PRIMARY KEY (id);

CREATE TABLE Productos(
    id INT NOT NULL,
    nombre VARCHAR(255) NOT NULL,
    detalles VARCHAR(255) NOT NULL,
    precio DOUBLE(8, 2) NOT NULL,
    proveedor_id INT NOT NULL
);


ALTER TABLE Productos ADD CONSTRAINT PK_Factura PRIMARY KEY (id);


-- Foreign key

ALTER TABLE Clientes
ADD CONSTRAINT FK_Clientes_tipo_cliente FOREIGN KEY (tipo_id) REFERENCES Tipo_Cliente(id);

ALTER TABLE Factura 
ADD CONSTRAINT FK_Factura_Cliente FOREIGN KEY (cliente_id) REFERENCES Clientes(id),
ADD CONSTRAINT FK_Factura_Pedido FOREIGN KEY (pedido_id) REFERENCES Pedido(id);

ALTER TABLE pedido_producto
ADD CONSTRAINT FK_PP_Pedido FOREIGN KEY (pedido_id) REFERENCES Pedido(id),
ADD CONSTRAINT FK_PP_Producto FOREIGN KEY (producto_id) REFERENCES Productos(id);

ALTER TABLE Productos
ADD CONSTRAINT FK_Productos_Proveedor FOREIGN KEY (proveedor_id) REFERENCES Proveedor(id);

ALTER TABLE Stock ADD CONSTRAINT FK_Stock_Productos FOREIGN KEY (producto_id) REFERENCES Productos(id);


DROP TABLE IF EXISTS factura;
DROP TABLE IF EXISTS quejas;
DROP TABLE IF EXISTS cliente;
DROP TABLE IF EXISTS pedido_producto;
DROP TABLE IF EXISTS pedido;
DROP TABLE IF EXISTS inventario;
DROP TABLE IF EXISTS producto;
DROP TABLE IF EXISTS equipo;
DROP TABLE IF EXISTS empleado;
DROP TABLE IF EXISTS tipo_empleado;
DROP TABLE IF EXISTS tipo_cliente;


CREATE TABLE tipo_empleado(
    id INT NOT NULL,
    cargo VARCHAR(20) NOT NULL,
    acceso_nivel VARCHAR(20) NOT NULL
);

ALTER TABLE tipo_empleado ADD CONSTRAINT PK_Tipo_Empleado PRIMARY KEY (id);

CREATE TABLE empleado(
    id INT NOT NULL,
    tipo_emple_id INT NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    email VARCHAR(40) NOT NULL,
    telefono VARCHAR(30) NOT NULL
);

ALTER TABLE empleado 
ADD CONSTRAINT PK_empleado PRIMARY KEY (id),
ADD CONSTRAINT UQ_empleado_email UNIQUE (email),
ADD CONSTRAINT UQ_empleado_telefono UNIQUE (telefono);

CREATE TABLE quejas(
    id INT NOT NULL,
    cliente_id INT NOT NULL,
    asunto VARCHAR(30) NOT NULL,
    detalles TEXT NOT NULL
);

ALTER TABLE quejas ADD CONSTRAINT PK_quejas PRIMARY KEY (id);

CREATE TABLE cliente(
    id INT NOT NULL,
    tipo_id INT NOT NULL,
    nombre INT NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    direccion VARCHAR(30) NULL,
    telefono VARCHAR(30) NOT NULL,
    email VARCHAR(30) NOT NULL,
    equipo_id INT
);

ALTER TABLE cliente
ADD CONSTRAINT PK_cliente PRIMARY KEY (id),
ADD CONSTRAINT UQ_cliente_email UNIQUE (email),
ADD CONSTRAINT UQ_cliente_telefono UNIQUE (telefono);

CREATE TABLE pedido_producto(
    id INT NOT NULL,
    producto_id INT NOT NULL,
    pedido_id INT NOT NULL
);

ALTER TABLE pedido_producto ADD CONSTRAINT PK_pedido_producto PRIMARY KEY (id);

CREATE TABLE factura(
    id INT NOT NULL,
    pedido_id INT NOT NULL,
    cliente_id INT NOT NULL,
    fecha_factura DATE NOT NULL,
    valor_factura DOUBLE(8, 2) NOT NULL,
    detalles VARCHAR(255) NULL
);

ALTER TABLE factura ADD CONSTRAINT PK_factura PRIMARY KEY (id);

CREATE TABLE producto(
    id INT NOT NULL,
    nombre VARCHAR(255) NOT NULL,
    detalles_producto VARCHAR(255) NOT NULL,
    precio DOUBLE NOT NULL
);
ALTER TABLE producto
ADD CONSTRAINT PK_producto PRIMARY KEY (id),
ADD CONSTRAINT UQ_producto_nombre UNIQUE (nombre),
ADD CONSTRAINT UQ_producto_detalles UNIQUE (detalles_producto);

CREATE TABLE equipo(
    id INT NOT NULL,
    nombre VARCHAR(255) NOT NULL,
    numero_jugadores VARCHAR(255) NOT NULL
);

ALTER TABLE equipo ADD CONSTRAINT PK_equipo PRIMARY KEY (id);

CREATE TABLE tipo_cliente(
    id INT NOT NULL,
    tipo VARCHAR(255) NOT NULL,
    estado VARCHAR(255) NOT NULL
);

ALTER TABLE tipo_cliente 
ADD CONSTRAINT PK_tipo_cliente PRIMARY KEY (id),
ADD CONSTRAINT UQ_tipo UNIQUE (tipo);

CREATE TABLE pedido(
    id INT NOT NULL,
    fecha_pedido DATE NOT NULL,
    valor DOUBLE(8, 2) NOT NULL,
    detalles VARCHAR(255) NOT NULL
);

ALTER TABLE pedido
ADD CONSTRAINT PK_pedido PRIMARY KEY (id),
ADD CONSTRAINT UQ_detalles UNIQUE (detalles);

CREATE TABLE inventario(
    id INT NOT NULL,
    empleado_id INT NOT NULL,
    producto_id INT NOT NULL,
    fecha_inventario DATE NOT NULL
);

ALTER TABLE inventario ADD CONSTRAINT PK_inventario PRIMARY KEY (id);

/* Foreign keys */

ALTER TABLE cliente 
ADD CONSTRAINT FK_cliente_tipo_cliente FOREIGN KEY (tipo_id) REFERENCES tipo_cliente(id),
ADD CONSTRAINT FK_cliente_equipo FOREIGN KEY (equipo_id) REFERENCES equipo(id);

ALTER TABLE quejas ADD CONSTRAINT FK_quejas_cliente FOREIGN KEY (cliente_id) REFERENCES cliente(id);

ALTER TABLE factura
ADD CONSTRAINT FK_factura_pedido FOREIGN KEY (pedido_id) REFERENCES pedido(id),
ADD CONSTRAINT FK_factura_cliente FOREIGN KEY (cliente_id) REFERENCES cliente(id);

ALTER TABLE pedido_producto 
ADD CONSTRAINT FK_PedProd_pedido FOREIGN KEY (pedido_id) REFERENCES pedido(id),
ADD CONSTRAINT FK_PedProd_producto FOREIGN KEY (producto_id) REFERENCES producto(id);

ALTER TABLE empleado ADD CONSTRAINT FK_empleado_tipo_empleado FOREIGN KEY (tipo_emple_id) REFERENCES tipo_empleado(id);

ALTER TABLE inventario 
ADD CONSTRAINT FK_inventario_empleado FOREIGN KEY (empleado_id) REFERENCES empleado(id),
ADD CONSTRAINT FK_inventario_producto FOREIGN KEY (producto_id) REFERENCES producto(id);

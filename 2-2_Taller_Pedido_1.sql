CREATE TABLE `Producto` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` TEXT NOT NULL,
	`details` TEXT NOT NULL,
	`precio` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Cliente` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` TEXT NOT NULL,
	`direccion` TEXT NOT NULL,
	`telefono` TEXT NOT NULL,
	`email` TEXT NOT NULL,
	`tipo_id` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Pedido` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`fecha_pedido` DATE NOT NULL,
	`estado_pedido` TEXT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `producto_pedido` (
	`pedido_id` INT NOT NULL,
	`producto_id` INT NOT NULL,
	`estado_producto` TEXT NOT NULL
);

CREATE TABLE `factura` (
	`cliente_id` INT NOT NULL,
	`pedido_id` INT NOT NULL,
	`fecha_facturacion` DATE NOT NULL
);

CREATE TABLE `tipo_cliente` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`tipo` TEXT NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `Cliente` ADD CONSTRAINT `Cliente_fk0` FOREIGN KEY (`tipo_id`) REFERENCES `tipo_cliente`(`id`);

ALTER TABLE `producto_pedido` ADD CONSTRAINT `producto_pedido_fk0` FOREIGN KEY (`pedido_id`) REFERENCES `Pedido`(`id`);

ALTER TABLE `producto_pedido` ADD CONSTRAINT `producto_pedido_fk1` FOREIGN KEY (`producto_id`) REFERENCES `Producto`(`id`);

ALTER TABLE `factura` ADD CONSTRAINT `factura_fk0` FOREIGN KEY (`cliente_id`) REFERENCES `Cliente`(`id`);

ALTER TABLE `factura` ADD CONSTRAINT `factura_fk1` FOREIGN KEY (`pedido_id`) REFERENCES `Pedido`(`id`);








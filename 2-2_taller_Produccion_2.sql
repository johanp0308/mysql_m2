CREATE TABLE `producto_zapato` (
	`id` int NOT NULL AUTO_INCREMENT,
	`estilo_id` int NOT NULL,
	`tipo_id` int NOT NULL,
	`name` TEXT NOT NULL,
	`detalles` TEXT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `estilos` (
	`id` int NOT NULL AUTO_INCREMENT,
	`name` int NOT NULL,
	`detalles` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `tipo` (
	`id` int NOT NULL AUTO_INCREMENT,
	`talla` TEXT NOT NULL,
	`suela` TEXT NOT NULL,
	`tipo` TEXT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Producto` (
	`id` int NOT NULL AUTO_INCREMENT,
	`produc_za_id` int NOT NULL,
	`estado` TEXT NOT NULL,
	`fecha_estado` int NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `producto_zapato` ADD CONSTRAINT `producto_zapato_fk0` FOREIGN KEY (`estilo_id`) REFERENCES `estilos`(`id`);

ALTER TABLE `producto_zapato` ADD CONSTRAINT `producto_zapato_fk1` FOREIGN KEY (`tipo_id`) REFERENCES `tipo`(`id`);

ALTER TABLE `Producto` ADD CONSTRAINT `Producto_fk0` FOREIGN KEY (`produc_za_id`) REFERENCES `producto_zapato`(`id`);






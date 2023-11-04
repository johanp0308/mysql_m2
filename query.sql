CREATE TABLE Sure(
     id INT UNSIGNED NOT NULL,
     vehicle_id INT UNSIGNED NOT NULL,
     insurance_date DATE NOT NULL
);

ALTER TABLE Sure
ADD CONSTRAINT PK_Sure PRIMARY KEY (id),
ADD CONSTRAINT UQ_vehicle_id UNIQUE (vehicle_id);

CREATE TABLE Check_vehicule(
     id INT UNSIGNED NOT NULL,
     rent_id INT UNSIGNED NOT NULL,
     state VARCHAR(30) NOT NULL,
     details TEXT NOT NULL,
     date_check DATE NULL,
     check_type VARCHAR(30) NOT NULL
);

ALTER TABLE 
ADD CONSTRAINT Check_vehicule PK_Check PRIMARY KEY (id),
ADD CONSTRAINT UQ_rent_id UNIQUE (rent_id);


CREATE TABLE Model(
    id INT UNSIGNED NOT NULL,
    model TEXT NULL
);

ALTER TABLE Model
ADD CONSTRAINT PK_Model PRIMARY KEY (id),
ADD CONSTRAINT UQ_Model UNIQUE (model);

CREATE TABLE Client(
     id INT UNSIGNED NOT NULL,
     name VARCHAR(255) NOT NULL,
     lastname VARCHAR(255) NOT NULL,
     address VARCHAR(255) NOT NULL,
     email VARCHAR(255) NOT NULL
);

ALTER TABLE Client
ADD CONSTRAINT PK_Client PRIMARY KEY (id),
ADD CONSTRAINT UQ_email_client UNIQUE (email);

CREATE TABLE Vehicle (
     id INT UNSIGNED NOT NULL,
     car_type_id INT UNSIGNED NOT NULL,
     day_price DECIMAL(8, 2) NOT NULL,
     minimum_days INT UNSIGNED NOT NULL,
     description TEXT NOT NULL
);

ALTER TABLE Vehicle ADD CONSTRAINT PK_Vehicle PRIMARY KEY (id);

CREATE TABLE Rent(
     id INT UNSIGNED NOT NULL,
     client_id INT UNSIGNED NOT NULL,
     vehicle_id INT UNSIGNED NOT NULL,
     delivery_date DATE NOT NULL,
     return_date DATE NOT NULL
);

ALTER TABLE ADD CONSTRAINT PK_Rent PRIMARY KEY (id); 

CREATE TABLE Invoice(
     id INT UNSIGNED NOT NULL,
     order_id INT UNSIGNED NULL,
     id_type INT UNSIGNED NULL,
     total_value DECIMAL(8, 2) NULL,
     details TEXT NOT NULL
);

ALTER TABLE ADD CONSTRAINT PK_Invoice PRIMARY KEY (id);

CREATE TABLE Voucher(
     id INT UNSIGNED NOT NULL,
     client_id INT UNSIGNED NOT NULL,
     invoice_id INT UNSIGNED NOT NULL,
     invoice_fine_id INT UNSIGNED NULL,
     details TEXT NOT NULL,
     voucher_date DATE NOT NULL
);

CREATE TABLE Voucher
ADD CONSTRAINT Pk_Voucher PRIMARY KEY (id),
ADD CONSTRAINT UQ_invoice UNIQUE (invoice_id);

CREATE TABLE Brand(
    id INT UNSIGNED NOT NULL,
    brand TEXT NOT NULL
);

ALTER TABLE Brand
ADD CONSTRAINT PK_Brand PRIMARY KEY (id),
ADD CONSTRAINT UQ_Brand UNIQUE (brand);

CREATE TABLE Payment_Type(
     id INT UNSIGNED NOT NULL,
     payment_type TEXT NOT NULL
);

ALTER TABLE Payment_Type
ADD CONSTRAINT PK_Payment_Type PRIMARY KEY (id),
ADD CONSTRAINT UQ_payment_type UNIQUE (payment_type);

CREATE TABLE Car_type(
     id INT UNSIGNED NOT NULL,
     brand_id INT UNSIGNED NOT NULL,
     model_id INT UNSIGNED NOT NULL,
     cart_type VARCHAR(50) NOT NULL
);

ALTER TABLE Car_type ADD CONSTRAINT PK_Car_type PRIMARY KEY (id);

CREATE TABLE Phone (
     client_id INT UNSIGNED NOT NULL,
     phone VARCHAR(20) NOT NULL,
     phone_type VARCHAR(20) NOT NULL
);

ALTER TABLE Phone ADD CONSTRAINT PK_Phone PRIMARY KEY (phone);

CREATE TABLE Order(
     id INT UNSIGNED NOT NULL,
     rent_id INT UNSIGNED NOT NULL,
     days_payment_value DECIMAL(8, 2) NOT NULL,
     order_date DATE NOT NULL,
     loan_days INT UNSIGNED NOT NULL
);

ALTER TABLE Order 
ADD CONSTRAINT PK_Order PRIMARY KEY (id),
ADD CONSTRAINT UQ_Order_Rent UNIQUE (rent_id); 

-- Foreigns Keys
ALTER TABLE Order 
ADD CONSTRAINT FK_Order_Rent FOREIGN KEY (rent_id) REFERENCES Rent(id);

ALTER TABLE Phone ADD CONSTRAINT FK_Phone_Cliente FOREIGN KEY (client_id) REFERENCES Client(id);

ALTER TABLE Cart_type 
ADD CONSTRAINT FK_Car_type_model FOREIGN KEY (model_id) REFERENCES Model(id),
ADD CONSTRAINT FK_Car_type_Brand FOREIGN KEY (brand_id) REFERENCES Brand(id);

ALTER TABLE Voucher
ADD CONSTRAINT FK_Voucher_Invoice FOREIGN KEY (invoice_id) REFERENCES Invoice(id),
ADD CONSTRAINT FK_Voucher_Invoice_fine FOREIGN KEY (invoice_fine_id) REFERENCES Invoice(id);

ALTER TABLE Invoice ADD CONSTRAINT FK_Invoice_Payment_Type FOREIGN KEY (id_type) REFERENCES Payment_Type(id) 

ALTER TABLE Rent
ADD CONSTRAINT FK_Rent_Client FOREIGN KEY (client_id) REFERENCES Client(id),
ADD CONSTRAINT FK_Rent_Vehicle FOREIGN KEY (vehicle_id) REFERENCES Vehicle(id);

ALTER TABLE Vehicle ADD CONSTRAINT FK_Vehicle_car_type FOREIGN KEY (car_type_id) REFERENCES Car_type(id);

ALTER TABLE Check_vehicule ADD CONSTRAINT FK_Check_Rent FOREIGN KEY (rent_id) REFERENCES Rent(id);

ALTER TABLE Sure ADD CONSTRAINT FK_Sure_Vehicle FOREIGN KEY (vehicle_id) REFERENCES Vehicle(id);

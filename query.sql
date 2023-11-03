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



CREATE TABLE Rent(
     id INT UNSIGNED NOT NULL,
     client_id INT UNSIGNED NULL,
     vehicle_id INT UNSIGNED NULL,
     delivery_date DATE NULL,
     return_date DATE NULL
);

CREATE TABLE Invoice(
     id INT UNSIGNED NOT NULL,
     order_id INT UNSIGNED NULL,
     id_type INT UNSIGNED NULL,
     total_value DECIMAL(8, 2) NULL,
     details TEXT NOT NULL
);

CREATE TABLE Voucher(
     id INT UNSIGNED NOT NULL,
     client_id INT UNSIGNED NULL,
     invoice_id INT UNSIGNED NULL,
     invoice_fine_id INT UNSIGNED NOT NULL,
     details TEXT NOT NULL,
     voucher_date DATE NOT NULL
);

CREATE TABLE Flag(
     id INT UNSIGNED NOT NULL,
     TEXT NOT NULL flag
);

CREATE TABLE Payment_Type(
     id INT UNSIGNED NOT NULL,
     payment_type TEXT NOT NULL
);

CREATE TABLE Car_type(
     id INT UNSIGNED NOT NULL,
     brand_id INT UNSIGNED NOT NULL,
     mode_id INT UNSIGNED NOT NULL,
     cart_type VARCHAR(30) NULL
);

CREATE TABLE phone (
     client_id BIGINT UNSIGNED NOT NULL,
     phone TEXT NULL,
     phone_type TEXT NULL
);

CREATE TABLE Order(
     id INT UNSIGNED NOT NULL,
     rent_id INT UNSIGNED NOT NULL,
     days_payment_value DECIMAL(8, 2) NOT NULL,
     customer_name TEXT NULL,
     order_date DATE NOT NULL,
     loan_days INT UNSIGNED NOT NULL
);
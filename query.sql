
CREATE DATABASE IF NOT EXISTS 2_1_1_BaseDeDatosRelacionales;

USE 2_1_1_BaseDeDatosRelacionales;

DROP TABLE IF EXISTS Books;
CREATE TABLE Books(
    id INT,
    title VARCHAR(30) NOT NULL,
    isbn TEXT NOT NULL,
    year DATE NOT NULL,
    price DECIMAL(8, 2) NOT NULL,
    authorID INT NOT NULL,
    editorialID INT NOT NULL
);

ALTER TABLE Books ADD CONSTRAINT PK_Books PRIMARY KEY (id);
ALTER TABLE Books ADD CONSTRAINT UQ_Isbn UNIQUE (isbn);

DROP TABLE IF EXISTS cart_books;
CREATE TABLE cart_books(
    book_id INT NOT NULL,
    cart_id INT NOT NULL,
    amount INT NOT NULL
);

DROP TABLE IF EXISTS Editorials;
CREATE TABLE Editorials(
    id INT NOT NULL PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    phonenumber VARCHAR(30) NOT NULL,
    url TEXT NULL,
    address VARCHAR(30) NULL
);
-- Editorials
ALTER TABLE Editorials ADD CONSTRAINT PK_Editorials PRIMARY KEY (id);
ALTER TABLE Editorials ADD CONSTRAINT UQ_url UNIQUE (url);


DROP TABLE IF EXISTS Cart;
CREATE TABLE Cart(
    Shopping_cart_ID INT NOT NULL PRIMARY KEY,
    customer_id INT NULL
);

DROP TABLE IF EXISTS Stores;
CREATE TABLE Stores(
    id INT NOT NULL PRIMARY KEY,
    address VARCHAR(50) NULL,
    phonenumber VARCHAR(16) NULL
);
--------
--------
DROP TABLE IF EXISTS Customers;
CREATE TABLE Customers(
    id INT NOT NULL PRIMARY KEY,
    name VARCHAR(30) NULL,
    address VARCHAR(50) NULL,
    email VARCHAR(50) NULL,
    phonenumber VARCHAR(50) NULL,
    store_id INT NOT NULL
);

DROP TABLE IF EXISTS Authors;
CREATE TABLE Authors(
    id INT NOT NULL PRIMARY KEY,
    name VARCHAR(50) NULL,
    url TEXT NULL
);
------
------
DROP TABLE IF EXISTS Stock;
CREATE TABLE Stock(
    id INT NOT NULL PRIMARY KEY,
    books_id INT NULL,
    amount INT NULL,
    store_id INT NULL
);

--Foreing Keys (Books)
ALTER TABLE Books 
MODIFY authorID INT NOT NULL CONSTRAINT FK_Book_Author FOREIGN KEY (authorID) REFERENCES Authors(id),
MODIFY editorialID INT NOT NULL CONSTRAINT FK_Books_Editorials FOREIGN KEY (editorialID) REFERENCES Editorials(id);
---------------------

--Foreign Keys (cart_books)
ALTER TABLE cart_books 
MODIFY book_id INT NOT NULL CONSTRAINT FK_cartBook_Books FOREIGN KEY (book_id) REFERENCES Books(id),
MODIFY cart_id INT NOT NULL CONSTRAINT FK_cartBook_Cart FOREIGN KEY (cart_id) REFERENCES Cart(Shopping_cart_ID);
------------------------

--Foreign Key (Cart)
ALTER TABLE Cart
MODIFY customer_id INT NOT NULL CONSTRAINT FK_Cart_Customers FOREIGN KEY (customer_id) REFERENCES Customers(id);
-----------------

--- Foreign Key (Customers)
ALTER TABLE Customers 
MODIFY store_id INT NOT NULL CONSTRAINT FK_Customers_Stores FOREIGN KEY (store_id) REFERENCES Stores(id);

-- Foreign Key (Stock)
ALTER TABLE Stock 
MODIFY store_id INT NOT NULL CONSTRAINT FK_Stock_Stores FOREIGN KEY (store_id) REFERENCES Stores(id),
MODIFY books_id INT NOT NULL CONSTRAINT FK_Stock_Book FOREIGN KEY (books_id) REFERENCES Books(id)
-------
-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-10-16 10:07:04.111

-- tables
-- Table: BookSales
CREATE TABLE BookSales (
    SalesID int  NOT NULL,
    DateID int  NOT NULL,
    ClientID int  NOT NULL,
    CourierID int  NOT NULL,
    ProductID int  NOT NULL,
    Client_ClientID int  NOT NULL,
    Courier_CourierID int  NOT NULL,
    Product_ISBN char(13)  NOT NULL,
    Date_DateID int  NOT NULL,
    CONSTRAINT BookSales_pk PRIMARY KEY  (SalesID)
);

-- Table: Client
CREATE TABLE Client (
    ClientID int  NOT NULL,
    FirstName varchar(25)  NOT NULL,
    Surname varchar(25)  NOT NULL,
    Phone varchar(9)  NOT NULL,
    Address varchar(50)  NOT NULL,
    CONSTRAINT Client_pk PRIMARY KEY  (ClientID)
);

-- Table: Courier
CREATE TABLE Courier (
    CourierID int  NOT NULL,
    Name varchar(40)  NOT NULL,
    NIP char(10)  NOT NULL,
    Address varchar(60)  NOT NULL,
    CONSTRAINT Courier_pk PRIMARY KEY  (CourierID)
);

-- Table: Date
CREATE TABLE Date (
    DateID int  NOT NULL,
    Day char(2)  NOT NULL,
    Month char(2)  NOT NULL,
    Year char(4)  NOT NULL,
    CONSTRAINT Date_pk PRIMARY KEY  (DateID)
);

-- Table: Product
CREATE TABLE Product (
    ISBN char(13)  NOT NULL,
    Title varchar(40)  NOT NULL,
    Author varchar(40)  NOT NULL,
    Publisher varchar(40)  NOT NULL,
    Pages int  NOT NULL,
    CONSTRAINT Product_pk PRIMARY KEY  (ISBN)
);

-- foreign keys
-- Reference: BookSales_Carrier (table: BookSales)
ALTER TABLE BookSales ADD CONSTRAINT BookSales_Carrier
    FOREIGN KEY (Courier_CourierID)
    REFERENCES Courier (CourierID);

-- Reference: BookSales_Client (table: BookSales)
ALTER TABLE BookSales ADD CONSTRAINT BookSales_Client
    FOREIGN KEY (Client_ClientID)
    REFERENCES Client (ClientID);

-- Reference: BookSales_Date (table: BookSales)
ALTER TABLE BookSales ADD CONSTRAINT BookSales_Date
    FOREIGN KEY (Date_DateID)
    REFERENCES Date (DateID);

-- Reference: BookSales_Product (table: BookSales)
ALTER TABLE BookSales ADD CONSTRAINT BookSales_Product
    FOREIGN KEY (Product_ISBN)
    REFERENCES Product (ISBN);

-- sequences
-- Sequence: BookSales_seq
CREATE SEQUENCE BookSales_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: Client_seq
CREATE SEQUENCE Client_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: Courier_seq
CREATE SEQUENCE Courier_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: Date_seq
CREATE SEQUENCE Date_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- End of file.


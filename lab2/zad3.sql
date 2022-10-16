-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-10-16 10:21:37.252

-- tables
-- Table: Client
CREATE TABLE Client (
    ClientID int  NOT NULL,
    Name varchar(25)  NOT NULL,
    Address varchar(50)  NOT NULL,
    NIP char(10)  NOT NULL,
    CONSTRAINT Client_pk PRIMARY KEY  (ClientID)
);

-- Table: Date
CREATE TABLE Date (
    DateID int  NOT NULL,
    Day char(2)  NOT NULL,
    Month char(2)  NOT NULL,
    Year char(4)  NOT NULL,
    CONSTRAINT Date_pk PRIMARY KEY  (DateID)
);

-- Table: Fruite
CREATE TABLE Fruite (
    FruiteID int  NOT NULL,
    Name varchar(25)  NOT NULL,
    Price decimal(10,2)  NOT NULL,
    CONSTRAINT Fruite_pk PRIMARY KEY  (FruiteID)
);

-- Table: FruitesSales
CREATE TABLE FruitesSales (
    ID int  NOT NULL,
    ClientID int  NOT NULL,
    FruiteID int  NOT NULL,
    DateID int  NOT NULL,
    Quantity decimal(10,2)  NOT NULL,
    Amount decimal(10,2)  NOT NULL,
    Client_ClientID int  NOT NULL,
    Fruite_FruiteID int  NOT NULL,
    Date_DateID int  NOT NULL,
    CONSTRAINT FruitesSales_pk PRIMARY KEY  (ID)
);

-- foreign keys
-- Reference: FruitesSales_Client (table: FruitesSales)
ALTER TABLE FruitesSales ADD CONSTRAINT FruitesSales_Client
    FOREIGN KEY (Client_ClientID)
    REFERENCES Client (ClientID);

-- Reference: FruitesSales_Date (table: FruitesSales)
ALTER TABLE FruitesSales ADD CONSTRAINT FruitesSales_Date
    FOREIGN KEY (Date_DateID)
    REFERENCES Date (DateID);

-- Reference: FruitesSales_Fruite (table: FruitesSales)
ALTER TABLE FruitesSales ADD CONSTRAINT FruitesSales_Fruite
    FOREIGN KEY (Fruite_FruiteID)
    REFERENCES Fruite (FruiteID);

-- sequences
-- Sequence: Client_seq
CREATE SEQUENCE Client_seq
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

-- Sequence: Fruite_seq
CREATE SEQUENCE Fruite_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: FruitesSales_seq
CREATE SEQUENCE FruitesSales_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- End of file.


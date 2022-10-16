-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-10-16 10:47:44.939

-- tables
-- Table: Employee
CREATE TABLE Employee (
    EmployeeID int  NOT NULL,
    PESEL char(11)  NOT NULL,
    Address varchar(40)  NOT NULL,
    CONSTRAINT Employee_pk PRIMARY KEY  (EmployeeID)
);

-- Table: FactTable
CREATE TABLE FactTable (
    ID int  NOT NULL,
    EmplyeeID int  NOT NULL,
    Salary decimal(10,2)  NOT NULL,
    ReviewID int  NOT NULL,
    Employee_EmployeeID int  NOT NULL,
    Review_ReviewID int  NOT NULL,
    CONSTRAINT FactTable_pk PRIMARY KEY  (ID)
);

-- Table: Review
CREATE TABLE Review (
    ReviewID int  NOT NULL,
    Grade int  NOT NULL,
    "Current" bit  NOT NULL,
    CONSTRAINT Review_pk PRIMARY KEY  (ReviewID)
);

-- foreign keys
-- Reference: FactTable_Employee (table: FactTable)
ALTER TABLE FactTable ADD CONSTRAINT FactTable_Employee
    FOREIGN KEY (Employee_EmployeeID)
    REFERENCES Employee (EmployeeID);

-- Reference: FactTable_Review (table: FactTable)
ALTER TABLE FactTable ADD CONSTRAINT FactTable_Review
    FOREIGN KEY (Review_ReviewID)
    REFERENCES Review (ReviewID);

-- End of file.


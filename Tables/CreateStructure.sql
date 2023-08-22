CREATE TABLE dbo.SKU (
    ID INT IDENTITY PRIMARY KEY,
    Code AS 's' + CAST(ID AS VARCHAR(10)) PERSISTED,
    Name VARCHAR(255),
    UNIQUE (Code)
);

CREATE TABLE dbo.Family (
    ID INT IDENTITY PRIMARY KEY,
    SurName VARCHAR(255),
    BudgetValue DECIMAL(18, 2)
);

CREATE TABLE dbo.Basket (
    ID INT IDENTITY PRIMARY KEY,
    ID_SKU INT REFERENCES dbo.SKU(ID),
    ID_Family INT REFERENCES dbo.Family(ID),
    Quantity INT CHECK (Quantity >= 0),
    Value DECIMAL(18, 2) CHECK (Value >= 0),
    PurchaseDate DATETIME DEFAULT GETDATE(),
    DiscountValue DECIMAL(18, 2) DEFAULT 0
);
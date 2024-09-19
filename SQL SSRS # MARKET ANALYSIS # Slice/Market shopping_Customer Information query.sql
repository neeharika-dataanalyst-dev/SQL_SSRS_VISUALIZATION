-- Add columns to existing table

CREATE TABLE Market (
    CustomerID INT,
    CustomerName VARCHAR(50),
    CustomerEmail VARCHAR(100),
    CustomerLocation VARCHAR(50),
    ProductID INT,
    ProductName VARCHAR(50),
    ProductCategory VARCHAR(50),
    PurchaseDate DATETIME,
    CampaignName VARCHAR(50),
    Quantity INT,
    Price DECIMAL(10, 2),
    TotalAmount AS (Quantity * Price),
    PaymentMethod VARCHAR(50),
    OrderStatus VARCHAR(20)
);

INSERT INTO Marketing_Shopping_data(CustomerID, CustomerName, CustomerEmail, CustomerLocation, ProductID, ProductName, ProductCategory, PurchaseDate, CampaignName, Quantity, Price, PaymentMethod, OrderStatus)
VALUES
    (1, 'John Doe', 'john.doe@email.com', 'New York', 101, 'Smartphone', 'Electronics', '2024-09-01 10:30:00', 'Summer Sale', 2, 299.99, 'Credit Card', 'Delivered'),
    (2, 'Jane Smith', 'jane.smith@email.com', 'Los Angeles', 102, 'Laptop', 'Computers', '2024-09-02 12:45:00', 'Back to School', 1, 799.50, 'PayPal', 'Shipped'),
    (3, 'Alice Brown', 'alice.brown@email.com', 'Chicago', 103, 'Headphones', 'Accessories', '2024-09-03 15:20:00', 'Flash Deal', 3, 59.99, 'Debit Card', 'Delivered'),
    (4, 'Bob Green', 'bob.green@email.com', 'Houston', 104, 'Smartwatch', 'Wearables', '2024-09-04 17:10:00', 'Holiday Promo', 1, 199.99, 'Credit Card', 'Processing'),
    (5, 'Charlie White', 'charlie.white@email.com', 'Phoenix', 105, 'Tablet', 'Electronics', '2024-09-05 11:00:00', 'Cyber Monday', 1, 399.99, 'PayPal', 'Delivered'),
    (6, 'Emma Black', 'emma.black@email.com', 'San Antonio', 106, 'Bluetooth Speaker', 'Audio', '2024-09-06 14:30:00', 'New Year Sale', 4, 49.99, 'Credit Card', 'Delivered'),
    (7, 'James Blue', 'james.blue@email.com', 'San Diego', 107, 'Wireless Charger', 'Accessories', '2024-09-07 09:45:00', 'Summer Sale', 2, 29.99, 'Debit Card', 'Delivered'),
    (8, 'Olivia Gray', 'olivia.gray@email.com', 'Dallas', 108, 'Gaming Console', 'Gaming', '2024-09-08 16:55:00', 'Gaming Fest', 1, 499.99, 'Credit Card', 'Shipped'),
    (9, 'Liam Silver', 'liam.silver@email.com', 'San Jose', 109, 'Camera', 'Electronics', '2024-09-09 13:15:00', 'Holiday Promo', 1, 699.99, 'PayPal', 'Processing'),
    (10, 'Sophia Gold', 'sophia.gold@email.com', 'Austin', 110, 'Smart TV', 'Electronics', '2024-09-10 18:20:00', 'Super Saver Deal', 1, 999.99, 'Credit Card', 'Delivered')
-- Continue the pattern up to 100 records.
;

-- Select all records to verify
SELECT * FROM Marketing_Shopping_data;


CREATE TABLE Customer_Information (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    CustomerAge INT,
    CustomerGender VARCHAR(10),
    CustomerIncome DECIMAL(10, 2),
    CustomerLocation VARCHAR(50)
);

INSERT INTO Customer_Information(CustomerID, CustomerName, CustomerAge, CustomerGender, CustomerIncome, CustomerLocation)
VALUES
    (1, 'John Doe', 35, 'Male', 75000.00, 'New York'),
    (2, 'Jane Smith', 28, 'Female', 62000.00, 'Los Angeles'),
    (3, 'Alice Brown', 42, 'Female', 89000.00, 'Chicago'),
    (4, 'Bob Green', 30, 'Male', 68000.00, 'Houston'),
    (5, 'Charlie White', 25, 'Male', 45000.00, 'Phoenix'),
    (6, 'Emma Black', 38, 'Female', 92000.00, 'San Antonio'),
    (7, 'James Blue', 33, 'Male', 58000.00, 'San Diego'),
    (8, 'Olivia Gray', 29, 'Female', 72000.00, 'Dallas'),
    (9, 'Liam Silver', 45, 'Male', 105000.00, 'San Jose'),
    (10, 'Sophia Gold', 27, 'Female', 65000.00, 'Austin')
-- Add more rows following the same pattern to create up to 100 records if needed.
;

-- Select all records to verify
SELECT * FROM Customer_Inform;

SELECT 
    C.CustomerLocation,
    C.CustomerGender,
    CASE 
        WHEN C.CustomerIncome < 50000 THEN 'Low Income'
        WHEN C.CustomerIncome BETWEEN 50000 AND 100000 THEN 'Middle Income'
        ELSE 'High Income'
    END AS IncomeBracket,
    AVG(M.TotalAmount) AS AvgPurchaseAmount
FROM 
    Marketing_Shopping_data M
JOIN 
    Customer_Inform C ON M.CustomerID = C.CustomerID
GROUP BY 
    C.CustomerLocation, C.CustomerGender, 
    CASE 
        WHEN C.CustomerIncome < 50000 THEN 'Low Income'
        WHEN C.CustomerIncome BETWEEN 50000 AND 100000 THEN 'Middle Income'
        ELSE 'High Income'
    END;
CREATE TABLE Customer_Inform (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    CustomerAge INT,
    CustomerGender VARCHAR(10),
    CustomerIncome DECIMAL(10, 2),
    CustomerLocation VARCHAR(50),
    CustomerMobile VARCHAR(20),
    CustomerEmailOptIn BIT,
    CustomerJoinDate DATE,
    CustomerPreferredPayment VARCHAR(20),
    CustomerLoyaltyTier VARCHAR(10),
    CustomerReferralSource VARCHAR(50)
);



INSERT INTO Customer_Inform(CustomerID, CustomerName, CustomerAge, CustomerGender, CustomerIncome, CustomerLocation)
VALUES
    (1, 'John Doe', 35, 'Male', 75000.00, 'New York'),
    (2, 'Jane Smith', 28, 'Female', 62000.00, 'Los Angeles'),
    (3, 'Alice Brown', 42, 'Female', 89000.00, 'Chicago'),
    (4, 'Bob Green', 30, 'Male', 68000.00, 'Houston'),
    (5, 'Charlie White', 25, 'Male', 45000.00, 'Phoenix'),
    (6, 'Emma Black', 38, 'Female', 92000.00, 'San Antonio'),
    (7, 'James Blue', 33, 'Male', 58000.00, 'San Diego'),
    (8, 'Olivia Gray', 29, 'Female', 72000.00, 'Dallas'),
    (9, 'Liam Silver', 45, 'Male', 105000.00, 'San Jose'),
    (10, 'Sophia Gold', 27, 'Female', 65000.00, 'Austin')
-- Continue for more records.
;

-- Select all records to verify
SELECT * FROM Customer_Inform;



CREATE DATABASE projeto_bi;
USE projeto_bi;

CREATE TABLE customer_data (
	Customer_ID INT NOT NULL auto_increment primary key,
    Age INT,
    Is_Senior BOOL,
    Marital_Status VARCHAR(50),
    Credit_Score INT,
    Region VARCHAR(50)
);

CREATE TABLE policy_data (
	Policy_ID VARCHAR(10),
    Customer_ID INT,
    Married_Premium_Discount INT,
    Prior_Insurance VARCHAR(20),
    Prior_Insurance_Premium_Adjustment INT,
    Policy_Type VARCHAR(100),
    Policy_Adjustment INT,
    Premium_Amount INT,
    Total_Discounts INT,
    Time_Since_First_Contact INT,
    Conversion_Status BOOL,
    Website_Visits INT,
    Inquiries INT,
    Quotes_Requested INT,
    Time_To_Conversion INT,
    Premium_Adjustment_Credit INT,
    Premium_Adjustment_Region INT
);

CREATE TABLE claims_data (
	Claims_ID VARCHAR(10),
    Customer_ID INT,
    Claims_Frequency INT,
    Claims_Severity VARCHAR(50),
    Claims_Adjustment INT,
    Policy_Type VARCHAR(100),
    Safe_Driver_Discount BOOL,
    Total_Discounts INT,
    Conversion_Status BOOL,
    Time_to_Conversion INT
);

SELECT * FROM projeto_bi.claims_data;

ALTER TABLE customer_data
ADD CONSTRAINT PK_Customers PRIMARY KEY (Customer_ID);

ALTER TABLE policy_data
ADD CONSTRAINT PK_Policy PRIMARY KEY (Policy_ID);

ALTER TABLE claims_data
ADD CONSTRAINT PK_Claims PRIMARY KEY (Claims_ID);

ALTER TABLE policy_data
ADD CONSTRAINT FK_customerID
    FOREIGN KEY (Customer_ID) REFERENCES customer_data(Customer_ID);
    
ALTER TABLE claims_data
ADD CONSTRAINT FK_customerIDclaims
    FOREIGN KEY (Customer_ID) REFERENCES customer_data(Customer_ID);
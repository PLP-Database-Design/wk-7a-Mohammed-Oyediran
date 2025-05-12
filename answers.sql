-- Question 1: Write an SQL query to transform this table into 1NF, 
-- ensuring that each row represents a single product for an order


CREATE TABLE customerInfo (
    customerID int primary key,
    customerName varchar(50) not null
);


CREATE TABLE orderInfo (
	orderID int  primary key,
    customerID int not null,
    foreign key (customerID) references customerInfo (customerID)
    );

CREATE TABLE productInfo (
	orderID int not null,
    productName varchar(50),
    primary key (orderID, productName),
    foreign key (orderID) references orderInfo (orderID)
);


-- Question 2: Write an SQL query to transform this table into 2NF by removing partial dependencies. 
-- Ensure that each non-key column fully depends on the entire primary key.

CREATE TABLE customerInfo (
	customerID int primary key,
    customerName varchar(50) not null
);


CREATE TABLE orderInfo (
	orderID int  primary key,
    customerID int not null,
    foreign key (customerID) references customerInfo (customerID)
    );
    
CREATE TABLE productInfo (
	productID int primary key,
    productName varchar(50)
);

CREATE TABLE quantityOrdered (
	orderID int,
    productID int,
    quantity int not null,
    primary key (orderID, productID),
    foreign key (productID) references productInfo (productID),
    foreign key (orderID) references orderInfo(orderID)
);

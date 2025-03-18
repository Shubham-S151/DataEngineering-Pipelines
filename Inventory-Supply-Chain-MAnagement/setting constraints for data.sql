create database superstore;
use superstore;

-- drop database superstore;
show tables;
desc table brand_products;

# creating table brands
create table brands as (
Select distinct brand_id, brand_name from brand_products
);
alter table brands rename column brand_id to Brand_id;
alter table brands add constraint Brand_id primary key (Brand_id);
desc brands;

# altering categories table
alter table categories add constraint id primary key (id);
alter table categories rename column ID to Category_id;

# altering Products table
alter table products rename column ProductID to Product_id;
ALTER TABLE products MODIFY COLUMN Product_id VARCHAR(50) NOT NULL;
alter table products add constraint Product_id primary key (Product_id);
alter table products rename column categoryID to Category_id;
alter table products add constraint Category_id foreign key (Category_id) references categories(Category_id);
desc products;

# dropping brand name from the brand_products and altering the table
alter table brand_products drop column brand_name;
alter table brand_products add constraint brand_id foreign key (brand_id) references brands(brand_id);
alter table brand_products rename column Products_ProductID to Product_id;
ALTER TABLE brand_products MODIFY COLUMN Product_id VARCHAR(50) NOT NULL;
alter table brand_products add constraint Product_id foreign key (Product_id) references products(Product_id);
desc brand_products;

# altering table customer_details
alter table customer_details add constraint id primary key (id);
alter table customer_details rename column ID to Customer_id;

# altering table cashier
alter table cashier add constraint cashierid primary key (cashierid);
alter table cashier rename column cashierid to Cashier_id;

# altering transactions table
alter table transactions rename column cashierid to Cashier_id;
alter table transactions rename column CustomerID to Customer_id;
alter table transactions rename column ProductID to Product_id;
ALTER TABLE transactions MODIFY COLUMN Product_id VARCHAR(50) NOT NULL;
alter table transactions add constraint Customer_id foreign key (Customer_id) references customer_details(Customer_id);
alter table transactions add constraint Cashier_id foreign key (Cashier_id) references cashier(Cashier_id);
alter table transactions add constraint fk_Product_id foreign key (Product_id) references products(Product_id);
desc transactions;

-- SELECT CONSTRAINT_NAME 
-- FROM information_schema.KEY_COLUMN_USAGE 
-- WHERE TABLE_NAME = 'transactions' 
-- AND COLUMN_NAME = 'Product_id';
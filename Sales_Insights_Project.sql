# Show records from all tables from database - sales.
use sales;

SELECT * FROM sales.transactions limit 5;
SELECT * FROM sales.customers;
SELECT * FROM sales.products;
SELECT * FROM sales.markets;
SELECT * FROM date;


-- 1) Show transition where currency is USD
SELECT * FROM sales.transactions where currency = "USD";


-- 2) Show transactions for Chennai market (market code for chennai is Mark001)
SELECT * FROM sales.transactions where market_code = "mark001";


-- 3) Show distinct product codes that were sold in chennai
SELECT distinct count(product_code) FROM transactions where market_code='Mark001';


-- 4)Show transactions in 2020 join by date table
SELECT transactions.*, date.* FROM transactions
INNER JOIN date ON transactions.order_date = date.date where date.year=2020;


-- 5) Total revenue in year 2020
SELECT SUM(transactions.sales_amount) FROM transactions
INNER JOIN date ON transactions.order_date=date.date
where date.year=2020 and transactions.currency='INR\r' or transactions.currency='USD\r';


-- 6) Show total revenue in year 2020, January Month
SELECT SUM(transactions.sales_amount) FROM transactions
INNER JOIN date ON transactions.order_date=date.date
where date.year=2020 and date.month_name='January' and (transactions.currency='INR\r' or transactions.currency='USD\r');








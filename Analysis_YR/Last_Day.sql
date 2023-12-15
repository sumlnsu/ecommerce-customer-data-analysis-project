USE ecommerce;
SHOW tables;

SELECT purchase_date
FROM ecommerce_customer_data
WHERE purchase_date LIKE '2023-09%'
ORDER BY purchase_date DESC
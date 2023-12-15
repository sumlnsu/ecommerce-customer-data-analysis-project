With merge as
(
select * from ecommerce_customer_data_custom_ratios
union
select * from ecommerce_customer_data_large
)

SELECT
  CASE
    WHEN `Product_Price` BETWEEN 0 AND 100 THEN '0-100'
    WHEN `Product_Price` BETWEEN 101 AND 200 THEN '101-200'
    WHEN `Product_Price` BETWEEN 201 AND 300 THEN '201-300'
    WHEN `Product_Price` BETWEEN 301 AND 400 THEN '301-400'
    WHEN `Product_Price` BETWEEN 401 AND 500 THEN '401-500'
    ELSE 'Unknown'
  END AS Price_range,
  SUM(Returns) AS total_returns
FROM merge
GROUP BY Price_range

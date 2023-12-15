With merge as
(
select * from ecommerce_customer_data_custom_ratios
union
select * from ecommerce_customer_data_large
)

SELECT
  CASE
    WHEN `Product_Category` = "Clothing" THEN 'Clothing'
    WHEN `Product_Category` = "Home" THEN 'Home'
    WHEN `Product_Category` = "Books" THEN 'Books'
    WHEN `Product_Category` = "Electronics" THEN 'Electronics'
    ELSE 'Unknown'
  END AS Product_Category,
  SUM(Returns) AS total_returns
FROM merge
GROUP BY Product_Category
ORDER BY total_returns;

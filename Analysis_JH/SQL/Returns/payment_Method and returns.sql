With merge as
(
select * from ecommerce_customer_data_custom_ratios
union
select * from ecommerce_customer_data_large
)

SELECT
  CASE
    WHEN `Payment_Method` = "Cash" THEN 'Cash'
    WHEN `Payment_Method` = "Credit Card" THEN 'Credit Card'
    WHEN `Payment_Method` = "Crypto" THEN 'Crypto'
    WHEN `Payment_Method` = "PayPal" THEN 'PayPal'
    ELSE 'Unknown'
  END AS Payment_Method,
  SUM(Returns) AS total_returns
FROM merge
where Returns is not null
GROUP BY Payment_Method
ORDER BY total_returns;

With merge as
(
select * from ecommerce_customer_data_custom_ratios
union
select * from ecommerce_customer_data_large
)

SELECT
  CASE
    WHEN `Age` BETWEEN 0 AND 20 THEN '0-20'
    WHEN `Age` BETWEEN 21 AND 30 THEN '21-30'
    WHEN `Age` BETWEEN 31 AND 40 THEN '31-40'
    WHEN `Age` BETWEEN 41 AND 50 THEN '41-50'
    WHEN `Age` BETWEEN 51 AND 60 THEN '51-60'
    WHEN `Age` BETWEEN 61 AND 70 THEN '61-70'
    ELSE 'Unknown'
  END AS Age_range,
  SUM(Returns) AS total_returns
FROM merge
GROUP BY Age_range
ORDER BY Age_range;

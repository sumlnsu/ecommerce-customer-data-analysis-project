With merge as
(
select * from ecommerce_customer_data_custom_ratios
union
select * from ecommerce_customer_data_large
)

SELECT
  YEAR(`Purchase_Date`) AS purchase_year,
  SUM(`Returns`) AS count_of_returns
FROM merge
GROUP BY purchase_year
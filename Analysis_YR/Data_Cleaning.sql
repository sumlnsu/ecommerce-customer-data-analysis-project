USE ecommerce;
SHOW tables;

SELECT *
FROM ecommerce_customer_data
WHERE customer_id IS NOT NULL
  AND purchase_date IS NOT NULL
  AND product_category IS NOT NULL
  AND product_price IS NOT NULL
  AND quantity IS NOT NULL
  AND sales IS NOT NULL
  AND payment_method IS NOT NULL
  AND returns IS NOT NULL
  AND customer_name IS NOT NULL
  AND age IS NOT NULL
  AND gender IS NOT NULL
  AND churn IS NOT NULL
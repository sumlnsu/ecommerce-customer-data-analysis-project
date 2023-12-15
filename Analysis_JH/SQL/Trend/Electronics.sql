With merge as
(
select * from ecommerce_customer_data_custom_ratios
union
select * from ecommerce_customer_data_large
)

SELECT 
    MAX(Purchase_Date) AS Month_End_Date,
    SUM(Total_Purchase_Amount) AS Total_Purchase_Amount
FROM 
    merge
WHERE
    Product_Category = 'Electronics'
GROUP BY 
    YEAR(Purchase_Date), MONTH(Purchase_Date), Product_Category
ORDER BY 
    YEAR(Purchase_Date), MONTH(Purchase_Date), Product_Category;



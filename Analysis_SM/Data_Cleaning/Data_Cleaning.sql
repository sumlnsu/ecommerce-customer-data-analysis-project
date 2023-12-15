-- 데이터 전처리 (데이터 테이블 두개 합치기, Sales 컬럼 만들기, 모든 Null값 제거, 불필요한 컬럼 삭제)
-- & 파생 피처 생성 (Age 컬럼 -> Age Labels, Date 컬럼 -> Year, Month, Day, Hour, Season(계절), Time(시간), DOW(요일), WOW(주중,주말))
CREATE TABLE ecommerce
SELECT e.`Customer ID`, e.`Gender`, e.`Age`, 
	   CASE
			WHEN e.`Age` BETWEEN 18 AND 24 THEN '18-24'
            WHEN e.`Age` BETWEEN 25 AND 34 THEN '25-34'
            WHEN e.`Age` BETWEEN 35 AND 44 THEN '35-44'
            WHEN e.`Age` BETWEEN 45 AND 54 THEN '45-54'
            WHEN e.`Age` BETWEEN 55 AND 64 THEN '55-64'
            ELSE '65+'
	   END AS 'Age Labels',
	   Year(e.`Purchase Date`) as Year, MONTH(e.`Purchase Date`) as Month,
	   DAY(e.`Purchase Date`) as Day, HOUR(e.`Purchase Date`) as Hour,
       CASE
			WHEN MONTH(e.`Purchase Date`) BETWEEN 3 AND 5 THEN 'Spring'
            WHEN MONTH(e.`Purchase Date`) BETWEEN 6 AND 8 THEN 'Summer'
            WHEN MONTH(e.`Purchase Date`) BETWEEN 9 AND 11 THEN 'Fall'
            ELSE 'Winter'
		END AS Season,
        CASE
			WHEN HOUR(e.`Purchase Date`) BETWEEN 5 AND 11 THEN 'Morning'
            WHEN HOUR(e.`Purchase Date`) BETWEEN 12 AND 17 THEN 'Afternoon'
            WHEN HOUR(e.`Purchase Date`) BETWEEN 18 AND 21 THEN 'Evening'
            WHEN HOUR(e.`Purchase Date`) >= 22 OR HOUR(e.`Purchase Date`) < 5 THEN 'Night'
            ELSE 'Unknown'
		END AS `Time`,
        DAYNAME(e.`Purchase Date`) as `DOW`,
        CASE
			WHEN DAYOFWEEK(e.`Purchase Date`) IN (1,7) THEN '주말'
            ELSE '주중'
		END AS `WOW`,
       e.`Product Category`, e.`Payment Method`, (e.`Product Price` * e.`Quantity`) as Sales, 
       e.`Returns`, e.`Churn`
FROM 
	(SELECT * FROM ecommerce_customer_data_custom_ratios
	UNION
	SELECT * FROM ecommerce_customer_data_large) as e;

-- NULL값 체크
SELECT *
FROM ecommerce
WHERE 1=1
AND `Customer ID` IS NULL AND `Gender` IS NULL AND `Age` IS NULL AND `Age Labels` IS NULL
AND `Year` IS NULL AND `Month` IS NULL AND `Day` IS NULL AND `Hour` IS NULL 
AND `Season` IS NULL AND `Time` IS NULL AND `DOW` IS NULL AND `WOW` IS NULL
AND `Product Category` IS NULL AND `Payment Method` IS NULL AND `Sales` IS NULL
AND `Returns` IS NULL AND `Churn` IS NULL;

-- 데이터 행 개수 체크
SELECT COUNT(*)
FROM ecommerce;

-- 데이터 컬럼 개수 체크
SELECT COUNT(*) AS column_count
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'ecommerce';

-- 데이터 컬럼별 고유값 체크
SELECT
    `Age`, COUNT(*) AS unique_values_count
FROM ecommerce
GROUP BY `Age`
ORDER BY `Age`;

SELECT
    `Age Labels`, COUNT(*) AS unique_values_count
FROM ecommerce
GROUP BY `Age Labels`
ORDER BY `Age Labels`;

SELECT
    `Year`, COUNT(*) AS unique_values_count
FROM ecommerce
GROUP BY `Year`
ORDER BY `Year`;

SELECT
    `Product Category`, COUNT(*) AS unique_values_count
FROM ecommerce
GROUP BY `Product Category`
ORDER BY `Product Category`;

SELECT
    `Payment Method`, COUNT(*) AS unique_values_count
FROM ecommerce
GROUP BY `Payment Method`
ORDER BY `Payment Method`;

-- 성별에 따른 매출액 비교
SELECT Gender, FORMAT(ROUND(SUM(Sales),2),2) as Sales_SUM, FORMAT(ROUND(AVG(Sales),2),2) as Sales_AVG,
	   FORMAT(ROUND(VARIANCE(Sales),2),2) as Sales_VAR, FORMAT(ROUND(STDDEV(Sales),2),2) as Sales_STD
FROM ecommerce
GROUP BY Gender;

-- 나이대에 따른 매출액 비교
SELECT `Age Labels`, FORMAT(ROUND(SUM(Sales),2),2) as Sales_SUM, FORMAT(ROUND(AVG(Sales),2),2) as Sales_AVG,
	   FORMAT(ROUND(VARIANCE(Sales),2),2) as Sales_VAR, FORMAT(ROUND(STDDEV(Sales),2),2) as Sales_STD
FROM ecommerce
GROUP BY `Age Labels`
ORDER BY `Age Labels`;

-- 계절에 따른 매출액 비교
SELECT `Season`, FORMAT(ROUND(SUM(Sales),2),2) as Sales_SUM, FORMAT(ROUND(AVG(Sales),2),2) as Sales_AVG,
	   FORMAT(ROUND(VARIANCE(Sales),2),2) as Sales_VAR, FORMAT(ROUND(STDDEV(Sales),2),2) as Sales_STD
FROM ecommerce
GROUP BY `Season`
ORDER BY `Sales_SUM`;

-- 시간에 따른 매출액 비교
SELECT `Time`, FORMAT(ROUND(SUM(Sales),2),2) as Sales_SUM, FORMAT(ROUND(AVG(Sales),2),2) as Sales_AVG,
	   FORMAT(ROUND(VARIANCE(Sales),2),2) as Sales_VAR, FORMAT(ROUND(STDDEV(Sales),2),2) as Sales_STD
FROM ecommerce
GROUP BY `Time`
ORDER BY `Sales_SUM`;

-- DOW(요일)에 따른 매출액 비교
SELECT `DOW`, FORMAT(ROUND(SUM(Sales),2),2) as Sales_SUM, FORMAT(ROUND(AVG(Sales),2),2) as Sales_AVG,
	   FORMAT(ROUND(VARIANCE(Sales),2),2) as Sales_VAR, FORMAT(ROUND(STDDEV(Sales),2),2) as Sales_STD
FROM ecommerce
GROUP BY `DOW`
ORDER BY `Sales_SUM`;

-- 결제 방법에 따른 매출액 비교
SELECT `Payment Method`, FORMAT(ROUND(SUM(Sales),2),2) as Sales_SUM, FORMAT(ROUND(AVG(Sales),2),2) as Sales_AVG,
	   FORMAT(ROUND(VARIANCE(Sales),2),2) as Sales_VAR, FORMAT(ROUND(STDDEV(Sales),2),2) as Sales_STD
FROM ecommerce
GROUP BY `Payment Method`
ORDER BY `Sales_SUM`;

-- 데이터 조회
SELECT *
FROM ecommerce;

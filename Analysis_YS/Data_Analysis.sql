-- 1. 날짜를 기반으로 2020년 ~ 2022년 11월과 12월에 발생한 결제건들만 선택
SELECT
	CONVERT(date, [Purchase Date]) AS [Purchase Date], 	-- Purchase Date 칼럼의 데이터타입 변경
	SUM([Sales]) AS [Total Sales], 				-- 해당되는 날의 판매액 총 합계
	COUNT(*) AS [Total Transactions] 			-- 해당되는 날의 총 거래 건수

FROM SalesData  						-- 1차적으로 전처리 한 데이터를 SalesData로 명명 

WHERE
	( ([Purchase Date] >= '2020-11-01' AND [Purchase Date] < '2021-01-01') OR	-- 매 해 11월부터 12월 간 발생한 데이터만 필터링 
        ([Purchase Date] >= '2021-11-01' AND [Purchase Date] < '2022-01-01') OR
        ([Purchase Date] >= '2022-11-01' AND [Purchase Date] < '2023-01-01') 
    ) 

GROUP BY 
	CONVERT(date, [Purchase Date]) -- 날짜별로 그룹화

ORDER BY
	CONVERT(date, [Purchase Date]); -- 날짜순으로 정렬


-- 2. 소비자 물가 지수가 증가한 경향과 비교해보기 위해 년도별 판매량과 판매액 추출 쿼리

SELECT 
    YEAR([Purchase Date]) AS [Year],	-- 연도별로 그룹화
    SUM([Sales]) AS [Total Sales],	-- 해당 연도의 총 판매액
    COUNT(*) AS [Total Transactions]	-- 해당 연도의 총 거래 건수

FROM SalesData


GROUP BY 
    YEAR([Purchase Date])		-- 연도별로 그룹화

ORDER BY 
    YEAR([Purchase Date]);		-- 연도별로 그룹화



-- 3. 성별에 따른 선호 품목군 확인 및 거래량/거래액 확인
SELECT     
	[Gender], 
	[Product Category],
	SUM([Sales]) AS [Total Sales],
	COUNT(*) AS [Total Transactions]

FROM SalesData

GROUP BY 
	[Product Category],
	[Gender]

ORDER BY
	[Gender]
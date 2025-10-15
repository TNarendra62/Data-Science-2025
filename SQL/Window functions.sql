--1 Assign row numbers to customers ordered by credit limit descending.
select CUST_ID, ROW_NUMBER() OVER(order by CUST_CREDIT_LIMIT desc) as rn
from SH.CUSTOMERS;


--2 Rank customers within each state by credit limit.
select CUST_ID,CUST_STATE_PROVINCE,CUST_CREDIT_LIMIT,
rank() over( PARTITION by CUST_STATE_PROVINCE order by CUST_CREDIT_LIMIT) as ran
from SH.CUSTOMERS;


--3 Use DENSE_RANK() to find the top 5 credit holders per country.
with CTE as (select CUST_CREDIT_LIMIT,
            DENSE_RANK() over(PARTITION by COUNTRY_ID order by CUST_CREDIT_LIMIT desc) as drnk 
            from SH.CUSTOMERS)
select * from CTE where drnk<5;


--4 Divide customers into 4 quartiles based on their credit limit using NTILE(4).
select CUST_ID,CUST_CREDIT_LIMIT,
NTILE(4) over(order by CUST_CREDIT_LIMIT) as Q4
from SH.CUSTOMERS; 

--5 Calculate a running total of credit limits ordered by customer_id.
SELECT
    CUST_ID,
    CUST_CREDIT_LIMIT,
    SUM(CUST_CREDIT_LIMIT) OVER (ORDER BY CUST_ID) AS running_total
FROM SH.CUSTOMERS
ORDER BY CUST_ID;







-- 1 Find the total, average, minimum, and maximum credit limit of all customers.

select CUST_ID,Sum(CUST_CREDIT_LIMIT),Avg(CUST_CREDIT_LIMIT),Min(CUST_CREDIT_LIMIT),
Max(CUST_CREDIT_LIMIT)
 from SH.CUSTOMERS
 group by CUST_ID;



--2 Count the number of customers in each income level.
select count(CUST_ID),CUST_INCOME_LEVEL
from SH.CUSTOMERS
group by CUST_INCOME_LEVEL;


--3 Show total credit limit by state and country.
select sum(CUST_CREDIT_LIMIT),CUST_STATE_PROVINCE,COUNTRY_ID from SH.CUSTOMERS
group by CUST_STATE_PROVINCE,COUNTRY_ID;


--4 Display average credit limit for each marital status and gender combination.
select AVG(CUST_CREDIT_LIMIT),CUST_MARITAL_STATUS,CUST_GENDER from SH.CUSTOMERS
group by CUST_MARITAL_STATUS,CUST_GENDER;


--5 Find the top 3 states with the highest average credit limit.
select CUST_STATE_PROVINCE, AVG(CUST_CREDIT_LIMIT) from SH.CUSTOMERS
group by CUST_STATE_PROVINCE
order by AVG(CUST_CREDIT_LIMIT) desc,CUST_STATE_PROVINCE desc 
FETCH FIRST 3 ROWS ONLY;


--6 Find the country with the maximum total customer credit limit.
select COUNTRY_ID,Sum(CUST_CREDIT_LIMIT) from SH.CUSTOMERS
group by COUNTRY_ID 
order by Sum(CUST_CREDIT_LIMIT) desc;


---7 Show the number of customers whose credit limit exceeds their state average.



---8 Calculate total and average credit limit for customers born after 1980
select sum(CUST_CREDIT_LIMIT),Avg(CUST_CREDIT_LIMIT) from SH.CUSTOMERS
where CUST_YEAR_OF_BIRTH>1980;



---9 Find states having more than 50 customers
select CUST_STATE_PROVINCE,Count(CUST_ID) from SH.CUSTOMERS
group by CUST_STATE_PROVINCE
Having Count(CUST_ID)>50;



---10 List countries where the average credit limit is higher than the global average.
select COUNTRY_ID,Avg(CUST_CREDIT_LIMIT)from SH.CUSTOMERS
group by COUNTRY_ID
having Avg(CUST_CREDIT_LIMIT)>(select Avg(CUST_CREDIT_LIMIT) from SH.CUSTOMERS);


--11 Calculate the variance and standard deviation of customer credit limits by country.
select COUNTRY_ID,STDDEV(CUST_CREDIT_LIMIT),VARIANCE(CUST_CREDIT_LIMIT) from SH.CUSTOMERS
group by COUNTRY_ID;


--12 Find the state with the smallest range (max–min) in credit limits.
select CUST_STATE_PROVINCE,Max(CUST_CREDIT_LIMIT),Min(CUST_CREDIT_LIMIT) from SH.CUSTOMERS
group by CUST_STATE_PROVINCE;

---  DOUBT : Max(CUST_CREDIT_LIMIT)-Min(CUST_CREDIT_LIMIT)) as max_min


--13 Show the total number of customers per income level and the percentage 
--contribution of each.

select count(CUST_ID), CUST_INCOME_LEVEL,
ROUND((COUNT(CUST_ID) * 100.0 / (SELECT COUNT(*) FROM SH.CUSTOMERS)), 2) AS Percentage_Contribution
from SH.CUSTOMERS
group by CUST_INCOME_LEVEL;


--14 For each income level, find how many customers have NULL credit limits.
select Count(CUST_ID), CUST_INCOME_LEVEL  from SH.CUSTOMERS
where CUST_CREDIT_LIMIT IS NULL
group by CUST_INCOME_LEVEL;


--15 Display countries where the sum of credit limits exceeds 10 million.
select COUNTRY_ID, sum(CUST_CREDIT_LIMIT) from SH.CUSTOMERS
group by COUNTRY_ID
Having sum(CUST_CREDIT_LIMIT)>10000000;



select * from car_sales;

select count(*) from car_sales;

select customer_name from car_sales where company = 'Ford' order by customer_name;

-- check how many gender

select distinct(gender) from car_sales


-- Sales Performance Analysis
-- 1.	What is the total revenue generated by each dealer?
-- 2.	Which dealer has the highest number of sales?
-- 3.	What is the average price of cars sold by each dealer?

-- 1.	What is the total revenue generated by each dealer?
select dealer_name ,
sum(price) as total_revenue
from car_sales 
group by dealer_name
order by total_revenue desc;
	
-- 2.	Which dealer has the highest number of sales?
select dealer_name , 
count(car_id_no) as number_of_order
from car_sales
group by dealer_name
order by number_of_order desc limit 1;
	

-- 3.	What is the average price of cars sold by each dealer?
select dealer_name , cast(avg(price) as int) as average_price 
from car_sales
group by dealer_name
order by average_price desc;
	
	
-- Customer Demographics and Behavior
-- 1.	What is the gender distribution of customers?
-- 2.	What is the average annual income of customers?
-- 3.	What is the distribution of customers based on the dealer regions?


-- 1.	What is the gender distribution of customers?
select gender , 
count(gender) as number_gender
from car_sales
group by gender order by number_gender desc;

-- 2.	What is the average annual income of customers?
select customer_name,
cast (avg(annual_income) as int) as avg_annual_income
from car_sales 
group by customer_name order by avg_annual_income desc;

-- 3.	What is the distribution of customers based on the dealer regions?

select dealer_region as region,
count(dealer_region) as customers_regions
from car_sales
group by region order by customers_regions desc;


-- Model and Company Insights
-- 1.	What are the top 5 most popular car models?
-- 2.	Which company has the highest sales volume?
-- 3.	What is the average price of cars from each company?

-- 1.	What are the top 5 most popular car models?
select model, count(car_id_no) as number_of_sales
from car_sales
group by model order by number_of_sales desc limit 5;

-- 2.	Which company has the highest sales volume?
select company, count(car_id_no) as sales_volume
from car_sales
group by company order by sales_volume desc limit 1;

-- 3.	What is the average price of cars from each company?
select company , cast(avg(price) as decimal(10,2) )as average_price
from car_sales
group by company order by average_price desc;


-- Regional Analysis
-- 1.	Which dealer region has the highest sales revenue?
-- 2.	What is the sales performance comparison between different dealer regions?
-- 3.	How does the average car price vary across different regions?

-- 1.	Which dealer region has the highest sales revenue?
select dealer_region, count(car_id_no) as sales_volume
from car_sales 
group by dealer_region
order by sales_volume desc limit 1 offset 0;

-- extra	Which dealer region has the 2nd highest sales revenue?
select dealer_region, count(car_id_no) as sales_volume
from car_sales 
group by dealer_region
order by sales_volume desc limit 1 offset 1;

-- 2.	What is the sales performance comparison between different dealer regions?

select dealer_region,
sum(price) as total_sales,
round(avg(price)) as avg_sales,
count(car_id_no) as no_of_sales
from car_sales
group by dealer_region order by total_sales desc;

-- 3.	How does the average car price vary across different regions?
select dealer_region as region
,round(avg(price)) as avg_price
from car_sales
group by region order by avg_price desc;

-- Engine and Transmission Preferences
-- 1.	What is the distribution of engine types among sold cars?
-- 2.	What percentage of cars sold have automatic vs. manual transmission?

select distinct(engine) from car_sales;

-- 1.	What is the distribution of engine types among sold cars?
select engine as Engine_Type,
count(car_id_no) as number_of_car_sold
from car_sales group by Engine_Type order by number_of_car_sold desc


-- 2.	What percentage of cars sold have automatic vs. manual transmission?

SELECT TRANSMISSION , COUNTS , 
(COUNTS *100.0 / (SELECT COUNT(*) FROM CAR_SALES) ) AS PERCENTAGE

FROM(
SELECT TRANSMISSION , COUNT(TRANSMISSION) COUNTS 
FROM CAR_SALES
GROUP BY TRANSMISSION  ORDER BY COUNTS DESC
) AS TRAN;


-- Color and Body Style Trends
-- 1.	What are the top 3 most popular car colors?
-- 2.	What is the distribution of body styles among sold cars?

-- 1.	What are the top 3 most popular car colors?
SELECT COLOR , COUNT(CAR_ID_NO) AS POPULAR_SALES FROM CAR_SALES GROUP BY COLOR ORDER BY POPULAR_SALES DESC LIMIT 3;

-- 2.	What is the distribution of body styles among sold cars?
SELECT BODY_STYLE , COUNT(CAR_ID_NO) AS SOLD_CARS FROM CAR_SALES GROUP BY BODY_STYLE ORDER BY SOLD_cARS DESC;


-- Dealer Performance
-- 1.	What is the total number of sales made by each dealer?
-- 2.	Which dealer has the highest average sales price?

-- 1.	What is the total number of sales made by each dealer?
SELECT DEALER_NAME, COUNT(CAR_ID_NO) NO_OF_SALES
FROM CAR_SALES GROUP BY DEALER_NAME ORDER BY NO_OF_SALES DESC

-- 2.	Which dealer has the highest average sales price?
SELECT DEALER_NAME , CAST(AVG(PRICE) AS INT)AS AVG_PRICE
FROM CAR_SALES
GROUP BY DEALER_NAME
ORDER BY AVG_PRICE DESC LIMIT 1;



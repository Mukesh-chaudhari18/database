create database sales ;

# Select - DQL commands 
# Select is used to communicate with the tables 
# along with select a user can perform 
# 1.Filteration - where clause 
# 2.Grouping and aggregations 
# 3.Subqueries can be written 
# 4.Joins can be created 

# return all the information from that table 
select * from data ;

# top 5 rows from table 
select * from data limit 10 ; 

# Select with specific columns 
select order_Date , channel , sales , profit 
from data ; 

# select with Alias - using as keyword - temp_name for column or table 
select sales as total_sales from data ;

# select with aggregate functions 
# count()  , avg() , min() , max() , sum() , distinct() 
select count(*) as total_orders  from data ;

select sum(sales) as total_Sales , 
       avg(sales) as avg_sales , 
       sum(profit) as total_profit ,
       avg(profit) as avg_profit 
from data ;

###################################################

# Filteration using Where Clause 
# Allows user to insert a condition and returns the information 
# matching condition 

# syntax - select * from table where condition ; 

# 1. Comparision Operators - = , != , > , < , >= , <= 

# Q1. Orders placed from brand contoso 
select * from data where brand_name = "contoso" ;

# Q2. Orders which are not from online 
# Q3. Orders with sales greater than 30000 
# Q4. Orders with profit less than 10 
# Q5. Orders with Quantity greater than equal to 80 
# Q6. Orders with Cost of Sales less than 5 

# 2. Logical Operators 
# Allows to insert two or more than two conditions 
# And - Match all conditions and returns the data 
# or - Either of condtions if matches it returns that data 
# not - Excludes the data from the given condition 

# Q1. Orders from 2018 which has sales more than 20k
select  * from data where year = 2018 and sales >= 20000;

# Q2. Order from online with 
#     profit more than 5000 and sales more than 10000
# Q3. Orders from Asia where product bought is laptops 
# Q4. total _orders , Total Sales and total profit 
#     from India where city is new delhi 
# Q5. How many orders are there in total where the customer purchased 
# computers as product_category and from the china 
select count(*) as total_orders from data 
where country = "china" and product_category = "Computers"  ; 

# or 
# Q1. Orders from china or India 
# Q2. Orders from Store or sales is more than 45k 
# Q3. orders from north america or the brand is The Phone Company
# Q4. Orders with sales more than 45k 0r profit more than 20k 
# Q5. Orders that has profit less than equals to zero  
      #   or sales less than 20 

# Not - excluding use case 
# Q1. Order not from online 
select * from data where not channel = "Online";
# Q2. orders with negative profit 
select * from data where not profit >= 0 ;
# Q3. Orders which are not from Asia region 

alter table data modify column order_date date ;

# Between Operator - range of data - date and number 

# Q1. orders between - 2018-1-1 to 2018-2-1 
select * from data where order_Date between "2018-1-1" and "2018-2-1" ; 

# Q2.Profit between 12000 - 16000
# Q3.Sales from 40000 to 45000
# Q4.Orders with order quantity between - 70 - 80 

# In / Not in  Operator - 
# Allows to insert Multiple values to be filtered from a single column 

select * from data 
where Product_Category in ("computers" , "Audio" , "tv and video") ; 

# Q2. Orders from Seattle,Shanghai,Paris , Yokohama 
# Q3. orders from China , Indian , Japan, Germany , Spain
# Q4. orders from brand - A. Datum , Fabrikam , Wide World Importers 

# Like Operator - pattern Matching - text data 
# % - Nothing / single char or num / Many characters or numbers 
# _ - single char or num 

# 1. Starting with Specific Character(A) - like "A%"
# 2. End with specific character - like "%S"
# 3. Start and end - like "A%S"
# 4. Inbetween - like "%and%" 
# 5. Text with 4 character - like "____"
# 5. start with s and 4 char - like "S___"
# 6. End with P and 5 char - like "____P"

# find product_names that starts with "C"
select product_name from data 
where product_name like "C%";

# 2 .cities that start with "A"
# 3. Countries that Starts with - "In" 
# 4. cities that ends with "ng" 
# 5. countries with 5 characters 
# 6. product categories that has "ing" word in between them 
# 7. Brands that starts with "S"
# 8. Cities that starts with "B" and ends with "n"

###########################################

# Groupby -
# Groupby allows grouping of rows(Categorical data) along
# with aggregation functions 
# syntax - select category , agg(column) from table 
 #         group by category ;
 
# Q1. Total orders for each brand ? 
 select brand_name , count(*) as total_orders 
 from data group by brand_name ;
 
# Q2. Channel wise Total_orders 
select channel , count(*) as total_orders 
 from data group by channel ;
 
# Q3. Orders per year ?
select year , count(*) as total_orders 
 from data group by year ;
 
# Q4. Calculate total Sales for each Country.
# Q5. Calculate total Profit for each Region.
# Q6. Find the number of transactions for each Channel.
# Q7. Calculate average Sales for each Product_Category.
# Q8. Find total Order_Qty for each Brand_Name.
# Q9. Calculate total Sales for each Year.
# Q10. Find the number of transactions for each City.
# Q11. Calculate total Sales and total Profit for each Product_Category.
# Q12. Find the average Profit for each Channel.
# Q13. Count the number of transactions for each Country and Channel combination.
# Q14. Calculate total Sales for each Region and Year combination.
# Q15. Find the average Order_Qty for each Product_Sub_Category.
# Q16. Calculate total Sales, total Profit, and transaction count for each Brand_Name.
# Q17. Find the number of distinct Product_Name values in each Product_Category.
# Q18. Calculate total Sales and average Profit for each Manufacturer.
# Q19. Find total Sales for each Country and Product_Category combination.
# Q20. Calculate total Profit for each Year and Channel combination.
# Q21. Find the number of transactions for each Region, City, and Country combination.

# Group by with many Aggregations - 
# Q1. brand wise total sales and avg sales and total profit and 
#      avg profit and alter total quantity and avg quantity 
select brand_name , sum(sales) as total_sales , avg(sales) as avg_Sales ,
		sum(profit) as total_profit , avg(profit) as avg_profit ,
		sum(order_qty) as total_quantity, avg(Order_Qty) as avg_quantity 
from data group by brand_name ;

# Q2. Product_category wise avg_profit and avg_sales 
# Q3. Manufactuer wise cost of sales in total and avg

# Grouping with many categories - 
select channel , brand_name ,region , count(*) as total_orders 
from data 
group by channel , brand_name , region ;  

# Having Clause - It is Used for Filtering the data on grouped output.
# it is only Allowed with aggrgates and grouped functions 

select city , count(*) from data 
group by city 
having count(*) >= 900 ; 

# 1. Display countries where total Sales is greater than 15,00,000.
select country , sum(sales) as total_Sales 
from data group by country having total_Sales > 1500000;

# 2. Find regions where total Profit is greater than 400000.
# 3. Display Product_Category values having more than 500 transactions.
# 4. Find channels where average Sales is greater than 2,000.
# 5. Display brands whose total Sales is greater than 20,000.
# 6. Find countries where average Profit is greater than 6000.
# 7. Display years where total Order_Qty is greater than 800.
# 8. Find cities having at least 70 transactions.
# 9. Display Product_Sub_Category values 
#    where average Order_Qty is greater than 10.
# 10. Find Region and Channel combinations where total Sales is greater than 5,000.
# 11. Display manufacturers having more than 3 distinct products.
# 12.Find countries where total Profit is greater than 2,000 and transaction count is greater than 5.
# 13. Display product categories where average Sales is between 1,000 and 5,000.
# 14. Find brands where total Sales is greater than 10,000 and average Profit is greater than 500.
#  15. Display Year and Channel combinations where total Sales is greater than 5,000.

#########################

# Order by - 
# Sorting on the output - Numerical , categorial , date 
# default - ascending  - asc  - min - max , A-Z , Olddate - New_date 
# We have to mention if we want to sort by descending order 
# descending order - max-min , Z-A, New_Date - Old date 

# Number sorting 
select * from data order by sales  ; 
select * from data order by sales  desc; 

# Text sorting - 
select * from data order by country; 
select * from data order by country desc ; 

# Date Sorting 
select * from data order by order_date ;
select * from data order by order_date desc ; 

# Questions for Order by - 
# 1. Display all transactions ordered by Sales from highest to lowest.
# 2. Display all transactions ordered by Profit from lowest to highest.
# 3. Display products alphabetically by Product_Name.
# 4. Display all records ordered by Year in descending order.
# 5. Display transactions ordered first by Country alphabetically and then by Sales from highest to lowest.
# 6. Display product categories ordered by average Sales from highest to lowest.
# 7. Display countries ordered by total Profit from highest to lowest.
# 8. Display brands ordered alphabetically and then by total Sales from highest to lowest.
# 9. Display all transactions ordered by Order_Date from newest to oldest.
# 10. Display Region and Channel combinations ordered by total Sales in descending order.
# 11. Display product sub-categories ordered by average Profit from highest to lowest.
# 12. Display countries first alphabetically and then their transactions by Order_Date from newest to oldest.

# Limit Clause - Row limit to the output 
# offset by default - 0 
# offset - 1 means second highest row ( skip top) 
# offset 2 - skip top 2 

# Q. Top 5 cities with the highest avg_profit 
select city , avg(profit) as avg_profit , count(*) as total_orders 
from data group by city order by avg_profit desc limit 5  offset 2 ;

# 1. Display the first 5 records from the sales_data table.
# 2. Display the 10 transactions with the highest Sales.
# 3. Display the 5 transactions with the lowest Profit.
# 4. Display the 10 most recent transactions based on Order_Date.
# 5. Display the 5 products with the highest Order_Qty.
# 6. Display the second set of 5 records after skipping the first 5 records.
# 7. Display records from positions 11 to 20 using LIMIT and OFFSET.
# 8. Display the top 3 countries based on total Sales.
# 9. Display the 5 brands with the highest total Profit.
# 10. Display the 3 transactions with the highest Sales from the Online channel.
# 11. Display the next 10 highest-profit transactions after skipping the top 10.
# 12. Display the 5 countries with the lowest total Sales.


######  Logical Questions 
# 1. Find Online transactions from China where Sales is greater than 3,000.
# 2. Find products from Europe or Asia where Profit is between 500 and 3,000.
# 3. Find all Contoso products sold through the Store channel with Sales greater than 1,000.
#4. Find products in the Computers category where Order_Qty is greater than 5 and Profit is greater than 500.
#5. Find transactions from 2019 or 2020 where Sales is greater than 2,000 and Channel is Online.
#6. Find products whose names contain Camera or Laptop and whose Profit is greater than 1,000.
#7. Find transactions from China, Russia, or the United States where Sales is between 500 and 5,000.
#8. Find records where Country and City are both available and Profit is greater than 1,000.
#9. Find products that are not from the Contoso brand and have Sales greater than 2,500.
#10. Find Store transactions where Order_Qty is between 5 and 20 and Profit is not between 100 and 500.
#11. Find Online transactions from Europe or Asia where Product_Name contains 'Video' and Sales is greater than 1,000.
#12. Find products from the Audio category where Brand_Name is not NULL and Profit is greater than 500.
#13. Find transactions from 2020 where Country is China or the United States, and Sales is greater than 2,000.
#14. Find products whose names start with 'Contoso' or contain 'Laptop', where Order_Qty is greater than 5.
#15. Find transactions where Sales is greater than 5,000 OR Profit is greater than 3,000, but exclude records where City is NULL.
#16. Find transactions from Russia or China where Channel is Online, Profit is greater than 500, and Product_Name does not contain 'DVD'.
#17. Find products from the Computers or Audio categories where Sales is between 500 and 5,000 and Manufacturer is available.
#18. Find all transactions where Year is 2019 or 2020, Channel is Store, and either Sales is greater than 2,000 or Profit is greater than 1,500.

# Advanced Questions using where clause , group by and having and order by and limt 
#1. Find the top 5 countries based on total Sales. Display Country and total Sales.

#2. Find the top 3 product categories based on average Profit. Display Product_Category and average Profit.

#3. For each Channel, calculate total Sales, total Profit, and transaction count. Sort the results by total Sales from highest to lowest.

#4. Find all countries where total Sales is greater than 5,000. Sort the results by total Sales in descending order.

#5. Find the top 5 brands by total Sales, considering only Online transactions.

#6. Find Product_Category values where average Profit is greater than 500. Sort them by average Profit from highest to lowest.

#7. Find the top 5 cities with the highest number of transactions in the year 2020.

#8. Calculate total Sales and total Profit for each Region, considering only transactions where Sales is greater than 1,000. Display only regions whose total Profit is greater than 2,000.

#9. Find the top 10 products by total Sales for the Online channel. Display Product_Name and total Sales.

#10. Find countries with at least 5 transactions and average Sales greater than 1,000. Sort by average Sales in descending order.

#11. For each Year, calculate total Sales, total Profit, and average Order_Qty. Display years in descending order.

#12. Find the top 5 Product_Sub_Category values by total Profit for products sold in Europe.

#13. Find brands that have more than 3 transactions in the Store channel. Display Brand_Name, transaction count, and total Sales.

#14. Find the top 5 Country and Channel combinations by total Profit.

#15. Find Product_Category values where total Sales is greater than 10,000 and transaction count is greater than 5.

#16. Find the 5 transactions with the highest Profit among products whose names contain the word 'Camera'.

#17. Find the 10 most profitable transactions from China or Russia, considering only Online sales.

#18. For each Region, calculate transaction count and average Sales. Display only regions with more than 5 transactions, sorted by average Sales from highest to lowest.

#19. Find the top 5 manufacturers by total Sales for products in the Computers category. Include only manufacturers with at least 3 transactions.

#20. For each Brand_Name, calculate total Sales and average Profit for products whose names contain 'Camera' or 'Laptop'. Display only brands whose total Sales exceeds 5,000.

#21. Find the top 5 cities by total Profit for Online transactions in 2020. Exclude records where City is NULL.

#22. For each Product_Category, calculate total Sales, total Profit, and transaction count for transactions from Asia. Display only categories with more than 2 transactions and sort by total Profit descending.

#23. Find the top 10 transactions by Sales for products from the Contoso brand, where Profit is greater than 500.

#24. Find countries where the total number of Online transactions is greater than 5 and average Sales is greater than 1,000. Sort by average Sales descending.

#25. For each Region and Channel combination, calculate total Sales, total Cost_of_Sales, total Profit, average Sales, and transaction count.


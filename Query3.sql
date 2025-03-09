			#--------------------- < Single Row/Scalar Functions >----------------------#
-- when we use UPPER() OR LOWER() with SELECT --> we are displaying in upper or lower case
SELECT * FROM products;
SELECT productLine, LOWER(productLine), UPPER(productLine) FROM products;

SELECT * FROM customers;
SELECT UPPER(contactLastName), LOWER(contactFirstName) FROM customers;

-- Let's display the customers with lastName King
SELECT * FROM customers WHERE contactLastName = 'king';

-- when we use UPPER() OR LOWER() with WHERE --> we are chaning the attribute for specific comparison
	-- for dbs that are case sensitive, we can use UPPER() OR LOWER()
SELECT * FROM customers WHERE UPPER(contactLastName) = 'KING';
SELECT * FROM customers WHERE LOWER(contactLastName) = 'king';

					#-------------------< Task01 >---------------# 
-- 1. Display employees last name in uppercase, first name in lowercase
SELECT UPPER(lastName), LOWER (firstName) FROM employees;

-- 2. Display the product lines in uppercase from productlines 
SELECT UPPER(productline) FROM productlines;

				   #-------------------< EndOfTask01 >---------------#

		#-------------------< Multiple row(Aggregate function) >---------------#

-- Displaying the count buyPrice from products
SELECT COUNT(buyPrice) FROM products; -- couting how many row (110)
        
-- Displaying the MAX buyPrice from products table
SELECT MAX(buyPrice) FROM products; -- from 110 rows, checks where is the max value and return one back

-- Displaying the MIN value
SELECT MIN(buyPrice) FROM products;
  
-- SUM(total) buyPrice from products
SELECT SUM(buyPrice) FROM products; -- add all the value from buyPrice(110row) and return one with total value

-- Displaying the AVERAGE value
SELECT AVG(buyPrice) FROM products;

-- Putting all together
SELECT COUNT(buyPrice), MAX(buyPrice), MIN(buyPrice), SUM(buyPrice), AVG(buyPrice) from products;

-- Displaying max buyPrice of a product ➔ motorcycle
SELECT Max(buyPrice) FROM products WHERE productLine = 'Motorcycle';

-- MAX and MIN also work for checking Dates
#	➔ displaying the earliest and latest shippedDate from orders
SELECT MAX(shippedDate), MIN(shippedDate) FROM orders;

-- when we run this query, we get only the first row with the max buyPrice on one row and nothing else
SELECT *, MAX(buyPrice) FROM products;

					#-------------------< GROUP BY KeyWord >---------------#
-- ➔ When we use COUNT keyword we are counting ALL the rows
-- ➔ When we group for a specific product, we'll be counting that product.

SELECT COUNT(*) FROM products WHERE productLine = 'Motorcycles'; -- > instead of 110 we have 13.

SELECT productLine FROM products GROUP BY productLine; -- > grouping line this we get the different productLine
#														  ➔ Motorcycle, ships, planes, etc
                                                            
SELECT productLine,COUNT(*) FROM products GROUP BY productLine; -- ➔ when grouping like this we can count how many 
#																   ➔ we have under that productLine.
#																   ➔ Motorcycle(13), ships(9), planes(12), etc
				#--> GROUP BY aggregates over the same categories. NOT the whole table <--#
#-->  The order of keywords:
#		➔ SELECT (attribute(s)) FROM (table) 
#		➔ WHERE (condition) 
#		➔ GROUP BY (attribute) 
#		➔ ORDER BY (attribute)

-- aggregates a simply query
SELECT productLine, MAX(buyPrice), MIN(buyPrice),COUNT(*) FROM products WHERE productLine = 'Planes'; 
-- aggregates same query using GROUP BY
SELECT productLine, MAX(buyPrice), MIN(buyPrice),COUNT(*) FROM products GROUP BY productLine;

SELECT reportsTo, COUNT(*) FROM employees GROUP BY  reportsTo;
SELECT reportsTo, COUNT(*) FROM employees WHERE reportsTo IS NOT NULL GROUP BY  reportsTo; 

-- COUNT and GROUP BY by jobTittle
SELECT jobTitle, COUNT(*) FROM employees GROUP BY jobTitle;
 
							#-------------------< Task02 >---------------# 
-- 1. Verify how many customers don't have any state assigned
SELECT state, COUNT(*) FROM customers GROUP BY state; -- > showing ALL state including null
SELECT COUNT(*) FROM customers WHERE state IS NULL; -- > showing only null

-- 2. Verify how many employees are "Sales Rep"
SELECT jobTitle, COUNT(*) FROM employees WHERE jobTitle = 'Sales Rep';
SELECT COUNT(*) FROM employees WHERE jobTitle = 'Sales Rep';
SELECT jobTitle, COUNT(*) FROM employees GROUP BY jobTitle;

-- 3. Display latest and earliest order date from orders
SELECT MAX(orderDate),MIN(orderDate) FROM orders;
SELECT MAX(orderDate) AS Latest,MIN(orderDate)AS Earliest FROM orders;
#-----> by using AS we can change on the header grip with what we want to be display <-----#
#---------------------> AS Keyword <---------------------#
-- 1. The column name of the result table will change according to the alias.
-- 2. We can use the alias to refer to the original object in any part of the query.
#--------------------------------------------------------#

-- 4. How many customers last name starts with S
SELECT contactLastName, COUNT(*) FROM customers WHERE contactLastName LIKE 'S%';
SELECT COUNT(*) AS CustomerCount FROM customers WHERE contactLastName LIKE 'S%';

-- 5. What is the total amount of "quantityInStock" of planes in the products table?
SELECT productLine, SUM(quantityInStock) FROM products WHERE productLine = 'Planes';
SELECT productLine, SUM(quantityInStock) AS PlanesInStock FROM products WHERE productLine = 'Planes';
SELECT productLine, SUM(quantityInStock) AS TotalInStock FROM products GROUP BY productLine;
						#-------------------< EndOfTask02 >---------------#
                        
					    #-----------------< Having Keyword >----------------#
# ➔ Used to filter Groups
# ➔ Applied after Group BY
# ➔ Used only if condition contains
# ➔ Group Function                        
                        
-- Displaying the records for the quantityInStock > 5000
-- We filter using WHERE quantityInStock > 5000
SELECT * FROM products;
SELECT * FROM products WHERE quantityInStock > 5000;

-- if we want to get the total for quantityInStock > 5000, 
-- then we should use SUM for the same query 
SELECT SUM(quantityInStock) FROM products WHERE quantityInStock > 5000;

-- Let's group the result based on category (productLine)
SELECT productLine, SUM(quantityInStock) AS TotalStock FROM products GROUP BY productLine HAVING TotalStock > 60000;

#------> The order of keywords
# ➔ SELECT (attribute(s), aggregate function(s)) FROM (table) 
# ➔ WHERE (condition) 
# ➔ GROUP BY (attribute) 
# ➔ HAVING (filter for the groups --> condition)

							#------------------> HRM DB QUERIES <------------------#
                            
SELECT * FROM prod_orangehrm.hs_hr_employee;

-- Display the number of employees per job_title_code
-- We want to get the job_title_code total for the groups with total >= 5
SELECT job_title_code, COUNT(job_title_code) AS Total  FROM prod_orangehrm.hs_hr_employee  GROUP BY job_title_code HAVING Total >= 5;

-- Display the number employees per gender 
SELECT emp_gender, COUNT(*) FROM prod_orangehrm.hs_hr_employee WHERE emp_gender IS NOT NULL GROUP BY emp_gender;

-- Display the number of employees per gender for total > 10 and shouldn't be NULL
SELECT emp_gender, COUNT(*) FROM prod_orangehrm.hs_hr_employee WHERE emp_gender IS NOT NULL GROUP BY emp_gender HAVING COUNT(*) > 10;

						#----------------------------Homework03--------------------------#
-- i. Verify how many Motorcycles we have in the products table
SELECT productLine, COUNT(quantityInStock) AS MotorcycleCount FROM products GROUP BY productLine Having productLine = 'Motorcycles';

-- ii. Find the largest, smallest and average amount of payments
SELECT MAX(amount) AS LargestAmount, MIN(amount) AS SmallestAmount, AVG(amount) AS Average FROM payments;

-- iii. Find the total amount of payments for every 'customerNumber' in payments table
SELECT SUM(amount) AS TotalAmount FROM payments GROUP BY customerNumber;
SELECT customerNumber, SUM(amount) AS TotalAmount FROM payments GROUP BY customerNumber;

-- iV. Find the total amount of payments for every 'customerNumber' that has paid less than 50000 in total.
SELECT customerNumber, SUM(amount) AS TotalAmount FROM payments GROUP BY customerNumber Having SUM(amount) < 50000;

					#--------------------------EndOfHomework03--------------------------#
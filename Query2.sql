						#------------ ORDER BY Keyword ----------------#
SELECT * FROM employees; -- > default order, numeric employeeNumber

SELECT * FROM employees ORDER BY lastName DESC; -- > display employees ordered by their last names(descending)
SELECT * FROM employees ORDER BY firstName; -- > by default is ASC (ascending)
SELECT * FROM employees ORDER BY lastName, firstName DESC; -- > last name first(abc) and firstName second (cba)
SELECT * FROM employees ORDER BY lastName, firstName ASC; -- > last name first (abc) and firstName second (abc)
SELECT * FROM employees ORDER BY lastName DESC, firstName; -- > last name first asc(cba) and firstName second (abc)

# < employees that have an officeCode 4 ordered by their firstName >
SELECT * FROM employees WHERE officeCode = 4 ORDER BY firstName;

#< display all the offices that DO NOT have a State >
SELECT * FROM offices WHERE state IS NULL;

#< display all the offices that DOES HAVE a State >
SELECT * FROM offices WHERE state IS NOT NULL;

		#----------------------------- TASK01 ------------------------#
-- I. How to display information about customers who do not have postal code?
SELECT * FROM customers WHERE postalCode IS NULL;

-- II. How to find employees first name, last name whose job title is "Sales Rep" and display first names in alphabetical order.
SELECT * FROM employees WHERE jobTitle = 'Sales Rep' ORDER BY firstName;

-- III. How to display information about all offices that have address line 2. We want to see offices sorted by city from Z-A?
SELECT * FROM offices WHERE addressLine2 IS NOT NULL ORDER BY city DESC;

		#-------------------------- EndOfTask01 ----------------------#

		#--------------------< AND | OR | NOT > Keyword >----------------------#
SELECT * FROM employees WHERE lastName = 'Patterson' AND jobTitle = 'Sales Rep'; -- > filter by BOTH conditions
SELECT * FROM employees WHERE lastName = 'Patterson' OR jobTitle = 'Sales Rep'; -- > filter by One OR the Other
#first Way
SELECT * FROM employees WHERE jobTitle != 'Sales Rep'; -- > NOT equal
#second WAy
SELECT * FROM employees WHERE NOT jobTitle = 'Sales Rep';

		#---------------------< IN | BETWEEN Keyword >--------------------#
-- SELECT * FROM employees WHERE lastName = 'Patterson' OR lastName = 'Firrelli' OR lastName = 'Bondur'
-- using IN keywork we can make cleaner: 
SELECT * FROM employees WHERE lastName IN  ('Patterson','Firrelli','Bondur');

							-- Filtering with BETWEEN
SELECT * FROM customers WHERE salesRepEmployeeNumber BETWEEN 1300 AND 1400;
-- we can also use greater than|less than
SELECT * FROM customers WHERE salesRepEmployeeNumber >= 1300 AND salesRepEmployeeNumber <= 1400;

		#---------------------------TASK02----------------------#
-- I. Display products that have a buy price greater than or equal to 50.0 that are classic cars.
SELECT * FROM products WHERE productLine = 'Classic Cars' AND buyPrice >= 50.0;

-- II. List product names and product lines that are planes or ships and display by product name in alphabetical order.
SELECT productName, productLine FROM products WHERE productLine = 'Planes' OR productLine = 'Ships' ORDER BY productName;
SELECT productName, productLine FROM products WHERE productLine IN ('Planes','Ships') ORDER BY productName;
 
-- III. Display all information of customers that live in CA, NY, CT. We want to see customers sorted by city from Z-A?
SELECT * FROM customers WHERE state IN ('CA','NY','CT') ORDER BY city DESC;
			#----------------------EndOfTask02------------------#
            
            #---------------------< LIKE Keyword >-------------------------#
            -- > % matches any amount of chars
            -- > _ represents a single character
            
SELECT * FROM employees WHERE lastName LIKE 'B%'; -- > display employees whose lastName starts with B
SELECT * FROM employees WHERE lastName LIKE 'K%g'; -- > employees whose lastName starts with K and ends with g
SELECT * FROM employees WHERE firstName LIKE 'L%e'; -- > employees whose firstName starts with L and ends with e
SELECT * FROM customers WHERE customerName LIKE '%la%'; -- > customers whose customerName has 'la' anywhere
SELECT * FROM customers WHERE contactFirstName LIKE 'J_n'; -- > Theres just ONE letter between J and n
SELECT * FROM customers WHERE phone LIKE '%5555'; -- > phone number that ENDS with 5555;

				#----------------------------Homework02--------------------------#
-- 1. Display all employees whose last name ends with ‘n’.
SELECT * FROM employees WHERE lastName LIKE '%n';

-- 2. Display all offices that are not located in USA.
SELECT * FROM offices WHERE country != 'USA';
SELECT * FROM offices WHERE NOT country = 'USA';

-- 3. Verify all orders that was shipped from January 1st of 2004 until December 31st of 2004. Order by ship date.
SELECT * FROM orders WHERE shippedDate BETWEEN '2004-01-01' AND '2004-12-31' ORDER BY shippedDate;

-- 4. Display all products that have Ford in their product names and have a buy price greater than 50. 
# Do not forget to sort products by buy price incrementing.
SELECT * FROM products WHERE buyPrice >=50 AND productName LIKE '%Ford%' ORDER BY buyPrice;
SELECT * FROM products WHERE productName LIKE '%FORD%' AND buyPrice > 50 ORDER BY buyPrice;

-- 5. Verify all the employees who report to 1102,1088 or 1143.
SELECT * FROM employees WHERE reportsTo IN (1102,1088,1143);
-- We can use OR for the same question
	-- SELECT * FROM employees WHERE reportsTo = 1102 OR reportsTo = 1088 OR reportsTo = 1143;

-- 6. How to display contact first name, last name, phone number of customers who don’t have state entered.
SELECT contactFirstName,contactLastName,phone FROM customers WHERE state IS NULL;

				#--------------------------EndOfHomework02--------------------------#

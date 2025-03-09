# We can comment a query either by < # > or < -- > 
-- USE classicmodels;
-- We are retrieving custumerNumber attribute from custumers table -> in classicmodels schema
SELECT customerNumber FROM customers;

-- We are retrieving custumerNumber and Name attributes from customers table
SELECT customerNumber, customerName FROM customers;

-- Retrieving the whole customer table (all columns)
SELECT * FROM customers;
SELECT * FROM employees;

#---------------------------------------- TASK ----------------------------------------------#
-- I. How can you display all the data in "book" table?
USE LibraryMgmt;
SELECT * FROM book;

-- II. How can you display Book Name and Category Id from "book" table?
USE LibraryMgmt;
SELECT BookName, Bookid FROM book;

-- III. How can you display all Student Names from "student" table?
USE demoDB;
SELECT FirstName, LastName FROM Students;

-- IV. How can you display Book Id, Student Id, Borrow Date from "bookborrow"?
USE LibraryMgmt;
SELECT BookBorrowId, Bookid, BorrowDate FROM bookborrow;

-- V. Please display all information from "bookcategory" Table?
USE LibraryMgmt;
SELECT * FROM bookcategory;

#---------------------------------------------END OF TASK----------------------------------------#

	-- < DISTINCT keyword >
SELECT bookcategoryid FROM book; -- > display all attribute elements(ALL rows from that category)
SELECT DISTINCT bookcategoryid FROM book; -- > by adding distinct we are filtring the attributes ( no repetition)
	#Example 2:
SELECT * FROM student;
SELECT DISTINCT StudentDiscipline FROM student;

	-- < WHERE keyword >
SELECT * FROM book;
SELECT * FROM book WHERE BookCategoryID > 3 ; -- keep only records with category id > 3
SELECT * FROM book WHERE BookName = 'AWS'; -- Display all records from book that have a bookName = "AWS"
SELECT * FROM book WHERE BookName <> 'AWS'; -- Display all records from book that have a bookName no equal to "AWS"

	# Query in HRM DB Schema 
SELECT * FROM prod_orangehrm.hs_hr_employee;
SELECT * FROM prod_orangehrm.hs_hr_employee WHERE emp_lastname = 'White';
SELECT * FROM prod_orangehrm.hs_hr_employee WHERE emp_firstname = 'Jacqueline';

#------------------------------------ HOMEWORK 1 -------------------------------------#
--    i. How can we display the name of the book with id 5?
SELECT BookId FROM book WHERE BookId = 5;

--   ii. How can you display unique book category ids from the “book” table?
SELECT DISTINCT BookCategoryId FROM book;

--   iii. How to display student name and student discipline for student with id 1006?
SELECT StudentName, StudentDiscipline FROM student WHERE StudentID = 1006;

--   iv. How to display all the information of the books that have a category greater or equal to 3?
SELECT * FROM book WHERE BookCategoryId >=3;

#-----------------------------------EndOfHomework1------------------------------------#

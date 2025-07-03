SHOW VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;
DROP DATABASE Onlinebookstore;
CREATE DATABASE OnlineBookstore;
USE OnlineBookstore;
CREATE TABLE Books (
    Book_ID SERIAL PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Published_Year INT,
    Price NUMERIC(10, 2),
    Stock INT
);
CREATE TABLE Customers (
    Customer_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    Country VARCHAR(150)
);
CREATE TABLE Orders (
    Order_ID SERIAL PRIMARY KEY,
    Customer_ID INT REFERENCES Customers(Customer_ID),
    Book_ID INT REFERENCES Books(Book_ID),
    Order_Date DATE,
    Quantity INT,
    Total_Amount NUMERIC(10, 2)
);
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Books;


CREATE TABLE Customers (
    Customer_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    Country VARCHAR(150)
);

CREATE TABLE Books (
    Book_ID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Published_Year INT,
    Price DECIMAL(10, 2),
    Stock INT
);

CREATE TABLE Orders (
    Order_ID INT AUTO_INCREMENT PRIMARY KEY,
    Customer_ID INT,
    Book_ID INT,
    Order_Date DATE,
    Quantity INT,
    Total_Amount DECIMAL(10, 2),
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID),
    FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID)
);

select * from Books;

#1) Retrieve all books in the "Fiction" genre
select * from Books where Genre= "Fiction";

#2) Find books published after the year 1950
select * from Books where Published_Year > 1950;

#3) List all customers from the Canada
select * from Customers;
select * from Customers where Country = "Canada";

#4) Show orders placed in November 2023

select * from Orders 
where Order_Date 
between "2023-11-01" and "2023-11-30";

#5) Retrieve the total stock of books available
select sum(stock) as total_stock from Books;

#6) Find the details of the most expensive book
select max(Price) as maximum_cost_of_book from Books;
select * from Books order by Price desc;
select * from Books order by Price desc limit 1;

#7) Show all customers who ordered more than 1 quantity of a book
select * from Orders where Quantity > 1;

#8) Retrieve all orders where the total amount exceeds $20
select * from orders where Total_Amount >20;

#9) List all genres available in the Books table
select DISTINCT Genre from Books;

#10) Find the book with the lowest stock
select Title from Books order by stock asc limit 1;

#11) Calculate the total revenue generated from all orders
select sum(Total_Amount) as revenue from Orders;

#ADVANCED QUESTION 

#1) Retrieve the total number of books sold for each genre
select b.Genre, sum(o.Quantity) as total_quantity
from Orders as o
join Books as b 
on b.Book_ID = o.Book_ID
GROUP BY b.Genre;

#2) Find the average price of books in the "Fantasy" genre
select avg(price) from Books where Genre = "Fantasy";

#3) List customers who have placed at least 2 orders
select c.Name, o.Customer_ID, count(o.order_ID)
from Orders as o
join Customers as c
on o.Customer_ID = c.Customer_ID
group by o.Customer_ID, c.Name
having count(o.Order_ID) >= 2;

#4) Top selling book
select b.Title, o.Book_ID, count(o.Order_ID)
from Books as b
join Orders as o 
on b.Book_ID = o.Book_ID
group by b.Title, o.Book_id 
order by count(o.Order_ID) desc LIMIT 1;


#5) Show the top 3 most expensive books of 'Fantasy' Genre
select * from Books 
where genre = "Fantasy" 
order by Price desc
limit 3; 

#6) Retrieve the total quantity of books sold by each author
SELECT * FROM Orders;
select b.Author, sum(o.Quantity)
from Books as b 
join Orders as o
on b.Book_ID = o.Book_ID
group by b.Author
order by sum(o.Quantity) desc;

#7) List the cities where customers who spent over $30 are located
select distinct c.City,c.Customer_ID, sum(o.Total_Amount)
from Customers as c
join Orders as o
on c.Customer_ID = o.Customer_ID
group by c.City, c.Customer_ID
having sum(o.Total_Amount) > 30;

#8) Find the customer who spent the most on orders
select distinct c.Name, sum(o.Total_Amount)
from Customers as c
join Orders as o
on c.Customer_ID = o.Customer_ID
group by  c.Name
order by sum(o.Total_Amount) desc
limit 1;

#9) Calculate the stock remaining after fulfilling all orders
select b.Title, b.Book_ID, b.Stock, coalesce(sum(Quantity),0) as order_quantity,
 b.Stock-coalesce(sum(Quantity),0) as remaining quantity
 from Books b
 left join Orders o 
 on b.Book_ID = o.Book_ID
 group by b.Book_ID
 order by b.Book_ID desc;














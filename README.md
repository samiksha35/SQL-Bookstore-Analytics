# SQL Bookstore Analysis 📚

This is a beginner-friendly SQL project where I created and analyzed a mock **Online Bookstore** database using **MySQL Workbench**.

---

## 📌 Datasets & Tables
- **Books**
- **Customers**
- **Orders**

I wrote raw SQL queries to explore:
- Best-selling books and genres
- Revenue, order stats, and customer behavior
- Stock management post-sales

---

## 🛠 Tools Used
- MySQL Workbench (local setup)
- SQL (DDL + DML queries)
- CSV-style data import (manual)

---

## ✅ Skills Showcased
- Relational Schema Design (Primary Keys, Foreign Keys)
- SQL Joins, Aggregations, GROUP BY, HAVING
- Business-focused querying (sales, revenue, stock, loyalty)
- Debugging table creation & foreign key errors



---
## 📸 Screenshots
https://github.com/samiksha35/SQL-Bookstore-Analytics/blob/main/eer_diagram.png


---

## 🚀 Sample Queries

```sql
-- Top 3 best-selling genres
SELECT b.Genre, SUM(o.Quantity) as Total_Sold
FROM Orders o
JOIN Books b ON o.Book_ID = b.Book_ID
GROUP BY b.Genre
ORDER BY Total_Sold DESC
LIMIT 3;
# SQL-Bookstore-Analytics
A beginner SQL project using MySQL Workbench to analyze bookstore data — includes schema design, queries, and insights.

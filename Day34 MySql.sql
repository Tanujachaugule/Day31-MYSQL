UC 1:- Ability to create a payroll
======  service database
      - Using MySQL Client use create database
       query to create a payroll_service
       database
        - Also you can see the DB created by
       using show database query
       - And go to the database created by using
       use payroll_service query

mysql> create database payroll_service;
Query OK, 1 row affected (0.01 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| payroll_service    |
| performance_schema |
| rfp                |
| sakila             |
| sys                |
| tanuja             |
| world              |
+--------------------+
9 rows in set (0.04 sec)

mysql> use payroll_service;
Database changed
=============================================================================================================================================================

UC 2:- Ability to create a employee payroll table
=====   in the payroll service database to
       manage employee payrolls
        - Use payroll_service database in MySQL Client
          - Use Create Table employee_payroll Query
       to create employee payroll table with columns id,
       name, salary and start date as column. Note Id is set to
       auto increment.
          - Understand the SQL data types to be used for the
       table
         - Note: SQL Queries as case insensitive

mysql> CREATE TABLE employee_payroll (id int AUTO_INCREMENT, name VARCHAR(55), salary double, start date, PRIMARY KEY (id));
Query OK, 0 rows affected (0.04 sec)

mysql> show tables;
+---------------------------+
| Tables_in_payroll_service |
+---------------------------+
| employee_payroll          |
+---------------------------+
1 row in set (0.01 sec)

mysql> describe employee_payroll;
+--------+-------------+------+-----+---------+----------------+
| Field  | Type        | Null | Key | Default | Extra          |
+--------+-------------+------+-----+---------+----------------+
| id     | int         | NO   | PRI | NULL    | auto_increment |
| name   | varchar(55) | YES  |     | NULL    |                |
| salary | double      | YES  |     | NULL    |                |
| start  | date        | YES  |     | NULL    |                |
+--------+-------------+------+-----+---------+----------------+
4 rows in set (0.01 sec)
====================================================================================================================================================================
UC 3:-  Ability to create employee
======= payroll data in the payroll
        service database as part of
       CRUD Operation - Use payroll_service database in
        MySQL Client
       - Use INSERT INTO employee_payroll
       Query to create employees payroll
          data into the employee_payroll table

mysql> INSERT INTO employee_payroll (name,salary,start) VALUES ('Tanuja', 50000, '2022-01-06');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO employee_payroll (name,salary,start) VALUES ('Tanmay', 40000, '2021-01-06');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO employee_payroll (name,salary,start) VALUES ('Avinash', 55000, '1995-05-09');
Query OK, 1 row affected (0.00 sec)


===================================================================================================================================================================
UC 4:-   Ability to retrieve all the
=======   employee payroll data that is
          added to payroll service
          database
         - Use payroll_service database in MySQL
             Client
         - Use SELECT * FROM employee_payroll to
          retrieve all the data from the
           employee_payroll table

mysql> select * from employee_payroll;
+----+---------+--------+------------+
| id | name    | salary | start      |
+----+---------+--------+------------+
|  1 | Tanuja  |  50000 | 2022-01-06 |
|  2 | Tanmay  |  40000 | 2021-01-06 |
|  3 | Avinash |  55000 | 1995-05-09 |
+----+---------+--------+------------+
3 rows in set (0.00 sec)

====================================================================================================================================================================

UC 5:-  Ability to retrieve salary data for a particular
 ======  employee as well as all employees who have
        joined in a particular data range from the
         payroll service database
        - Use SELECT salary FROM employee_payroll
         WHERE name = 'Bill’ Query to View Bill’s salary
       - Use Select query with Where condition View employees
         between start dates
        - Query: WHERE start BETWEEN CAST('2018-01-01'
         AS DATE) AND DATE(NOW());
          - Note: Where Condition Clause is used to retrieve the row needed
         from the table
        - Note: Use of Database Functions like CAST() and NOW() in the
         Query

mysql> SELECT salary FROM employee_payroll WHERE name = 'Avinash';
+--------+
| salary |
+--------+
|  55000 |
+--------+
1 row in set (0.00 sec)

mysql> SELECT * FROM employee_payroll WHERE start BETWEEN CAST('2023-03-01' AS DATE) AND DATE(NOW());
+----+-------+--------+------------+
| id | name  | salary | start      |
+----+-------+--------+------------+
|  5 | Manvi | 100000 | 2023-03-01 |
+----+-------+--------+------------+
1 row in set (0.00 sec)

===================================================================================================================================================================

UC 6:- Ability to add Gender to Employee
======= Payroll Table and Update the Rows to
         reflect the correct Employee Gender
       - Use payroll_service database in MySQL Client
        - Use Alter Table Command to add Field gender after
        the name field
         - Use Update Query to set the gender using where
         condition with the employee name
         - E.g. UPDATE employee_payroll set gender =
        'M' where name = 'Bill' or name =
          'Charlie';

mysql> ALTER TABLE employee_payroll ADD gender CHAR(1) AFTER name;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> UPDATE employee_payroll set gender = 'M' WHERE name = 'Tanmay';
Query OK, 0 rows affected (0.00 sec)
Rows matched: 1  Changed: 0  Warnings: 0

mysql> SELECT * FROM employee_payroll ;
+----+---------+--------+--------+------------+
| id | name    | gender | salary | start      |
+----+---------+--------+--------+------------+
|  1 | Tanuja  | NULL   |  50000 | 2022-01-06 |
|  2 | Tanmay  | M      |  40000 | 2021-01-06 |
|  3 | Avinash | NULL   |  55000 | 1995-05-09 |
|  5 | Manvi   | NULL   | 100000 | 2023-03-01 |
+----+---------+--------+--------+------------+
4 rows in set (0.00 sec)

mysql> UPDATE employee_payroll set gender = 'F' WHERE name = 'Tanuja';
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE employee_payroll set gender = 'F' WHERE name = 'Manvi';
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE employee_payroll set gender = 'M' WHERE name = 'Avinash';
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM employee_payroll ;
+----+---------+--------+--------+------------+
| id | name    | gender | salary | start      |
+----+---------+--------+--------+------------+
|  1 | Tanuja  | F      |  50000 | 2022-01-06 |
|  2 | Tanmay  | M      |  40000 | 2021-01-06 |
|  3 | Avinash | M      |  55000 | 1995-05-09 |
|  5 | Manvi   | F      | 100000 | 2023-03-01 |
+----+---------+--------+--------+------------+
4 rows in set (0.00 sec)
==============================================================================================================================================================

UC 7:- Ability to find sum, average, min, max
======= and number of male and female
       employees
        - Use payroll_service database in MySQL Client
       - Use Database Function SUM, AVG, MIN, MAX, COUNT
       to do analysis by Male or Female.
        - Note: You will need to use GROUP BY GENDER grouping to
        get the result
       - E.g. SELECT SUM(salary) FROM employee_payroll
       WHERE gender = 'F' GROUP BY gender;

mysql> SELECT SUM(salary) FROM employee_payroll WHERE gender = 'F' GROUP BY gender;
Empty set (0.00 sec)


mysql> SELECT SUM(salary) FROM employee_payroll WHERE gender = 'F' GROUP BY gender;
+-------------+
| SUM(salary) |
+-------------+
|      150000 |
+-------------+
1 row in set (0.00 sec)


mysql> SELECT AVG(salary) FROM employee_payroll WHERE gender = 'F' GROUP BY gender;
+-------------+
| AVG(salary) |
+-------------+
|       75000 |
+-------------+
1 row in set (0.00 sec)

mysql> SELECT MIN(salary) FROM employee_payroll WHERE gender = 'F' GROUP BY gender;
+-------------+
| MIN(salary) |
+-------------+
|       50000 |
+-------------+
1 row in set (0.00 sec)


mysql> SELECT MAX(salary) FROM employee_payroll WHERE gender = 'F' GROUP BY gender;
+-------------+
| MAX(salary) |
+-------------+
|      100000 |
+-------------+
1 row in set (0.00 sec)

mysql> SELECT COUNT(salary) FROM employee_payroll WHERE gender = 'F' GROUP BY gender;
+---------------+
| COUNT(salary) |
+---------------+
|             2 |
+---------------+
1 row in set (0.00 sec)

=====================================================================================================================================================================
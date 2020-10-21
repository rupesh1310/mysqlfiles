1. CHECK HOW MANY EMPLOYEES ARE THERE ? 
ANS- SELECT * FROM "employees";

2. CHECK HOW MANY DEPARTMENTS ARE THERE ?
ANS- SELECT * FROM "public"."departments";


3. HOW MANY TIME HAS EMPLOYEE 1001 HAD A RAISE ?

4. WHAT TITLE DOES THE EMPLOYEE HAS ?
ANS- SELECT * FROM "public"."titles";

5. CONCAT 
ANS - SELECT * FROM titles;
	  SELECT CONCAT(emp_no, ' ', title) FROM titles;
	  SELECT CONCAT(emp_no, ' is a ', title) FROM titles;
	  SELECT CONCAT(emp_no, ' is a ', title) AS "Employee Title" FROM titles;

6. CONCATENATE THE FIRST AND LAST NAME OF THE EMPLOYEE INTO ONE COLUMN
	RENAME THE CONCATENATE COLUMN
ANS- SELECT emp_no, CONCAT(first_name, ' ', last_name) AS "full name" FROM employees;

7. RENAMING COLUMNS ?
ANS- SELECT emp_no AS "Employee #" FROM "public"."employees";
	  SELECT emp_no AS "Employee #", birth_date AS "Birthday", first_name AS "First name" FROM "public"."employees"; 


8. AGGREGATE FUNCTION ? 
ANS- SELECT count(emp_no) FROM "employees";
	 SELECT min(emp_no) FROM "employees";

9. GET THE HIGHEST SALARY AVIABLE ?
   GET THE TOTAL AMOUNT OF SALARIES PAID ?
ANS- SELECT max(salary) FROM "salaries";
	SELECT sum(salary) FROM "salaries";

10. SELECT THE EMPLOYEE WITH THE NAME MAYUMI SCHUELLER ?
	COMMENT ON YOUR QUERY WHAT IS HAPPENING ?
ANS- SELECT first_name, last_name FROM "public"."employees"
		/* filter on first name and last name to limit the amount of data returned
			and focus the filtering on a single person
		*/
	 WHERE first_name = 'Mayumi' AND last_name = 'Schueller' ;

11. To Check all the female employees ?
ANS- SELECT first_name FROM employees
	 WHERE gender = 'F';

12. How many female customers do we have from the state of Oregon(OR)
	AND New York(NY) ?
ANS- SELECT firstname, lastname, gender, state FROM customers
	 WHERE state = 'OR' AND gender = 'F' OR state = 'NY' AND gender = 'F';

	 SELECT firstname, lastname, gender, state FROM customers
	 WHERE (state = 'OR' OR state = 'NY') AND gender = 'F';

	 SELECT count(firstname) state FROM customers
	 WHERE (state = 'OR' OR state = 'NY') AND gender = 'F';

	 
13. AND and OR ?
ANS- SELECT first_name, last_name, gender, hire_date FROM employees
     WHERE first_name = 'Georgi' and last_name = 'Facello'
     AND hire_date = '1986-06-26' OR first_name = 'Bezalel' AND last_name = 'Simmel';

     SELECT first_name, last_name, hire_date FROM employees
     WHERE (first_name = 'Georgi' AND last_name = 'Facello' AND hire_date = '1986-06-26')
     OR (first_name = 'Bezalel' AND last_name = 'Simmel');

     SELECT first_name, last_name, hire_date FROM employees
     WHERE last_name = 'Facello'
     OR last_name = 'Simmel';
     

15. The NOT keyword 
	HOW MANY customers arent 55 ?
ANS- SELECT COUNT(age) FROM customers
	 WHERE NOT age = 55 AND NOT age = 20;


16. The COMPARISON Operator
	Who over the age of 44 has an income of 100000 ?

ANS-  SELECT COUNT(income)
	  FROM customers
	  WHERE age > 44 and income >= 100000;

17. The LOGICAL Operator


18. The Operator Precedence
	GET ME state and gender where you are: a female from Oregon OR
	a female from NY

ANS- SELECT state, gender FROM customers
	 WHERE gender = 'F' AND state = 'OR' OR state = 'NY';

	 SELECT state, gender FROM customers
	 WHERE gender = 'F' AND (state = 'OR' OR state = 'NY');

19. Priority chain
ANS- SELECT state, gender FROM customers
	 WHERE gender = 'F' AND state = 'OR'
	 OR gender = 'F' AND state = 'NY';

	 SELECT state, gender FROM customers
	 WHERE gender = 'F' AND (state = 'OR' OR state = 'NY');


20. Priority and Direction

	FILTER 1				FILTER 2

	1.SALARY > 10,000 		1.BETWEEN 21 AND 29
	2.FROM NY				2.SALARY LOWER THAN OR EQUAL							
	3. FEMALE 				TO 20,000
							3.FEMALE

ANS- (
		salary > 10000 AND state = 'NY'
		OR(
			(age > 20 AND age < 30)
			AND salary <= 20000
			)
		)  
		AND gender = 'F'



21. NULL VALUE
ANS- SELECT NULL = NULL;
	--RESULT : <NULL>
	SELECT 1 = 1;
	--RESULT : TRUE


22. The IS Operator
ANS- SELECT name, lastName from "Student"
	 WHERE lastName IS NOT NULL;
 	 
 	 SELECT * FROM <table>
 	 WHERE <field> = '' IS NOT FALSE;

 	 SELECT * FROM users
 	 WHERE age = 20 IS FALSE;

23. The NULL Coalescing
ANS- SELECT coalesce(<column>, 'Empty') AS column_alias
	 FROM <table>

	 SELECT coalesce(
	 	<column1>,
	 	<column2>,
	 	<column3>,
	 	'Empty') AS combined_columns
	 FROM <table>

	 SELECT coalesce(name, 'no name available'),
	 lastName FROM "Student";

	 SELECT sum(age) FROM "Student";

	 SELECT sum(coalesce(age, 200)) FROM
	 "Student";


24. VALUED LOGIC
ANS- SELECT <column>
	  FROM <table>
	 WHERE (<column> IS NULL)
	 OR (<column> IS NOT NULL);

	 SELECT * FROM "Student"
	 WHERE (age is null) OR (age is not null);

	 SELECT * FROM "Student"
	 WHERE (age = null) OR (not age = null);



25. BETWEEN + AND


26. IN keyword
ANS- SELECT * FROM <table>
	 WHERE <column> IN (value1, value2,...)

	 SELECT * FROM employees
	 WHERE emp_no IN(100001, 100006, 11008);

27. LIKE
ANS- SELECT first_name FROM employees
	 WHERE first_name LIKE 'M%';

	 -- In order to use like we need to build 
	 -- patterns to match.

28. CAST
	 --1 method
ANS- CAST(salary AS text);
	--2 method
	 salary::text;

29. ILIKE
ANS- name ILIKE 'MO%';
	 
	 SELECT * FROM employees
	 WHERE first_name LIKE 'G%er';

	 SELECT * FROM employees
	 WHERE first_name ILIKE 'G%ger';

30. Dates And Timezones
ANS- SHOW TIMEZONE;
	 SET TIMEZONE 'UTC';


31. TIMESTAMPS
ANS- SELECT now();
	 
	INSERT INTO timezones VALUES(
			TIMESTAMP WITHOUT TIME ZONE '2001-01-01 10:00:00-05',
			TIMESTAMP WITH TIME ZONE '2001-01-01 10:00:00-05'
	);
	

	 CREATE TABLE timezones (
	 	ts TIMESTAMP WITHOUT TIME ZONE,
	 	tz TIMESTAMP WITH TIME ZONE
	 );

	 SELECT * FROM timezones;



32. DATE FUNCTIONS
ANS- SELECT NOW()::date;
	 SELECT CURRENT_DATE;
	 -- FORMATTING DATES
	 SELECT TO_CHAR(CURRENT_DATE, 'dd/mm/yyyy');



33. Date Difference And Casting
ANS- SELECT  NOW() - '1800/01/01';
	 SELECT date '1800/01/01';


34. Age Calculation
ANS- SELECT AGE('1800/01/01');
	 -- OUTPUT - ERROR
	 SELECT AGE(date '1800-01-01');
	 -- OUTPUT - 220years 4 months

	 -- FOR MY AGE
	 SELECT AGE(date '1992/11/13', date '1800/01/01');


35. Extracting Information
ANS- SELECT EXTRACT (DAY FROM date '1996/10/13') AS DAY;
	 SELECT DATE_TRUNC('year', date '1996/10/13');



36.  Intervals
ANS- SELECT * 
	 FROM orders
	 WHERE purchaseDate <= now() - interval '30 days'


	 INTERVAL '1 year 2 months 3 days';
	 INTERVAL '2 weeks ago';
	 INTERVAL '1 year 3 hours 20 minutes';


	 SELECT
	 	EXTRACT (
	 		year
	 		FROM
	 			INTERVAL '5 years 20 months'
	 	);



37.   DISTINCT
ANS- SELECT DISTINCT salary, from_date FROM salaries;



38. Sorting Data
ANS- SELECT * FROM customers
	 ORDER BY name, lastName DESC;

	 SELECT first_name, last_name FROM employees
	 ORDER BY first_name DESC, last_Name DESC;



39. Multi Table SELECT

ANS- SELECT a.emp_no,
	 		CONCAT(a.first_name, a.last_name) as "name",
	 		b.salary
	 FROM employees as a, salaries as b
	 WHERE a.emp_no = b.emp_no;

 
	 SELECT a.emp_no, b.salary FROM employees AS a, salaries AS b
	 WHERE a.emp_no = b.emp_no
	 ORDER BY a.emp_no;


40. Inner Join

ANS- SELECT a.emp_no,
	 		CONCAT(a.first_name, a.last_name) as "name",
	 		b.salary
	 FROM employees as a
	 INNER JOIN salaries as b ON b.emp_no = a.emp_no
	 ORDER BY a.emp_no ASC;


	 --TITLE CHANGE EXAMPLE
	 SELECT a.emp_no,
	 		CONCAT(a.first_name, a.last_name) as "name",
	 		b.salary,
	 		c.title,
	 		c.from_date AS "promoted on"
	 FROM employees AS a
	 INNER JOIN salaries AS b ON a.emp_no = b.emp_no
	 INNER JOIN titles AS c ON c.emp_no = a.emp_no
	 AND c.from_date = (b.from_date + interval '2 days')
	 ORDER BY a.emp_no;


	 SELECT a.emp_no, b.salary, b.from_date, c.title
	 FROM employees AS a
	 INNER JOIN salaries AS b ON b.emp_no = a.emp_no
	 INNER JOIN titles AS c ON c.emp_no = a.emp_no
	 AND (b.from_date + INTERVAL '2 days') = c.from_date
	 ORDER BY a.emp_no ASC, b.from_date ASC;


	 SELECT a.emp_no, b.salary, b.from_date, c.title
	 FROM employees AS a
	 INNER JOIN salaries AS b ON b.emp_no = a.emp_no
	 INNER JOIN titles AS c 
	 	ON c.emp_no = a.emp_no
	 	AND (
	 		b.from_date = c.from_date
	 		OR (b.from_date + INTERVAL '2 days') = c.from_date
	 		)
	 ORDER BY a.emp_no ASC, b.from_date ASC;



	 --SOLUTION
	 SELECT a.emp_no,
	 		CONCAT(a.first_name, a.last_name) AS "name",
	 		b.salary,
	 		coalesce(c.title, 'No title change'),
	 		COALESCE(c.from_date::text, '-') AS "title taken on"
	 FROM employees AS a
	 INNER JOIN salaries AS b ON a.emp_no = b.emp_no
	 INNER JOIN titles AS c
	 ON c.emp_no = a.emp_no AND(
	 	C.from_date = (b.from_date + INTERVAL '2 days') OR
	 	c.from_date = b.from_date
	 	)
	 ORDER BY a.emp_no;




41. SELF JOIN

ANS- SELECT a.id, a.name AS "employee", b.name AS "supervisor name"
	 FROM employee AS a, employee AS B
	 WHERE a.supervisorId = b.id;


	 SELECT a.id, a.name AS "employee", b.name 
	 AS "supervisor name"
	 FROM employee AS a
	 INNER JOIN employee AS b
	 ON a.supervisorId = b.id;



42. Outer Join

ANS- SELECT * 
	 FROM <table A> AS a
	 LEFT [OUTER] JOIN <table B> AS b
	 ON a.id = b.id;

	 --YOU WANT TO KNOW HOW MANY EMPLOYEES AREN'T MANAGERS
	 SELECT COUNT(emp.emp_no)
	 FROM employees AS emp
	 LEFT JOIN dept_manager AS dep ON emp.emp_no = dep.emp_no
	 WHERE dep.emp_no IS NULL;


	 SELECT a.emp_no, b.salary, COALESCE(c.title, 'no title change')
	 FROM employees AS a
	 INNER JOIN salaries AS b ON b.emp_no = a.emp_no
	 LEFT JOIN titles AS c ON c.emp_no = a.emp_no
	 AND (c.from_date = b.from_date OR c.from_date = b.from_date + INTERVAL '2 days')
	 ORDER BY a.emp_no;



42. USING Keyword

ANS- SELECT e.emp_no, e.first_name, d.dept_name
	 FROM employees AS e
	 INNER JOIN dept_emp AS de USING(emp_no)
	 INNER JOIN departments AS d USING(dept_no)


43. GROUP BY

ANS- SELECT dept_no, COUNT(emp_no)
	 FROM dept_emp
	 -- ORDER BY dept_no
	 GROUP BY dept_no;

	 -- Order of operation
	 -- FROM->WHERE->GROUP BY->HAVING->SELECT->ORDER


44. HAVING keyword

ANS- SELECT col1, COUNT(col2)
	 FROM <table>
	 WHERE col2 > X
	 GROUP BY col1
	 HAVING col1 === Y;



	 SELECT d.dept_name, COUNT(e.emp_no) AS "# of employees"
	 FROM employees AS e
	 INNER JOIN dept_emp AS de ON de.emp_no = e.emp_no
	 INNER JOIN departments AS d ON de.dept_no = dept_no
	 WHERE e.gender = 'F'
	 GROUP BY d.dept_name
	 HAVING COUNT(e.emp_no) > 25000



45.  Ordering Grouped Data

ANS- SELECT d.dept_name, COUNT(e.emp_no) AS "# of employees"
	 FROM employees AS e
	 INNER JOIN dept_emp AS de ON de.emp_no = e.emp_no
	 INNER JOIN departments AS d ON de.dept_no = dept_no
	 GROUP BY d.dept_name
	 ORDER BY COUNT(e.emp_no) DESC


46. Group By Mental Model

ANS- SELECT emp_no, MAX(from_date), MAX(salary)
	 FROM salaries
	 GROUP BY emp_no;

	 SELECT emp_no, MAX(from_date)
	 FROM salaries
	 GROUP BY emp_no
	 HAVING MAX(from_date);
		 	


47.  Grouping Sets

ANS- --UNION
	 --1
	 SELECT col1, SUM(col2)
	 FROM table
	 GROUP BY col1

	 UNION

	 SELECT SUM(col2)
	 FROM table


	 --2
	 SELECT NULL AS "prod_id", sum(ol.quantity)
	 FROM orderlines AS ol

	 UNION

	 SELECT prod_id AS "prod_id", sum(ol.quantity)
	 FROM orderlines AS ol
	 GROUP BY prod_id 
	 ORDER BY prod_id DESC;


	 --3
	 -- SELECT NULL AS "prod_id", sum(ol.quantity)
	 -- FROM orderlines AS ol

	 -- UNION

	 SELECT prod_id AS "prod_id", orderlineid, sum(ol.quantity)
	 FROM orderlines AS ol
	 GROUP BY 
	 	GROUPING SETS (
	 		(),
	 		(prod_id),
	 		(orderlineid)
	 		) 
	 ORDER BY prod_id, orderlineid DESC;




48. Rollup

ANS- SELECT EXTRACT (YEAR FROM orderdate) AS "year",
			EXTRACT (MONTH FROM orderdate) AS "month",
			EXTRACT (DAY FROM orderdate) AS "day",
			sum(ol.quantity)
	 FROM orderlines AS ol
	 GROUP BY 
	 	GROUPING SETS (
	 		(EXTRACT (YEAR FROM orderdate)),
	 		(
	 			EXTRACT (YEAR FROM orderdate),
	 			EXTRACT (MONTH FROM orderdate)

	 		),
	 		(
	 			EXTRACT (YEAR FROM orderdate),
	 			EXTRACT (MONTH FROM orderdate),
	 			EXTRACT (DAY FROM orderdate)
	 		),

		 		(EXTRACT (MONTH FROM orderdate)),
		 		(EXTRACT (DAY FROM orderdate)),
		 		()
	 		)
	 	ORDER BY 
	 		EXTRACT (YEAR FROM orderdate),
	 		EXTRACT (MONTH FROM orderdate),
	 		EXTRACT (DAY FROM orderdate)




49. WINDOW

ANS- --Window functions create a new column based on functions performed
	--on a subset or "WINDOW" of the data


	--PARTITION BY -> Is used to divide rows into groups to apply the
	--				functions against.
	-- example -> AVG(s.salary) OVER() AS "average global salary"

	window_function(arg1, arg2,..) OVER (
		[PARTITION BY partition_expression]
		[ORDER BY sort_expression [ASC | DESC] [NULLS {FIRST | LAST}] )


	SELECT
		*,
		MAX(salary) OVER()
	FROM salaries
	-- LIMIT 100;
	WHERE salary < 70000




50. PARTITION BY

ANS- SELECT
		*,
		-- d.dept_name,
		AVG(salary) OVER(
			PARTITION BY d.dept_name
			)
	 FROM salaries
	 JOIN dept_emp USING (emp_no)
	 JOIN departments AS d USING (dept_no)



51. Order By Acting Strange

ANS- SELECT emp_no,
			COUNT(salary) OVER(
				-- ORDER BY emp_no
				PARTITION BY emp_no
				)
	 FROM salaries


52. Using Framing in window function

ANS- --When using a frame clause in a window function we can
	 ---create a sub-range or frame.

	 PARTITION BY category ORDER BY price RANGE BETWEEN UNBOUNDED PRECEDING
	 AND CURRENT ROW

	 SELECT emp_no,
	 		salary,
	 		COUNT(salary) OVER(
	 			PARTITION BY emp_no
	 			ORDER BY salary
	 			-- RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
	 			-- ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
	 			-- RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
	 			ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
	 			
	 		)
	 FROM salaries



53. SOLVING CURRENT SALARY MYSTERY

ANS- --SOLVING USING WINDOW FUNCTION
	 SELECT DISTINCT e.emp_no,
	 	    e.first_name,
	 	    d.dept_name,
	 	    LAST_VALUE(s.salary) OVER(
	 	    	PARTITION BY e.emp_no
	 	    	ORDER BY s.from_date
	 	    	RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
	 	    	) AS "Current Salary"
	 FROM salaries AS s

	 JOIN employees AS a USING(emp_no)
	 JOIN dept_emp AS de USING(emp_no)
	 JOIN departments AS d USING(dept_no)

	 ORDER BY e.emp_no;

	 --SHORTHAND VERSION
	 SELECT
	 	  DISTINCT emp_no,
	 	  LAST_VALUE(s.from_date) OVER(
	 	  	  PARTITION BY s.emp_no
	 	  	  ORDER BY s.from_date
	 	  	  RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
	 	  	),
	 	  LAST_VALUE(salary) OVER(
	 	  	  PARTITION BY s.emp_no
	 	  	  ORDER BY s.from_date
	 	  	  RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
	 	  	)
	 FROM salaries AS s
	 JOIN dept_emp AS de USING (emp_no)



	 SELECT
	 	 DISTINCT emp_no,
	 	 s.from_date,
	 	 s.salary
	 FROM salaries AS s
	 JOIN dept_emp AS de USING (emp_no)
	 JOIN departments AS d USING (dept_no)




54.  FIRST_VALUE

ANS- --Return a value evaluated against the first row within its partition
	 -- QUES -> I want to know how my price compares to the item with the
	 -- lowest price in the same category

	 SELECT
	 	 prod_id,
	 	 price,
	 	 category,
	 	 first_value(price) OVER(
	 	 	PARTITION BY category ORDER BY price RANGE BETWEEN UNBOUNDED PRECEDING
	 	 	AND UNBOUNDED FOLLOWING
	 	 	)
	 	 FROM products

	 	 SELECT
	 	 prod_id,
	 	 price,
	 	 category,
	 	 min(price) OVER(PARTITION BY category) AS "cheapest in category"
	 	 FROM products




55. LAST_VALUE

ANS-  SELECT
		 prod_id,
		 price,
		 category,
		 LAST_VALUE(price) OVER(
		 	PARTITION BY category ORDER BY price
		 	RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
		 )
		 AS "most expensive in category"
	  FROM products





56. SUM

ANS- SELECT
		o.orderid,
		o.customerid,
		o.netamount,
		SUM(o.netamount) OVER(
			PARTITION BY o.customerid
			ORDER BY o.orderid
			) AS "cum sum"
		FROM orders AS o
		ORDER BY o.customerid


		-- EXECUTION QUERY
		SELECT
			o.orderid,
			o.customerid,
			o.netamount,
			SUM(o.netamount) OVER(
				PARTITION BY o.customerid
				ORDER BY o.orderid
				) AS "cum sum"
		FROM orders AS o
		ORDER BY o.customerid



57. ROW_NUMBER

ANS- --Number the current row within the partition starting from
	 --1 regardless of framing

	 SELECT
	 	prod_id,
	 	price,
	 	category,
	 	row_number() OVER(PARTITION BY category ORDER BY price) AS "position in
	 category by price"
	 FROM products



58. Conditional Statements

ANS- SELECT a,
				CASE WHEN a=1 THEN 'one'
					 WHEN a=2 THEN 'TWO'
					 ELSE 'other'
				END
	 FROM test;


	 --2
	 SELECT
	 	o.orderid,
	 	o.customerid,
	 	CASE
	 		WHEN o.customerid = 1
	 		THEN 'my first customer'
	 		ELSE 'not my customer'
	 	END,
	 	o.netamount
	 	FROM orders AS o
	 	ORDER BY o.customerid


	 	--3 CONDITIONAL FILTER
	 	SELECT
	 		o.orderid,
	 		o.customerid,
	 		o.netamount
	 	FROM orders AS o
	 	WHERE CASE WHEN o.customerid > 10 THEN o.netamount < 100 ELSE o.netamount >
	 	100 END
	 	ORDER BY o.customerid


	 	--4 IN AN AGGREGATE FUNCTION
	 	SELECT
	 		SUM(
	 			CASE
	 				WHEN o.netamount < 100
	 				then -100
	 				else o.netamount
	 				end 
	 			) as "returns",
	 			SUM(o.netamount) as "normal total"
	 		FROM order as o





59. NULLIF 

ANS- NULLIF(val_1, val_2)
	 NULLIF(0, 0) --NULL
	 NULLIF('ABC', 'DEF') --ABC




60. VIEW SYNTAX

ANS- --CREATING A VIEW
	 CREATE VIEW view_name AS query;

	 --UPDATING A VIEW
	 CREATE OR REPLACE <view name>
	 AS query;

	 --RENAME
	 ALTER VIEW <view name> RENAME TO <view name>;

	 --DELETE A VIEW
	 DROP VIEW [ IF EXISTS ] <view name>



61. USING VIEWS

ANS- 
	--CURRENT SALARY

	 -- SELECT * FROM last_salary_change
	 -- SELECT * FROM salaries
	 -- JOIN last_salary_change AS l USING(emp_no)
	 -- WHERE from_date = l.max 
	 -- ORDER BY emp_no

	 CREATE OR REPLACE VIEW last_salary_change AS 
	 SELECT e.emp_no,
	 		MAX(s.from_date)
	 FROM salaries AS s

	 JOIN employees AS e USING(emp_no)
	 JOIN dept_emp AS de USING(emp_no)
	 JOIN departments AS d USING(dept_no)

	 GROUP BY e.emp_no
	 ORDER BY e.emp_no;




62. INDEX SYNTAX

ANS- CREATE UNIQUE INDEX <name>
	 on <table> (column1, column2, ...);

	 -- DELETE A INDEX
	 DROP INDEX <name>;

	 -- unique index
	 CREATE UNIQUE INDEX <name>
	 on <table> (column1);

	 --EXAMPLE
	 EXPLAIN ANALYZE
	 SELECT "name", district, countrycode FROM city
	 WHERE countrycode IN ('TUN', 'BE', 'NL')


	 --CREATE AN INDEX
	 CREATE INDEX idx_countrycode
	 ON city (countrycode);


	 CREATE INDEX idx_countrycode
	 ON city (countrycode) WHERE countrycode IN ('TUN', 'BE', 'NL');

	 EXPLAIN ANALYZE
	 SELECT "name", district, countrycode FROM city
	 WHERE countrycode IN ('TUN', 'BE', 'NL');



63. INDEX ALGORITHMS

ANS- CREATE [UNIQUE] INDEX <name>
	 ON <table> USING <method> (column1, ....)

	 EXPLAIN ANALYZE
	 SELECT "name", district, countrycode
	 FROM city
	 WHERE countrycode = 'BEL' AND countrycode = 'TUN' AND 
	 countrycode = 'NLD';

	 -- GIN ALGORITHM "generalized inverted index"



	 --GIST "generalized search tree" useful in searching geometric data
	 --and full text



64. SUBQUERIES VS JOINS

ANS- SELECT title, price, (SELECT AVG(price)) from products)
	 as "global average  price"
	 -- FROM products
	 FROM(
	 SELECT * FROM products WHERE price < 10
 	) AS "products_sub"




65. SUBQUERIES AS TYPES

ANS- 	-- ALWAYS important to put subqueries on the right haside of the
		--  operation
		--always use single row operators with single row subquery

		--subqueries that return  null may not return results

		-- Types -> single row, multiple row, multiple column, corelated,
		--			nested
		
		--SINGLE ROW
		SELECT name, salary
		FROM salaries
		WHERE salary =
			(SELECT AVG(salary) FROM salaries);


		--Multiple row
		SELECT title, price, category
		FROM products
		WHERE category IN(
			SELECT category FROM categories
			WHERE categoryname IN ('Comedy', 'Family', 'Classics')
			)

		-- MULTIPLE COLUMNS
		SELECT emp_no, salary, dea.avg AS "Department average salary"
		FROM salaries AS s
		JOIN dept_emp AS de USING(emp_no)
		JOIN(
				SELECT dept_no, AVG(salary) FROM salaries AS s2
				JOIN dept_emp AS e USING(emp_no)
				GROUP BY dept_no
 			) AS dea USING(dept_no)
		WHERE salary > dea.avg



		--Co-related -> reference one or more column in outer statements
		SELECT emp_no, salary, from_date
		FROM salaries AS s
		WHERE from_date = (
			SELECT max(s2.from_date) AS max
			FROM salaries AS s2
			WHERE s2.emp_no = s.emp_no
		)
		ORDER BY emp_no




66. USING SUBQUERIES

ANS- SELECT
		first_name,
		last_name,
		AGE(birth_date)

	FROM employees
	WHERE AGE(birth_date) > (SELECT AVG(age(birth_date)) FROM
		employees)

	-- SHOW THE TITLE BY SALARY FOR EACH EMPLOYEE
	SELECT
		emp_no,
		salary,
		from_date,
		(SELECT title FROM titles AS t
			--referencing outside - correlated subquery
			WHERE t.emp_no = s.emp_no AND t.from_date = s.from_date)
			FROM salaries AS s
			ORDER BY emp_no



67. Ability to show the most recent employees salary
	 
ANS- 
	--EXPLAIN ANALYZE SELECT
	SELECT
		 emp_no,
		 salary AS "most recent salary",
		 from_date
	FROM salaries AS s
	WHERE from_date = (
		SELECT MAX(from_date)
		FROM salaries AS sp
		WHERE sp.emp_no = s.emp_no
		)
	ORDER BY emp_no ASC


	-- 2

	--EXPLAIN ANALYZE SELECT
	SELECT
		emp_no,
		salary AS "most recent salary",
		from_date
	FROM salaries AS s
	JOIN last_salary_change AS ls USING (emp_no)
	WHERE from_date = ls.max
	ORDER BY emp_no ASC	


	SELECT
		emp_no,
		salary AS "most recent salary",
		from_date
	FROM salaries AS s
	JOIN (
			SELECT emp_no, max(from_date) AS "max"
			FROM salaries AS sp
			GROUP BY emp_no
		) AS ls USING (emp_no)
	WHERE ls.max = from_date
	ORDER BY emp_no ASC



68. SUBQUERY Operator

ANS- --EXISTS
	 SELECT firstname, lastname, income
	 FROM customers as c
	 WHERE EXISTS (
	 	SELECT * FROM orders AS o
	 	WHERE c.customerid = o.customerid AND totalamount > 400
	 	) AND income > 90000


	 -- IN -> To check if the value is equal to any of the rows in
	 -- the return (null yields null)

	 SELECT prod_id
	 FROM products
	 WHERE category IN (
	 	SELECT category FROM categories
	 	WHERE categoryname IN ('Comedy', 'Family', 'Classics')
	 	)

	 -- NOT IN -> Checks the value is not equal to any of 
	 -- the rows in the return (null yields null)

	 SELECT prod_id
	 FROM products
	 WHERE category IN (
	 	 SELECT category FROM categories
	 	 WHERE categoryname NOT IN ('Comedy', 'Family', 'Classics')
	 	)

	 -- ANY/SOME -> check each row against the operator
	 --and if any comparison matches return true

	 SELECT prod_id
	 FROM products
	 WHERE category = ANY (
	 		SELECT category FROM categories
	 		WHERE categoryname IN ('Comedy', 'Family', 'Classics');
	 	)

	 -- ALL -> check each row against the operator and
	 -- if all comparisons match return true
	 SELECT prod_id, title, sales
	 FROM products
	 JOIN inventory AS i USING (prod_id)
	 WHERE i.sales > ALL (
	 		SELECT AVG(sales) FROM inventory
	 		JOIN products AS p1 USING (prod_id)
	 		GROUP BY p1.category
	 	)


	 -- SINGLE VALUE COMPARISONS -> Subquery must return a single row
	 -- check comparator against row
	 SELECT prod_id
	 FROM products
	 WHERE category = (
	 		SELECT category FROM categories
	 		WHERE categoryname IN ('Comedy')
	 	)





--- student database
CREATE TABLE student(
	student_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
	first_name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255) NOT NULL,
	email VARCHAR(255) NOT NULL,
	date_of_birth DATE NOT NULL
);



--TABLE CONSTRAINT
CREATE TABLE student (
	student_id UUID DEFAULT uuid_generate_v4(),
	first_name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255) NOT NULL,
	email VARCHAR(255) NOT NULL,
	date_of_birth DATE NOT NULL,
	CONSTRAINT pk_student_id PRIMARY_KEY (student_id)	
);

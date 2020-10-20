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

	 
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
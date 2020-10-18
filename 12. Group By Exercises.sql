/*
*  How many people were hired on did we hire on any given hire date?
*  Database: Employees
*  Table: Employees
*/

SELECT hire_date, COUNT(hire_date) AS "amount"
FROM employees
GROUP BY hire_date
ORDER BY "amount" DESC;


/*
*  Show me all the employees, hired after 1991, that have had more than 2 titles
*  Database: Employees
*/

SELECT e.emp_no, COUNT(t.title) AS "amount of titles"
FROM employees AS e
JOIN titles AS t USING(emp_no)
WHERE EXTRACT(YEAR FROM e.hire_date) > 1991
GROUP BY e.emp_no
HAVING COUNT(t.title) > 2
ORDER BY e.emp_no;



/*
*  Show me all the employees that have had more than 15 salary changes that work in the department development
*  Database: Employees
*/

SELECT e.emp_no, COUNT(s.from_date) AS "amount of raises"
FROM employees AS e
JOIN salaries AS s USING(emp_no)
JOIN dept_emp AS de USING(emp_no)
WHERE de.dept_no = 'd005'
GROUP BY e.emp_no
HAVING COUNT(s.from_date) > 15
ORDER BY e.emp_no;


/*
*  Show me all the employees that have worked for multiple departments
*  Database: Employees
*/

SELECT e.emp_no, COUNT(de.dept_no) AS "worked for # departments"
FROM employees AS e
JOIN dept_emp AS de USING(emp_no)
GROUP BY e.emp_no
HAVING COUNT(de.dept_no) > 1
ORDER BY e.emp_no;
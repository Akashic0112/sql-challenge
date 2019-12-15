-- testing to make sure csvs imported
select * from titles

--List the following details of each employee: employee number, last name, first name, gender, and salary
SELECT emp.emp_no,
	emp.last_name,
	emp.first_name,
	emp.gender,
	sal.salary
FROM employees as emp
	LEFT JOIN salaries as sal
		ON (emp.emp_no = sal.emp_no)
ORDER BY emp.emp_no;


--details of employees hired in 1986:
SELECT *
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--Department manager data: dept no, dept name, manager's emp no, last name, first name, and start/end dates
SELECT dm.dept_no,
	ds.dept_name,
	dm.emp_no,
	e.last_name,
	e.first_name,
	dm.from_date,
	dm.to_date
FROM dept_manager AS dm
	INNER JOIN departments AS ds
		ON (dm.dept_no = ds.dept_no)
	INNER JOIN employees AS e
		ON (dm.emp_no = e.emp_no);
		
--List each employees department
SELECT e.emp_no,
	e.last_name,
	e.first_name,
	ds.dept_name
FROM employees AS e
	INNER JOIN dept_emp as de
		ON (e.emp_no = de.emp_no)
	INNER JOIN departments as ds
		ON (de.dept_no = ds.dept_no)
ORDER BY e.emp_no;

--List all employees whose name is "Hercules" and last name starts with a "B"
SELECT *
	FROM employees
	WHERE first_name = 'Hercules'
		AND last_name LIKE 'B%';
		
--List all employees in the sales dept. 
SELECT e.emp_no,
	e.last_name,
	e.first_name,
	ds.dept_name
FROM employees as e
	INNER JOIN dept_emp AS de
		ON (e.emp_no = de.emp_no)
	INNER JOIN departments AS ds
		ON (de.dept_no = ds.dept_no)
WHERE ds.dept_name = 'Sales'
ORDER BY e.emp_no;

--List all employees in Sales and Development
SELECT e.emp_no,
	e.last_name,
	e.first_name,
	ds.dept_name
FROM employees as e
	INNER JOIN dept_emp AS de
		ON (e.emp_no = de.emp_no)
	INNER JOIN departments AS ds
		ON (de.dept_no = ds.dept_no)
WHERE ds.dept_name = 'Sales' OR ds.dept_name = 'Development'
--or WHERE d.dept_name IN ('Sales','Development')
ORDER BY e.emp_no;


--employees that share last names; descending order
SELECT last_name, COUNT(last_name) 
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;

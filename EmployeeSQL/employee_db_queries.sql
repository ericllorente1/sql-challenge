--list the employee number, last name, first name, sex, AND salary of each employee
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
LEFT JOIN salaries s ON e.emp_no = s.emp_no;

--List the first name, last name, AND hire date for the employees who were hired in 1986 (2 points)
SELECT first_name, last_name, hire_date FROM employees 
WHERE extract(year FROM hire_date) = '1986';

--List the manager of each department along with their department number, 
--department name, employee number, last name, AND first name
SELECT e.first_name, e.last_name, e.emp_no, d.dept_name, d.dept_no 
FROM departments d
LEFT JOIN dept_manager m ON d.dept_no = m.dept_no
LEFT JOIN employees e ON m.emp_no = e.emp_no;


--List the department number for each employee along with that employee’s employee number, 
--last name, first name, AND department name 
SELECT e.last_name, e.first_name, e.emp_no, de.dept_no, d.dept_name
FROM employees e  
LEFT JOIN dept_emp de ON e.emp_no = de.emp_no
LEFT JOIN departments d ON de.dept_no = d.dept_no;

--List first name, last name, AND sex of each employee whose first name is Hercules AND whose 
--last name begins with the letter B
SELECT e.first_name, e.last_name, e.sex
FROM employees e
WHERE e.first_name = 'Hercules' AND e.last_name LIKE 'B%';


--List each employee in the Sales department, including their employee number, last name, AND first name
SELECT e.last_name, e.first_name, e.emp_no, d.dept_name
FROM employees e
LEFT JOIN dept_emp de ON e.emp_no = de.emp_no
LEFT JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';


--List each employee in the Sales AND Development departments, including their employee number, 
--last name, first name, AND department name 
SELECT e.last_name, e.first_name, e.emp_no, d.dept_name
FROM employees e
LEFT JOIN dept_emp de ON e.emp_no = de.emp_no
LEFT JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';


--List the frequency counts, in descending ORDER, of all the employee last names 
--(that is, how many employees share each last name) 
SELECT e.last_name, count(last_name)
FROM employees e
GROUP BY e.last_name ORDER BY e.count DESC;
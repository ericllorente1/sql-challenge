--list the employee number, last name, first name, sex, and salary of each employee
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees e
left join salaries s on e.emp_no = s.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986 (2 points)
select first_name, last_name, hire_date from employees 
where extract(year from hire_date) = '1986';

--List the manager of each department along with their department number, 
--department name, employee number, last name, and first name
select e.first_name, e.last_name, e.emp_no, d.dept_name, d.dept_no 
from departments d
left join dept_manager m on d.dept_no = m.dept_no
left join employees e on m.emp_no = e.emp_no;


--List the department number for each employee along with that employee’s employee number, 
--last name, first name, and department name 
select e.last_name, e.first_name, e.emp_no, de.dept_no, d.dept_name
from employees e  
left join dept_emp de on e.emp_no = de.emp_no
left join departments d on de.dept_no = d.dept_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose 
--last name begins with the letter B
select e.first_name, e.last_name, e.sex
from employees e
where e.first_name = 'Hercules' and e.last_name like 'B%';


--List each employee in the Sales department, including their employee number, last name, and first name
select e.last_name, e.first_name, e.emp_no, d.dept_name
from employees e
left join dept_emp de on e.emp_no = de.emp_no
left join departments d on de.dept_no = d.dept_no
where d.dept_name = 'Sales';


--List each employee in the Sales and Development departments, including their employee number, 
--last name, first name, and department name 
select e.last_name, e.first_name, e.emp_no, d.dept_name
from employees e
left join dept_emp de on e.emp_no = de.emp_no
left join departments d on de.dept_no = d.dept_no
where d.dept_name = 'Sales' or d.dept_name = 'Development';


--List the frequency counts, in descending order, of all the employee last names 
--(that is, how many employees share each last name) 
select e.last_name, count(last_name)
from employees e
group by e.last_name order by e.count desc;
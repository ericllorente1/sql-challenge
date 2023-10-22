DROP TABLE titles
DROP TABLE employees
DROP TABLE departments
DROP TABLE dept_emp
DROP TABLE dept_manager
DROP TABLE salaries
--create titles table first to reference in employees table
CREATE TABLE titles (
    title_id varchar(10) PRIMARY KEY,
    title varchar(20)

--create employees table
CREATE TABLE employees (
    emp_no int PRIMARY KEY,
    emp_title_id varchar(10) references titles(title_id),
    birth_date date,
    first_name varchar(20),
    last_name varchar(50),
    sex varchar(1), 
    hire_date date

);
--create departments table
CREATE TABLE departments (
    dept_no varchar(20) PRIMARY KEY,
    dept_name varchar(50)
);
--create dept_emp table
CREATE TABLE dept_emp (
    emp_no int references employees(emp_no),
    dept_no varchar(20) references departments(dept_no)
);
--create dept_manager table
CREATE TABLE dept_manager (
    dept_no varchar(20) references departments(dept_no),
    emp_no int references employees(emp_no)
);

--create salaries table
CREATE TABLE salaries (
    emp_no int references employees(emp_no),
    salary int
);

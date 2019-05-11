drop table if exists dept_manager;
drop table if exists dept_emp;
drop table if exists salaries;
drop table if exists titles;
drop table if exists employees ;
drop table if exists departments;

CREATE TABLE departments (
    dept_no varchar(10) not null PRIMARY KEY,
    dept_name varchar(30)
	);
    

CREATE TABLE dept_emp (
    emp_no varchar(10),
    dept_no varchar (10),
    from_date date,
    to_date date,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
    );
		
	
CREATE TABLE dept_manager (
    dept_no varchar(10),
    emp_no varchar(10),
    from_date date,
    to_date date,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
    );
	
	
CREATE TABLE employees (
    emp_no varchar(10) not null PRIMARY KEY,
    birth_date date,
    first_name varchar(30),
    last_name varchar(30),
	gender varchar(30),
	hire_date date 
    );
	
	
CREATE TABLE salaries (
    emp_no varchar(10),
    salary varchar(30),
    from_date date,
    to_date date,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no));
    
		
CREATE TABLE titles (
    emp_no varchar(10),
    title varchar(30),
    from_date date,
    to_date date,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no));
	

select
employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
from employees
inner join salaries
on employees.emp_no = salaries.emp_no


select *
from employees
/*where hire_date between '12/31/1985'and '01/01/1987'
*/
where hire_date >'12/31/1985' and hire_date <'01/01/1987'


select departments.dept_no, departments.dept_name, dept_manager.from_date, dept_manager.to_date, employees.last_name, employees.first_name
from departments
inner join dept_manager
on departments.dept_no = dept_manager.dept_no
inner join employees
on dept_manager.emp_no = employees.emp_no


select dept_emp.emp_no, employees.last_name,employees.first_name,departments.dept_name
from departments
inner join dept_emp
on departments.dept_no = dept_emp.dept_no
inner join employees
on dept_emp.emp_no = employees.emp_no


Select *
from employees
where first_name = 'Hercules' and last_name like 'B%'


select dept_emp.emp_no, employees.last_name,employees.first_name,departments.dept_name
from departments
inner join dept_emp
on departments.dept_no = dept_emp.dept_no
inner join employees
on dept_emp.emp_no = employees.emp_no
where dept_name = 'Sales'


select dept_emp.emp_no, employees.last_name,employees.first_name,departments.dept_name
from departments
inner join dept_emp
on departments.dept_no = dept_emp.dept_no
inner join employees
on dept_emp.emp_no = employees.emp_no
where dept_name = 'Sales' or dept_name = 'Development'


select employees.last_name,
count(employees.last_name) as frequency
from employees
group by last_name
order by 2 desc

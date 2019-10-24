


/*	1. List the following details of each employee: employee number, last name, first name, gender, and salary.
	select count(*) from employee;  --300024 count before to verify 
	select count(*) from salary; --300024 count before to verify
*/

SQL SYNTAX
select e.emp_no, e.first_name, e.last_name, e.gender, s.salary
from employee e 
inner join salary s on e.emp_no = s.emp_no;

_______________________________________________________________________


SQL SYNTAX

/*
  2. List employees who were hired in 1986.
*/
select * from employee
where hire_date between '1985-12-31' and '1987-01-01'
order by hire_date;

_______________________________________________________________________

SQL SYNTAX

/*
  3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, 
  and start and end employment dates.
*/
select d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
from departments d
join dept_manager dm
on d.dept_no = dm.dept_no
join employee e on dm.emp_no = e.emp_no;

_______________________________________________________________________

SQL SYNTAX

/*
  4. List the department of each employee with the following information: employee number, last name, first name, and department name.
*/

select distinct e.emp_no, e.last_name, e.first_name, d.dept_name
from departments d
join dept_emp dm
on d.dept_no = dm.dept_no
join employee e on dm.emp_no = e.emp_no
--condition to take the dept manager out of the query
where dm.emp_no not in (
	select emp_no from dept_emp
	where emp_no in (select emp_no from dept_manager)
)

_______________________________________________________________________

SQL SYNTAX

/*
  5. List all employees whose first name is "Hercules" and last names begin with "B.
*/
select distinct * from employee
where first_name = 'Hercules'
and last_name like 'B%';

_______________________________________________________________________

SQL SYNTAX

/*
  6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
*/

select distinct e.emp_no, e.last_name, e.first_name, dept.dept_name
from employee e
inner join dept_emp d on e.emp_no = d.emp_no
inner join departments dept on dept.dept_no = d.dept_no
where d.dept_no in (
	select dept_no from departments 
	where dept_name = 'Sales'
);

_______________________________________________________________________

SQL SYNTAX

/*
 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
*/

select distinct e.emp_no, e.last_name, e.first_name, dept.dept_name
from employee e
inner join dept_emp d on e.emp_no = d.emp_no
inner join departments dept on dept.dept_no = d.dept_no
where d.dept_no in (
	select dept_no from departments 
	where dept_name = 'Sales' or dept_name = 'Development'
);

_______________________________________________________________________

SQL SYNTAX

/*
 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
*/
select last_name, count(last_name) countL from employee
group by last_name
order by countl desc;


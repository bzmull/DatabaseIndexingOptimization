-- QUESTION #2
SET profiling = 0; 
SET profiling_history_size = 0;
SET profiling_history_size = 100; 
SET profiling = 1;

-- a. Find count of all employees who earn at least 50 more than their managers. On above example data, should be Warren.
select count(*) PART_A
from employee emp1, employee emp2
where emp1.Manager = emp2.ID
and emp1.Salary >= emp2.Salary + 50;  

-- part (a) indexed
create index ind on employee(manager, ID, Salary);
select count(*) PART_A_INDEXED
from employee emp1, employee emp2
where emp1.Manager = emp2.ID
and emp1.salary >= emp2.salary + 50;
drop index ind on employee;

-- b. For those departments in which more than one employee takes courses, find the average salary by department.
select department, avg(salary) PART_B
from employee as tab1
join (select department dept
	from course, employee
	where course.EmpID = employee.ID
	group by department
	having count(*) > 1) as tab2
on tab1.department = tab2.dept
group by department;

-- part (b) indexed
create index ind on employee(ID, department, salary);
select department, avg(salary) PART_B_INDEXED
from employee as tab1
join (select department dept
	from course, employee
	where course.EmpID = employee.ID
	group by department
	having count(*) > 1) as tab2
on tab1.department = tab2.dept
group by department;
drop index ind on employee;

-- c. Find the average salary earned by people taking the course of prof1038
select avg(salary) 
from Employee emp
RIGHT JOIN (select distinct EmpID 
			from course 
            where Prof = 'prof1038') cor
ON emp.ID = cor.EmpID;

-- part (c) indexed
create index ind on course(prof, empid);
select avg(salary) 
from Employee emp
RIGHT JOIN (select distinct EmpID 
			from course 
            where Prof = 'prof1038') cor
ON emp.ID = cor.EmpID;
drop index ind on course;

show profiles
select * 
from employee
limit 100;

select * 
from course
limit 100;

-- 2. Find count of all employees who earn at least 5000 more than their managers. On above example data, should be Warren.
SET profiling = 0; 
SET profiling_history_size = 0;
SET profiling_history_size = 100; 
SET profiling = 1;

-- drop index man on employee;
-- drop index id on employee;
-- drop index sal on employee;
-- drop index ind on employee;

-- select count(*)
-- from employee emp1, employee emp2
-- where emp1.Manager = emp2.ID
-- and emp1.Salary >= emp2.Salary + 5000;


#2 again but indexed
 
-- create index man on employee(manager);
-- create index id on employee(ID);
-- create index sal on employee(salary);
-- create index ind on employee(manager, ID, Salary);
-- create index ind on employee(manager, ID, salary);
-- select count(*) count
-- from employee emp1, employee emp2
-- where emp1.Manager = emp2.ID
-- and emp1.salary >= emp2.salary + 5000;
--  drop index ind on course;




-- -- 5. Find the average salary earned by people taking the course of prof1038
select avg(salary) average_salary
from course, employee
where course.prof = 'prof1038'
and course.EmpID = employee.ID;

create temporary table temp_table select * from employee cross join course;
create index ind on temp_table(prof, empid, ID);
select avg(salary) average_salary
from temp_table
where temp_table.prof = 'prof1038'
and temp_table.EmpID = temp_table.ID;
-- from course, employee
-- where course.prof = 'prof1038'
-- and course.EmpID = employee.ID;
drop index ind on temp_table;

-- 6. For those departments in which more than one employee takes courses, find the average salary by department.
-- select department, avg(salary) average_salary
-- from employee as tab1
-- join (select department dept
-- 	from course, employee
-- 	where course.EmpID = employee.ID
-- 	group by department
-- 	having count(*) > 1) as tab2
-- on tab1.department = tab2.dept
-- group by department;
show profiles;
-- SELECT Duration 
-- FROM INFORMATION_SCHEMA.PROFILING WHERE QUERY_ID=334;
-- Show profile;
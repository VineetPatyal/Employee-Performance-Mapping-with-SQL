create database employee;
use employee;

create table emp_record_table
(
   EMP_ID int primary Key,
   FIRST_NAME varchar(30),
   LAST_NAME varchar(30),
   GENDER varchar(10),
   ROLE varchar(100),
   DEPT varchar(100),
   EXP int,
   COUNTRY varchar(100),
   CONTINENT varchar(100),
   SALARY Decimal(10, 2),
   EMP_RATING Decimal(10, 2),
   MANAGER_ID int,
   PROJ_ID int
);

create table proj_table
(
  PROJECT_ID int primary key,
  PROJ_Name varchar(100),
  DOMAIN varchar(100),
  START_DATE date,
  CLOSURE_DATE date,
  DEV_QTR varchar(50),
  STATUS varchar(20)
);

create table Data_science_team
(
  EMP_ID int primary key,
  FIRST_NAME varchar(30),
  LAST_NAME varchar(30),
  GENDER varchar(10),
  ROLE varchar(10),
  DEPT varchar(10),
  EXP int,
  COUNTRY varchar(100),
  CONTINENT varchar(100)
);

ALTER TABLE data_science_team MODIFY COLUMN EMP_ID VARCHAR(10);
ALTER TABLE emp_record_table MODIFY COLUMN EMP_ID VARCHAR(10);
ALTER TABLE emp_record_table MODIFY COLUMN PROJ_ID VARCHAR(10);
ALTER TABLE proj_table MODIFY COLUMN PROJECT_ID VARCHAR(10);
ALTER TABLE emp_record_table MODIFY COLUMN MANAGER_ID VARCHAR(10);
ALTER TABLE emp_record_table MODIFY COLUMN PROJ_ID VARCHAR(255) NULL;  -- Adjust the data type as needed
UPDATE emp_record_table
SET PROJ_ID = NULL
WHERE PROJ_ID = 'NA';


ALTER TABLE data_science_team DROP FOREIGN KEY data_science_team_ibfk_1;
ALTER TABLE emp_record_table DROP FOREIGN KEY emp_record_table_ibfk_1;

ALTER TABLE emp_record_table ADD CONSTRAINT emp_record_table_ibfk_1 FOREIGN KEY (PROJ_ID) REFERENCES proj_table (PROJECT_ID);
alter table Data_science_team add foreign key (EMP_ID) references emp_record_table (EMP_ID);

INSERT INTO emp_record_table 
(EMP_ID, FIRST_NAME, LAST_NAME, GENDER, ROLE, DEPT, EXP, COUNTRY, CONTINENT, SALARY, EMP_RATING, MANAGER_ID, PROJ_ID)
VALUES 
('E001', 'Arthur', 'Black', 'M', 'PRESIDENT', 'ALL', 20, 'USA', 'NORTH AMERICA', 16500, 5, NULL, NULL), 
('E005', 'Eric', 'Hoffman', 'M', 'LEAD DATA SCIENTIST', 'FINANCE', 11, 'USA', 'NORTH AMERICA', 8500, 3, 'E103', 'P105'),
('E010', 'William', 'Butler', 'M', 'LEAD DATA SCIENTIST', 'AUTOMOTIVE', 12, 'FRANCE', 'EUROPE', 9000, 2, 'E428', 'P204'),
('E052', 'Dianna', 'Wilson', 'F', 'SENIOR DATA SCIENTIST', 'HEALTHCARE', 6, 'CANADA', 'NORTH AMERICA', 5500, 5, 'E083', 'P103'),
('E057', 'Dorothy', 'Wilson', 'F', 'SENIOR DATA SCIENTIST', 'HEALTHCARE', 9, 'USA', 'NORTH AMERICA', 7700, 1, 'E083', 'P302'),
('E083', 'Patrick', 'Voltz', 'M', 'MANAGER', 'HEALTHCARE', 15, 'USA', 'NORTH AMERICA', 9500, 5, 'E001', NULL),
('E103', 'Emily', 'Grove', 'F', 'MANAGER', 'FINANCE', 14, 'CANADA', 'NORTH AMERICA', 10500, 4, 'E001', NULL),
('E204', 'Karene', 'Nowak', 'F', 'SENIOR DATA SCIENTIST', 'AUTOMOTIVE', 8, 'GERMANY', 'EUROPE', 7500, 5, 'E428', 'P204'),
('E245', 'Nian', 'Zhen', 'M', 'SENIOR DATA SCIENTIST', 'RETAIL', 6, 'CHINA', 'ASIA', 6500, 2, 'E583', 'P109'),
('E260', 'Roy', 'Collins', 'M', 'SENIOR DATA SCIENTIST', 'RETAIL', 7, 'INDIA', 'ASIA', 7000, 3, 'E583', 'NA'),
('E403', 'Steve', 'Hoffman', 'M', 'ASSOCIATE DATA SCIENTIST', 'FINANCE', 4, 'USA', 'NORTH AMERICA', 5000, 3, 'E103', 'P105'),
('E428', 'Pete', 'Allen', 'M', 'MANAGER', 'AUTOMOTIVE', 14, 'GERMANY', 'EUROPE', 11000, 4, 'E001', NULL),
('E478', 'David', 'Smith', 'M', 'ASSOCIATE DATA SCIENTIST', 'RETAIL', 3, 'COLOMBIA', 'SOUTH AMERICA', 4000, 4, 'E583', 'P109'),
('E505', 'Chad', 'Wilson', 'M', 'ASSOCIATE DATA SCIENTIST', 'HEALTHCARE', 5, 'CANADA', 'NORTH AMERICA', 5000, 2, 'E083', 'P103'),
('E532', 'Claire', 'Brennan', 'F', 'ASSOCIATE DATA SCIENTIST', 'AUTOMOTIVE', 3, 'GERMANY', 'EUROPE', 4300, 1, 'E428', 'P204'),
('E583', 'Janet', 'Hale', 'F', 'MANAGER', 'RETAIL', 14, 'COLOMBIA', 'SOUTH AMERICA', 10000, 2, 'E001', NULL),
('E612', 'Tracy', 'Norris', 'F', 'MANAGER', 'RETAIL', 13, 'INDIA', 'ASIA', 8500, 4, 'E001', NULL),
('E620', 'Katrina', 'Allen', 'F', 'JUNIOR DATA SCIENTIST', 'RETAIL', 2, 'INDIA', 'ASIA', 3000, 1, 'E612', 'P406'),
('E640', 'Jenifer', 'Jhones', 'F', 'JUNIOR DATA SCIENTIST', 'RETAIL', 1, 'COLOMBIA', 'SOUTH AMERICA', 2800, 4, 'E612', 'P406');

select * from emp_record_table;

Insert into Proj_table
(PROJECT_ID, PROJ_NAME, DOMAIN, START_DATE, CLOSURE_DATE, DEV_QTR, STATUS)
Values
('P103', 'Drug Discovery', 'HEALTHCARE', '2021-04-06', '2021-06-20', 'Q1', 'DONE'),
('P105', 'Fraud Detection', 'FINANCE', '2021-04-11', '2021-06-25', 'Q1', 'DONE'),
('P109', 'Market Basket Analysis', 'RETAIL', '2021-04-12', '2021-06-30', 'Q1', 'DELAYED'),
('P204', 'Supply Chain Management', 'AUTOMOTIVE', '2021-07-15', '2021-09-28', 'Q2', 'WIP'),
('P302', 'Early Detection of Lung Cancer', 'HEALTHCARE', '2021-10-08', '2021-12-18', 'Q3', 'YTS'),
('P406', 'Customer Sentiment Analysis', 'RETAIL', '2021-07-09', '2021-09-24', 'Q2', 'WIP');

select * from Proj_table;
ALTER TABLE Data_science_team MODIFY COLUMN ROLE VARCHAR(255);
Insert into Data_science_team
(EMP_ID, FIRST_NAME, LAST_NAME,	GENDER,	ROLE, DEPT, EXP, COUNTRY, CONTINENT)
values
('E005', 'Eric', 'Hoffman', 'M', 'LEAD DATA SCIENTIST', 'FINANCE', 11, 'USA', 'NORTH AMERICA'),
('E010', 'William', 'Butler', 'M', 'LEAD DATA SCIENTIST', 'AUTOMOTIVE', 12, 'FRANCE', 'EUROPE'),
('E052', 'Dianna', 'Wilson', 'F', 'SENIOR DATA SCIENTIST', 'HEALTHCARE', 6, 'CANADA', 'NORTH AMERICA'),
('E057', 'Dorothy', 'Wilson', 'F', 'SENIOR DATA SCIENTIST', 'HEALTHCARE', 9, 'USA', 'NORTH AMERICA'),
('E204', 'Karene', 'Nowak', 'F', 'SENIOR DATA SCIENTIST', 'AUTOMOTIVE', 8, 'GERMANY', 'EUROPE'),
('E245', 'Nian', 'Zhen', 'M', 'SENIOR DATA SCIENTIST', 'RETAIL', 6, 'CHINA', 'ASIA'),
('E260', 'Roy', 'Collins', 'M', 'SENIOR DATA SCIENTIST', 'RETAIL', 7, 'INDIA', 'ASIA'),
('E403', 'Steve', 'Hoffman', 'M', 'ASSOCIATE DATA SCIENTIST', 'FINANCE', 4, 'USA', 'NORTH AMERICA'),
('E478', 'David', 'Smith', 'M', 'ASSOCIATE DATA SCIENTIST', 'RETAIL', 3, 'COLOMBIA', 'SOUTH AMERICA'),
('E505', 'Chad', 'Wilson', 'M', 'ASSOCIATE DATA SCIENTIST', 'HEALTHCARE', 5, 'CANADA', 'NORTH AMERICA'),
('E532', 'Claire', 'Brennan', 'F', 'ASSOCIATE DATA SCIENTIST', 'AUTOMOTIVE', 3, 'GERMANY', 'EUROPE'),
('E620', 'Katrina', 'Allen', 'F', 'JUNIOR DATA SCIENTIST', 'RETAIL', 2, 'INDIA', 'ASIA'),
('E640', 'Jenifer', 'Jhones', 'F', 'JUNIOR DATA SCIENTIST', 'RETAIL', 1, 'COLOMBIA', 'SOUTH AMERICA');

Select * from Data_science_team;

#3 Write a query to fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER, and DEPARTMENT from the employee record table, and make a list of employees and details of their department.

Select EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT
From emp_record_table;

#4 Write a query to fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPARTMENT, and EMP_RATING if the EMP_RATING is: 
# less than two
# greater than four 
# between two and four

Select EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT, EMP_RATING,
Case
    When EMP_RATING < 2 THEN "Less Than Two"
    When EMP_RATING > 4 THEN "Greater Than Four"
    Else 'between two and four'
End as Rating_Category
From emp_record_table
Where EMP_RATING < 2 or
EMP_RATING > 4 or
EMP_RATING between 2 and 4;

#5 Write a query to concatenate the FIRST_NAME and the LAST_NAME of employees in the Finance department from the employee table and then give the resultant column alias as NAME.

select 
concat(FIRST_NAME,' ',LAST_NAME) as NAME
From emp_record_table
where DEPT = "FINANCE";

#6 Write a query to list only those employees who have someone reporting to them. Also, show the number of reporters (including the President).

Select e.EMP_ID,
	   e.FIRST_NAME,
       e.LAST_NAME,
	   count(r.EMP_ID) as number_of_reporters
from emp_record_table e
join emp_record_table r
ON e.EMP_ID = r.MANAGER_ID
group by e.EMP_ID,e.FIRST_NAME,e.LAST_NAME
having number_of_reporters > 0;

#7 Write a query to list down all the employees from the healthcare and finance departments using union. Take data from the employee record table.

select FIRST_NAME, LAST_NAME, DEPT
from emp_record_table
where DEPT = 'HEALTHCARE'

UNION

select FIRST_NAME, LAST_NAME, DEPT
from emp_record_table
where DEPT = 'FINANCE';

#8 Write a query to list down employee details such as EMP_ID, FIRST_NAME, LAST_NAME, ROLE, DEPARTMENT, and EMP_RATING grouped by dept. 
# Also include the respective employee rating along with the max emp rating for the department.

SELECT 
    e.EMP_ID, 
    e.FIRST_NAME, 
    e.LAST_NAME, 
    e.ROLE, 
    e.DEPT, 
    e.EMP_RATING, 
    dept_max_ratings.max_emp_rating
FROM emp_record_table e
JOIN 
    (SELECT 
        DEPT, MAX(EMP_RATING) AS max_emp_rating
     FROM emp_record_table
     GROUP BY DEPT
    ) AS dept_max_ratings
ON 
    e.DEPT = dept_max_ratings.DEPT
ORDER BY 
    e.DEPT, e.EMP_RATING DESC;

#9 Write a query to calculate the minimum and the maximum salary of the employees in each role. Take data from the employee record table.

Select ROLE,
max(SALARY) as maximum_salary,
min(SALARY) as minimum_salary
from emp_record_table
group by ROLE;

#10 Write a query to assign ranks to each employee based on their experience. Take data from the employee record table.

select EMP_ID, FIRST_NAME,LAST_NAME,EXP,
dense_rank() over(order by EXP desc) as rank_based_on_exp
from emp_record_table;

#11 Write a query to create a view that displays employees in various countries whose salary is more than six thousand. Take data from the employee record table.

create view high_salary_employees as
select
   EMP_ID,
   FIRST_NAME,
   LAST_NAME,
   ROLE,
   DEPT,
   SALARY,
   COUNTRY
from emp_record_table
Where SALARY > 6000;

Select * from high_salary_employees;

#12 Write a nested query to find employees with experience of more than ten years. Take data from the employee record table.

Select
  EMP_ID,
  FIRST_NAME,
  LAST_NAME,
  ROLE,
  DEPT,
  EXP
From emp_record_table
Where 
  EXP > (Select 10 );
  
  #13 Write a query to create a stored procedure to retrieve the details of the employees whose experience is more than three years. Take data from the employee record table.
  
  DELIMITER //
  create procedure get_employees_basedon_exp(IN MyEXP INT)
  BEGIN
      Select
           EMP_ID,
           FIRST_NAME,
           LAST_NAME,
           ROLE,
           DEPT,
           EXP
	  From
          emp_record_table
	  Where
          EXP > MyEXP;
  END //
DELIMITER ;
CALL get_3plus_year_experienced_employees();
CALL get_employees_basedon_exp(3);

#14 Write a query using stored functions in the project table to check whether the job profile assigned to each employee in the data science team matches the organization’s set standard.
#The standard being:

#For an employee with experience less than or equal to 2 years assign 'JUNIOR DATA SCIENTIST',

#For an employee with the experience of 2 to 5 years assign 'ASSOCIATE DATA SCIENTIST',

#For an employee with the experience of 5 to 10 years assign 'SENIOR DATA SCIENTIST',

$#For an employee with the experience of 10 to 12 years assign 'LEAD DATA SCIENTIST',

#For an employee with the experience of 12 to 16 years assign 'MANAGER'.

DELIMITER //

CREATE FUNCTION employee_profile(exp INT) 
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE role_standard VARCHAR(100);

    -- Assign the standard job profile based on the employee's experience
    IF exp <= 2 THEN
        SET role_standard = 'JUNIOR DATA SCIENTIST';
    ELSEIF exp > 2 AND exp <= 5 THEN
        SET role_standard = 'ASSOCIATE DATA SCIENTIST';
    ELSEIF exp > 5 AND exp <= 10 THEN
        SET role_standard = 'SENIOR DATA SCIENTIST';
    ELSEIF exp > 10 AND exp <= 12 THEN
        SET role_standard = 'LEAD DATA SCIENTIST';
    ELSEIF exp > 12 AND exp <= 16 THEN
        SET role_standard = 'MANAGER';
    ELSE
        SET role_standard = 'OTHER';
    END IF;

    RETURN role_standard;
END //

DELIMITER ;

SELECT 
    d.EMP_ID, 
    d.FIRST_NAME, 
    d.LAST_NAME, 
    d.ROLE AS current_role, 
    employee_profile(d.EXP) AS standard_role,
    CASE 
        WHEN d.ROLE =  employee_profile(d.EXP) THEN 'Match'
        ELSE 'Mismatch'
    END AS role_check
FROM 
    Data_science_team d;

# 15 Create an index to improve the cost and performance of the query to find the employee whose FIRST_NAME is ‘Eric’ in the employee table after checking the execution plan.

     Explain
     SELECT * FROM emp_record_table
     Where FIRST_NAME = 'Eric';
     
     CREATE INDEX idx_first_name ON emp_record_table(FIRST_NAME);
     
#16 Write a query to calculate the bonus for all the employees, based on their ratings and salaries (Use the formula: 5% of salary * employee rating).
Select EMP_ID,
       FIRST_NAME,
       LAST_NAME,
       SALARY,
       EMP_RATING,
       round((0.05* SALARY * EMP_RATING),0) as bonus
From
      emp_record_table;
      
#17 Write a query to calculate the average salary distribution based on the continent and country. Take data from the employee record table.
Select 
	COUNTRY,
	CONTINENT,
	round(Avg(SALARY),2) as Avg_salary
From 
	emp_record_table
Group By 
    CONTINENT,COUNTRY;

     
    
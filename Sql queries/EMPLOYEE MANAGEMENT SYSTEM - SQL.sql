USE UNIVERSITY;
-- Table 1: Job Department
 CREATE TABLE JobDepartment
 ( Job_ID INT PRIMARY KEY,   
  jobdept VARCHAR(50),   
  name VARCHAR(100),   
  description TEXT,    
  salaryrange VARCHAR(50) ); 
  
INSERT INTO JobDepartment
(Job_ID, jobdept, name, description, salaryrange)
VALUES
(101,'IT','Software Developer','Develops software applications','4 LPA - 8 LPA'),
(102,'HR','HR Executive','Manages recruitment and employee relations','3 LPA - 6 LPA'),
(103,'Finance','Accountant','Handles company accounts','4 LPA - 7 LPA'),
(104,'Sales','Sales Executive','Generates sales and manages clients','3 LPA - 7 LPA'),
(105,'Marketing','Marketing Specialist','Promotes products and services','4 LPA - 8 LPA');

-- Table 2: Salary/Bonus
 CREATE TABLE SalaryBonus 
 ( salary_ID INT PRIMARY KEY, 
    Job_ID INT, 
	amount DECIMAL(10,2),     
    annual DECIMAL(10,2), 
    bonus DECIMAL(10,2),
    CONSTRAINT fk_salary_job FOREIGN KEY (job_ID) REFERENCES JobDepartment(Job_ID)      
	ON DELETE CASCADE ON UPDATE CASCADE ); 
    
    INSERT INTO SalaryBonus
(salary_ID, Job_ID, amount, annual, bonus)
VALUES
(201,101,60000,720000,50000),
(202,102,45000,540000,30000),
(203,103,55000,660000,40000),
(204,104,40000,480000,25000),
(205,105,50000,600000,35000);


-- Table 3: Employee 
CREATE TABLE Employee 
(emp_ID INT PRIMARY KEY,
     firstname VARCHAR(50),
     lastname VARCHAR(50),
     gender VARCHAR(10),
     age INT,
     contact_add VARCHAR(100),
     emp_email VARCHAR(100) UNIQUE,
     emp_pass VARCHAR(50),
     Job_ID INT,
     CONSTRAINT fk_employee_job FOREIGN KEY (Job_ID)
     REFERENCES JobDepartment(Job_ID)
     ON DELETE SET NULL
     ON UPDATE CASCADE );  
     
     INSERT INTO Employee
(emp_ID, firstname, lastname, gender, age, contact_add, emp_email, emp_pass, Job_ID)
VALUES
(301,'Rahul','Sharma','Male',25,'Hyderabad','rahul@gmail.com','rahul123',101),
(302,'Priya','Reddy','Female',27,'Warangal','priya@gmail.com','priya123',102),
(303,'Arjun','Kumar','Male',30,'Nalgonda','arjun@gmail.com','arjun123',103),
(304,'Sneha','Patel','Female',26,'Vijayawada','sneha@gmail.com','sneha123',104),
(305,'Kiran','Verma','Male',29,'Khammam','kiran@gmail.com','kiran123',105),
(306,'Anjali','Rao','Female',24,'Hyderabad','anjali@gmail.com','anjali123',101),
(307,'Vikram','Singh','Male',31,'Karimnagar','vikram@gmail.com','vikram123',103),
(308,'Meghana','Naidu','Female',28,'Guntur','meghana@gmail.com','meghana123',102),
(309,'Rohit','Yadav','Male',27,'Hyderabad','rohit@gmail.com','rohit123',104),
(310,'Divya','Sai','Female',25,'Nizamabad','divya@gmail.com','divya123',105);


-- Table 4: Qualification 
CREATE TABLE Qualification ( QualID INT PRIMARY KEY,
     Emp_ID INT,
     Position VARCHAR(50),
     Requirements VARCHAR(255),
     Date_In DATE,
     CONSTRAINT fk_qualification_emp FOREIGN KEY (Emp_ID)
     REFERENCES Employee(emp_ID)
     ON DELETE CASCADE
     ON UPDATE CASCADE ); 
     
     INSERT INTO Qualification
(QualID, Emp_ID, Position, Requirements, Date_In)
VALUES
(401,301,'Software Developer','B.Tech CSE','2025-01-10'),
(402,302,'HR Executive','MBA HR','2024-12-15'),
(403,303,'Accountant','M.Com','2023-11-20'),
(404,304,'Sales Executive','MBA Marketing','2024-06-18'),
(405,305,'Marketing Specialist','MBA Marketing','2025-02-05'),
(406,306,'Software Developer','B.Tech IT','2025-03-12'),
(407,307,'Senior Accountant','CA','2022-09-08'),
(408,308,'HR Executive','MBA HR','2024-08-01'),
(409,309,'Sales Executive','BBA','2025-04-14'),
(410,310,'Marketing Specialist','MBA Marketing','2025-05-21');

-- Table 5: Leaves 
CREATE TABLE Leaves ( leave_ID INT PRIMARY KEY,
     emp_ID INT,
     date DATE,
     reason TEXT,
     CONSTRAINT fk_leave_emp FOREIGN KEY (emp_ID) REFERENCES Employee(emp_ID)
	 ON DELETE CASCADE ON UPDATE CASCADE ); 
     
     INSERT INTO Leaves
(leave_ID, emp_ID, date, reason)
VALUES
(501,301,'2025-06-10','Fever'),
(502,302,'2025-06-12','Family Function'),
(503,303,'2025-06-15','Medical Leave'),
(504,304,'2025-06-20','Vacation'),
(505,305,'2025-06-22','Personal Work'),
(506,306,'2025-06-25','Sick Leave'),
(507,307,'2025-06-28','Emergency'),
(508,308,'2025-07-01','Marriage'),
(509,309,'2025-07-03','Festival'),
(510,310,'2025-07-05','Health Checkup');

-- Table 6: Payroll
 CREATE TABLE Payroll (payroll_ID INT PRIMARY KEY,
 emp_ID INT,
 job_ID INT,
 salary_ID INT,
 leave_ID INT,
 date DATE,
 report TEXT,
 total_amount DECIMAL(10,2),
 CONSTRAINT fk_payroll_emp FOREIGN KEY (emp_ID)
 REFERENCES Employee(emp_ID)
 ON DELETE CASCADE ON UPDATE CASCADE,
 CONSTRAINT fk_payroll_job FOREIGN KEY (job_ID) REFERENCES JobDepartment(job_ID)
 ON DELETE CASCADE ON UPDATE CASCADE,
 CONSTRAINT fk_payroll_salary FOREIGN KEY (salary_ID) REFERENCES SalaryBonus(salary_ID)
 ON DELETE CASCADE ON UPDATE CASCADE,
 CONSTRAINT fk_payroll_leave FOREIGN KEY (leave_ID) REFERENCES Leaves(leave_ID)
 ON DELETE SET NULL ON UPDATE CASCADE ); 
 
 INSERT INTO Payroll
(payroll_ID, emp_ID, job_ID, salary_ID, leave_ID, date, report, total_amount)
VALUES
(601,301,101,201,501,'2025-07-31','Salary Processed',65000),
(602,302,102,202,502,'2025-07-31','Salary Processed',48000),
(603,303,103,203,503,'2025-07-31','Salary Processed',59000),
(604,304,104,204,504,'2025-07-31','Salary Processed',43000),
(605,305,105,205,505,'2025-07-31','Salary Processed',53000),
(606,306,101,201,506,'2025-07-31','Salary Processed',65000),
(607,307,103,203,507,'2025-07-31','Salary Processed',59000),
(608,308,102,202,508,'2025-07-31','Salary Processed',48000),
(609,309,104,204,509,'2025-07-31','Salary Processed',43000),
(610,310,105,205,510,'2025-07-31','Salary Processed',53000);
 
SELECT COUNT(*) AS Total_Employees
FROM Employee;

-- Which department has the highest number of employees?
SELECT
    jd.jobdept AS Department,
    COUNT(e.emp_ID) AS Total_Employees
FROM Employee e
JOIN JobDepartment jd
ON e.Job_ID = jd.Job_ID
GROUP BY jd.jobdept
ORDER BY Total_Employees DESC;


-- Which department has the highest total monthly salary allocation?
SELECT
    jd.jobdept AS Department,
    SUM(sb.amount) AS Total_Monthly_Salary
FROM Employee e
JOIN JobDepartment jd
ON e.Job_ID = jd.Job_ID
JOIN SalaryBonus sb
ON jd.Job_ID = sb.Job_ID
GROUP BY jd.jobdept
ORDER BY Total_Monthly_Salary DESC;

-- Who are the Top 3 employees receiving the highest total compensation (Salary + Bonus)?
SELECT
    CONCAT(e.firstname,' ',e.lastname) AS Employee_Name,
    jd.name AS Job_Role,
    sb.amount AS Salary,
    sb.bonus,
    (sb.amount + sb.bonus) AS Total_Compensation
FROM Employee e
JOIN JobDepartment jd
ON e.Job_ID = jd.Job_ID
JOIN SalaryBonus sb
ON jd.Job_ID = sb.Job_ID
ORDER BY Total_Compensation DESC
LIMIT 3;

-- Which qualification is most common among employees?
SELECT
    Requirements AS Qualification,
    COUNT(*) AS Employee_Count
FROM Qualification
GROUP BY Requirements
ORDER BY Employee_Count DESC;


-- What are the most common reasons employees take leave?
SELECT
    reason,
    COUNT(*) AS Number_of_Employees
FROM Leaves
GROUP BY reason
ORDER BY Number_of_Employees DESC;


-- Which department has the highest average payroll amount?
SELECT
    jd.jobdept AS Department,
    ROUND(AVG(p.total_amount),2) AS Average_Payroll
FROM Payroll p
JOIN Employee e
ON p.emp_ID = e.emp_ID
JOIN JobDepartment jd
ON e.Job_ID = jd.Job_ID
GROUP BY jd.jobdept
ORDER BY Average_Payroll DESC;
-- Which departments are consuming the highest payroll budget, and are those costs justified by workforce size?
SELECT
    jd.jobdept AS Department,
    COUNT(e.emp_ID) AS Total_Employees,
    SUM(p.total_amount) AS Total_Payroll,
    ROUND(SUM(p.total_amount)/COUNT(e.emp_ID),2) AS Payroll_Per_Employee
FROM Employee e
JOIN JobDepartment jd
ON e.Job_ID = jd.Job_ID
JOIN Payroll p
ON e.emp_ID = p.emp_ID
GROUP BY jd.jobdept
ORDER BY Total_Payroll DESC;

-- Which employees are showing early burnout indicators based on leave patterns and compensation?
SELECT
    CONCAT(e.firstname,' ',e.lastname) AS Employee_Name,
    jd.jobdept,
    COUNT(l.leave_ID) AS Leave_Count,
    sb.amount AS Monthly_Salary,
    CASE
        WHEN COUNT(l.leave_ID)>=2 AND sb.amount>=50000 THEN 'High Risk'
        WHEN COUNT(l.leave_ID)>=1 THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS Burnout_Risk
FROM Employee e
JOIN Leaves l
ON e.emp_ID=l.emp_ID
JOIN SalaryBonus sb
ON e.Job_ID=sb.Job_ID
JOIN JobDepartment jd
ON e.Job_ID=jd.Job_ID
GROUP BY e.emp_ID,e.firstname,e.lastname,jd.jobdept,sb.amount
ORDER BY Leave_Count DESC;
-- Are employee qualifications aligned with their current job roles and salary levels?
SELECT
    CONCAT(e.firstname,' ',e.lastname) AS Employee_Name,
    q.Requirements AS Qualification,
    jd.name AS Job_Role,
    sb.amount AS Monthly_Salary
FROM Employee e
JOIN Qualification q
ON e.emp_ID=q.Emp_ID
JOIN JobDepartment jd
ON e.Job_ID=jd.Job_ID
JOIN SalaryBonus sb
ON e.Job_ID=sb.Job_ID
ORDER BY sb.amount DESC;





-- Which employees may be overcompensated or undercompensated compared to others performing similar roles?
SELECT
    CONCAT(e.firstname,' ',e.lastname) AS Employee_Name,
    jd.name AS Job_Role,
    sb.amount,
    AVG(sb.amount) OVER(PARTITION BY jd.name) AS Avg_Role_Salary,
    CASE
        WHEN sb.amount >
             AVG(sb.amount) OVER(PARTITION BY jd.name)
             THEN 'Above Average'
        WHEN sb.amount <
             AVG(sb.amount) OVER(PARTITION BY jd.name)
             THEN 'Below Average'
        ELSE 'Average'
    END AS Salary_Status
FROM Employee e
JOIN JobDepartment jd
ON e.Job_ID=jd.Job_ID
JOIN SalaryBonus sb
ON e.Job_ID=sb.Job_ID;





-- Which departments deliver the highest workforce efficiency while maintaining lower payroll costs?
SELECT
    jd.jobdept,
    COUNT(DISTINCT e.emp_ID) AS Employees,
    SUM(p.total_amount) AS Payroll,
    COUNT(l.leave_ID) AS Leave_Records,
    ROUND(
        SUM(p.total_amount)/
        (COUNT(DISTINCT e.emp_ID)+COUNT(l.leave_ID)),2
    ) AS Efficiency_Score
FROM Employee e
LEFT JOIN Leaves l
ON e.emp_ID=l.emp_ID
JOIN Payroll p
ON e.emp_ID=p.emp_ID
JOIN JobDepartment jd
ON e.Job_ID=jd.Job_ID
GROUP BY jd.jobdept
ORDER BY Efficiency_Score;


-- Which employees should HR prioritize for promotion, salary review, or retention based on qualifications, payroll, and attendance?
SELECT
    CONCAT(e.firstname,' ',e.lastname) AS Employee_Name,
    jd.jobdept,
    q.Requirements,
    p.total_amount,
    COUNT(l.leave_ID) AS Leave_Count,
    CASE
        WHEN p.total_amount>=60000
             AND COUNT(l.leave_ID)<=1
             THEN 'Promotion Candidate'
        WHEN p.total_amount<50000
             THEN 'Salary Review'
        ELSE 'Retention Monitor'
        
        END AS HR_Action
FROM Employee e
JOIN Payroll p
ON e.emp_ID=p.emp_ID
JOIN Qualification q
ON e.emp_ID=q.Emp_ID
LEFT JOIN Leaves l
ON e.emp_ID=l.emp_ID
JOIN JobDepartment jd
ON e.Job_ID=jd.Job_ID
GROUP BY
e.emp_ID,
Employee_Name,
jd.jobdept,
q.Requirements,
p.total_amount;







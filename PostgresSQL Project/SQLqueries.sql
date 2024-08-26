--CREATING DEPARTMENTS TABLE AND INSERTING THE VALUES.

CREATE TABLE departments(
department_id INT PRIMARY KEY,
department_name VARCHAR (100),
manager_id INT
);
INSERT INTO departments
(department_id, department_name, manager_id)
VALUES
(1, 'HR', 200), (2, 'IT', 201), (3, 'FINANCE', 204), (4, 'MANAGEMENT', 205), (5, 'ANALYST', 203);

--CREATING JOBS TABLE AND INSERTING THE VALUES.

CREATE TABLE jobs(
job_id INT PRIMARY KEY,
job_title VARCHAR (100),
min_salary VARCHAR (100),
max_salary VARCHAR (100)
);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
VALUES
(400, 'SOFTWARE ENGINEER', '50000', '600000'),
(401, 'DATA ANALYST', '50000', '600000'),
(402, 'SOFTWARE DEVELOPER', '50000', '600000'),
(403, 'JUNIOR CONSULTANT', '50000', '600000'),
(404, 'SENIOR HR', '50000', '600000'),
(405, 'SENIOR CONSULTANT', '50000', '600000'),
(406, 'HR TRAINEE', '50000', '600000');

--CREATING EMPLOYEES TABLE AND INSERTING THE VALUES

CREATE TABLE employees(
employee_id serial primary key,
first_name VARCHAR (100),
last_name VARCHAR (100),
email VARCHAR (100) UNIQUE, 
phone_number VARCHAR,
hire_date Date,
job_id int,
salary decimal (8,2),
department_id int,
FOREIGN KEY(department_id) REFERENCES departments(department_id),
FOREIGN KEY(job_id) REFERENCES jobs(job_id)
);

INSERT INTO employees
(first_name, last_name, email, phone_number, hire_date, job_id, salary, department_id)
VALUES
('Gaurav', 'Rana', 'gauravranaa.2001@gmail.com', '9821236184', '2024-09-01', 402, 200000, 2),
('Shivani', 'Shah', 'shivani.2001@gmail.com', '8321236184', '2023-09-01', 402, 300000, 2),
('Nandini', 'Mehandiratta', 'nandini.2001@gmail.com', '9521236184', '2024-05-01', 406, 300000, 1),
('Lokesh', 'yadav', 'lokyadav.2001@gmail.com', '8621236184', '2024-04-01', 403, 100000, 3),
('Priyanka', 'Nigam', 'pnigam.2001@gmail.com', '9825236184', '2024-03-01', 404, 600000, 1),
('Ashish', 'Gupta', 'ashishgupta001@gmail.com', '7865236184', '2024-02-01', 405, 500000, 3),
('Aaditya', 'Singh', 'aadityasingh01@gmail.com', '9834236184', '2024-02-01', 400, 200000, 4),
('Devansh', 'Garg', 'devanshgarg001@gmail.com', '9864236184', '2024-01-01', 401, 100000, 3),
('Simran', 'Kalra', 'simrankalra01@gmail.com', '8341236184', '2024-4-04', 401, 100000, 5),
('Dhruv', 'Nagpal', 'dhruvranaa.2001@gmail.com', '9344236184', '2024-05-06', 406, 400000, 5),
('Shubham', 'Kumar', 'shubhama.2001@gmail.com', '7856436184', '2024-06-07', 404, 500000, 4),
('Anchal', 'Sehgal', 'sehgalanchal@gmail.com', '9834636184', '2024-07-12', 403, 70000, 4);

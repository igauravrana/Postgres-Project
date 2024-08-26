-- RETRIEVE A LIST OF EMPLOYEES IN A SPECIFIC DEPARTMENT
SELECT e.*, j.job_id, j.job_title, d.department_name 
FROM employees e
JOIN departments d ON d.department_id = e.department_id
JOIN jobs j ON j.job_id = e.job_id
WHERE d.department_name = 'FINANCE';

-- FIND THE HIGHEST PAID EMPLOYEES AND THE DEPARTMENTS THEY BELONG TO
SELECT 
    e.department_id, 
    d.department_name, 
    CONCAT_WS(' ', e.first_name, e.last_name) AS employee_name, 
    MAX(e.salary) AS max_salary 
FROM employees e
JOIN departments d ON d.department_id = e.department_id
WHERE e.salary = (
    SELECT MAX(salary) 
    FROM employees 
    WHERE department_id = e.department_id
)
GROUP BY e.department_id, d.department_name, e.first_name, e.last_name;

-- CALCULATE THE AVERAGE SALARY BY DEPARTMENT
SELECT 
    e.department_id, 
    d.department_name, 
    AVG(e.salary) AS avg_salary 
FROM employees e
JOIN departments d ON d.department_id = e.department_id
GROUP BY e.department_id, d.department_name;

-- LIST EMPLOYEES WHO WERE HIRED IN THE LAST YEAR
SELECT 
    e.employee_id, 
    e.first_name, 
    e.hire_date
FROM employees e
WHERE e.hire_date BETWEEN '2023-01-01' AND '2023-12-31';

-- CREATE A STORED PROCEDURE TO PROMOTE EMPLOYEES BY INCREASING THEIR SALARY BY A PERCENTAGE
CREATE OR REPLACE PROCEDURE update_emp_salary(
    increment_percentage INT,
    p_department_id INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE employees
    SET salary = salary + (salary * increment_percentage / 100)
    WHERE department_id = p_department_id;
END;
$$;

CALL update_emp_salary(10, 2);


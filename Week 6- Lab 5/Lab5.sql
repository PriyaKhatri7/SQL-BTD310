--Question 1 (a)
SELECT
    COUNT(*)
FROM
    employees
WHERE
    last_name LIKE '%Z%';

--Question 1 (b)

SELECT
    COUNT(DISTINCT(location_id) ) AS "Number of locations"
FROM
    departments;

--Question 2
--select phone_number from employees;

SELECT
    substr(phone_number,1,3) AS "Area code",
    COUNT(*) AS "Count"
FROM
    employees
GROUP BY
    substr(phone_number,1,3)
ORDER BY
    1; 

--Question 3

SELECT
    COUNT(*) AS "Others"
FROM
    locations
WHERE
    substr(postal_code,1,1) >= 'A'
    AND substr(postal_code,1,1) <= 'Z'
    OR postal_code IS NULL;

--Question 4

SELECT
    department_id,
    ( MIN(salary) + MAX(salary) ) / 2 AS "Mid salary"
FROM
    employees
GROUP BY
    department_id
HAVING
    MIN(salary) > 5000
ORDER BY
    department_id;
--SELECT DEPARTMENT_ID , AVG(SALARY) FROM EMPLOYEES WHERE SALARY > 5000 GROUP BY department_id ORDER BY DEPARTMENT_ID;

--Question 5

SELECT
    department_id,
    SUM(nvl2(commission_pct,500,1000) ) AS "Total bonuses"
FROM
    employees
GROUP BY
    department_id
ORDER BY
    department_id;

--Question 6

SELECT
    department_name,
    ( street_address
      || ', '
      || city
      || ', '
      || state_province ) AS address
FROM
    departments
    NATURAL JOIN locations
WHERE
    city != 'Seattle'
ORDER BY
    department_name;

--Question 7
--SELECT EMPLOYEE_ID, FIRST_NAME , MANAGER_ID FROM EMPLOYEES;

SELECT
    e.first_name     AS employee,
    m.first_name     AS manager,
    m.phone_number   AS "Manager's phone number"
FROM
    employees e,
    employees m
WHERE
    e.manager_id = m.employee_id
ORDER BY
    e.manager_id; 

--Question 8
--Select employee_id from employees where last_name = 'Hartstein';

SELECT
    last_name,
    employee_id
FROM
    employees
WHERE
    last_name > 'Hartstein'
    AND employee_id < (
        SELECT
            employee_id
        FROM
            employees
        WHERE
            last_name = 'Hartstein'
    );
    
--Question 9

SELECT
    e.last_name,
    e.employee_id
FROM
    employees e
    CROSS JOIN employees h
WHERE
    h.last_name = 'Hartstein'
    AND e.last_name > 'Hartstein'
    AND e.employee_id < h.employee_id
ORDER BY
    e.last_name;

--Question 10

SELECT
    substr(phone_number,1,3) AS "Area code",
    ( COUNT(*) / (
        SELECT
            COUNT(*)
        FROM
            employees
    ) ) * 100 AS "Percentage"
FROM
    employees
GROUP BY
    substr(phone_number,1,3)
ORDER BY
    2;
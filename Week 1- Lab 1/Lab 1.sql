-- Question 1
DESCRIBE employees;

-- Question 2

SELECT
    employee_id,
    last_name
FROM
    employees
WHERE
    manager_id = '124'
    AND salary > 3000;

-- Question 3

SELECT DISTINCT
    ( region_id )
FROM
    countries;

-- Question 4

SELECT
    country_id
    || ', '
    || country_name
    || ', '
    || region_id AS countries
FROM
    countries
ORDER BY
    country_id,
    region_id;

-- Question 5

SELECT
    street_address   AS "STREET ADDRESS",
    city
FROM
    locations
WHERE
    city LIKE 'M%';

-- Question 6

SELECT
    last_name,
    first_name
FROM
    employees
WHERE
    department_id = &department_id;

-- Question 7
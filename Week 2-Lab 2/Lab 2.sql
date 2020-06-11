--Question1
/* Type of phone_number is varchar2. An empty phone_number takes up 0 bytes in memory because it can contain up to 20 characters. */
DESCRIBE employees;

--Question 2
SELECT
    phone_number
FROM
    employees
ORDER BY
    1;

--Question 3

SELECT
    '['
    || department_id
    || '] '
    || department_name
    || ':'
    || q'[ Manager's ID -->]'
    || '  ['
    || manager_id
    || ']' AS "Departments and managers"
FROM
    departments; 

--Question 4

DEFINE first = 'King'

DEFINE last = 'Taylor'

SELECT
    *
FROM
    employees
WHERE
    last_name BETWEEN '&first' AND '&last';

UNDEFINE first

UNDEFINE last

--Question 5

DEFINE FIRST = '01-JAN-90'
DEFINE LAST = '31-DEC-99'

SELECT
    *
FROM
    employees
WHERE
    hire_date BETWEEN '&FIRST' AND '&LAST'
ORDER BY
    hire_date DESC;

UNDEFINE FIRST UNDEFINE LAST
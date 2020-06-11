/*Question 1 -- The employees can retire after 20 years (240 months) from their hire date. 
List the employees (id, last name, first name) and their retirement date (label the column), sorted from the 
earliest to the latest retirement. */

SELECT
    employee_id,
    last_name,
    first_name,
    hire_date   AS "Retirement Date"
FROM
    employees
ORDER BY
    hire_date;


/* Question 2 -- Write a query that displays how many weeks are left from now to Christmas Day.*/

SELECT
    (TO_DATE('25-DEC-18','DD-MON-YY') - trunc(sysdate) ) /7 AS weeks
FROM
    dual;


/* Question 3 -- Write a query that changes any s (lower or upper case) in the first name of employees to $. 
List only those that their names changes.*/

SELECT
    replace(replace(first_name, 'S', '$'), 's', '$')
FROM
    employees
    WHERE LOWER (first_name) like '%s%';


/* Question 4 -- List the employee names as (last name, first name) in a column labeled as “Employee names”. 
Pad the left side of the names with exactly 3 *’s, and pad the right side with ‘-‘ to the length of 30.*/

SELECT rpad(('***' || last_name || ', ' || first_name), 30, '-') AS "Employee names"
From Employees;

/* Question 5 -- List the first names with this change applied: Replace any ‘e’ (lower or upper case) with ‘he’. 
However, make sure the first letter of names stay capitalized. */

select initcap(replace(lower(first_name),'e','he')) FROM EMPLOYEES;




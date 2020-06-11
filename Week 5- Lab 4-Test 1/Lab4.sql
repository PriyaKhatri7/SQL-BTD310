SELECT * FROM employees;

--Question 1. Create a report (list) that produces the following (as shown in the sample):
-- -	for employees with no commission:
-- <employee first name> earns <salary> monthly and no commission to afford spending <salary / 3> on housing.
-- -	for employees with commission:
-- <employee first name> earns <salary> monthly and <commission_pct as percentage> commission to afford spending <salary / 3> on housing.
-- -	Label the column as Housing Expenses.

SELECT
    first_name
    || ' '
    || 'earns '
    || to_char(salary, 'fm$99,999.00')
    || ' '
    || 'monthly and '
    --|| nvl(commission_pct,'No commision')
    || nvl2 (commission_pct, '%' || to_char(commission_pct*100, 'fm99.00'), 'no commission')
    || ' '
    || 'to afford spending '
    || to_char(trunc(salary/3,2), 'fm$99,999.00')
    || ' on housing' AS "HOUSEING EXPENSE"
FROM
    employees;

--Question 2. Display each employee’s last name, hire date, and his 20th year celebration as shown in the sample below. 
--Note that the celebration is the next Friday after his 20th year of employment. Pay attention to the formatting details.

SELECT
    last_name,
    
    to_char(hire_date,'DAY, DD/mon/RRRR')   AS "Hire Date",
    TO_CHAR( (next_day(hire_date,'Friday') ),'Day, DD/Mon/RRRR') AS "20 years celebration"
FROM
    employees;

--Question 3. Display the hire dates of employees as shown in the sample, sorted by the day of the week, starting with Monday.

SELECT
    TO_CHAR(hire_date,'fmDay," the "DdSpth "of" Month, YYYY') AS "Day of Hire"
FROM
    employees
ORDER BY to_char(hire_date - 1 , 'D') ;

--Question 4. Using the DECODE function, write a query that displays the region of the phone number of each employee, 
--using the following data, as shown in sample.

SELECT
    LAST_NAME, PHONE_NUMBER ,
    DECODE (substr(PHONE_NUMBER,0,3), 
                       '515', 'A',
                       '590', 'B',
                       '603', 'C',
                       '650', 'D',
                                'E') REGION
    FROM employees
    Order by region, phone_number;
  
  
    

--Question 5. Rewrite the statement in the preceding exercise using the CASE syntax.
 SELECT
    LAST_NAME, PHONE_NUMBER ,
    case substr(PHONE_NUMBER,0,3) 
                    when   '515' then 'A'
                     when   '590' then 'B'
                     when  '603' then 'C'
                     when  '650' then'D'
                           else     'E'
    end
    "REGION"
    FROM employees
    Order by region, phone_number;
--Question 6.Create a query that will display a 1 if the employee was hired 
--in 1995, and a 0 otherwise, as shown in the sample.


select TO_CHAR(hire_date, 'RR-MM-DD') AS HIRE_DATE,
    decode(to_CHAR(hire_date,'RR'),
            '95' , 1,
                0)
                AS "1995"
                from employees

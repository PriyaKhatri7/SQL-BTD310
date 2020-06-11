-- Question 1
CREATE TABLE dep_cpy
    AS
        SELECT
            *
        FROM
            departments;

-- Question 2
INSERT INTO dep_cpy
VALUES (200, 'Programming', 201, NULL);

-- Question 3
INSERT INTO dep_cpy (
    department_id,
    department_name,
    location_id
) VALUES (
    210,
    'Web design',
    1700
);

-- Question 4

SELECT
    USER "USER NAME",
    TO_CHAR(current_date,'HH12:MI') "SERVER TIME",
    TO_CHAR(SYSDATE,'HH24:MI') "SESSION TIME"
FROM
    dual;
    
-- Question 5

UPDATE dep_cpy
    SET
        manager_id = 103
WHERE
    department_name = 'Shipping';

-- Question 6

UPDATE dep_cpy
    SET
        manager_id = (
            SELECT
                manager_id
            FROM
                dep_cpy
            WHERE
                department_name = 'Sales'
        ),
        location_id = (
            SELECT
                location_id
            FROM
                dep_cpy
            WHERE
                department_name = 'Sales'
        )
WHERE
    department_name = 'Accounting';

-- Question 7

COMMIT;  

-- Question 8

DELETE FROM dep_cpy WHERE
    department_name = 'Administration';

SELECT
    *
FROM
    dep_cpy;

-- Question 9
rollback;

-- Question 10
DELETE FROM dep_cpy WHERE
    department_name = 'Administration';

SELECT
    *
FROM
    dep_cpy;
    
-- Question 11
CREATE TABLE MyTable (
    M_ID INT PRIMARY KEY CHECK (M_ID>0 AND M_ID<99),
    M_DATE DATE DEFAULT sysdate NOT NULL,
    M_SUBJECT VARCHAR(100) UNIQUE
);

-- Question 12
ROLLBACK;

-- Question 13
ALTER TABLE MyTable
ADD M_CODE CHAR(3) DEFAULT 'ABC';

-- Question 14
DESCRIBE MyTable;

-- Question 15
DECLARE
v_max_sal employees.salary%type;
BEGIN
  SELECT MAX(salary)
  INTO v_max_sal
  FROM employees
  WHERE department_ID = 10;
  DBMS_output.put_line('Maximum salary in department 10 is ' || v_max_sal);
END;
/

-- Question 16
DECLARE
v_max_sal employees.salary%TYPE;
v_dept_no employees.department_ID%TYPE := &dept;
v_last employees.last_name %type;
BEGIN
  SELECT MAX(salary)
  INTO v_max_sal
  FROM employees
  WHERE department_ID = v_dept_no;
  
  SELECT last_name
  INTO v_last
    FROM employees
    WHERE salary = v_max_sal;
    
    DBMS_output.put_line('Maximum salary in department ' || 
    v_dept_no || ' is ' || v_max_sal || ' earned by ' || v_last);
END;
/




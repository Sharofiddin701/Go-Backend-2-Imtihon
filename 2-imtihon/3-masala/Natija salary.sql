CREATE TABLE IF NOT EXISTS Employee (
    id INT,
    name VARCHAR(255),
    salary INT,
    departmentId INT
);

CREATE TABLE IF NOT EXISTS Department (
    id INT,
    name VARCHAR(255)
);

INSERT INTO Employee (id, name, salary, departmentId) VALUES ('1', 'Joe', '70000', '1');
INSERT INTO Employee (id, name, salary, departmentId) VALUES ('2', 'Jim', '90000', '1');
INSERT INTO Employee (id, name, salary, departmentId) VALUES ('3', 'Henry', '80000', '2');
INSERT INTO Employee (id, name, salary, departmentId) VALUES ('4', 'Sam', '60000', '2');
INSERT INTO Employee (id, name, salary, departmentId) VALUES ('5', 'Max', '90000', '1');

INSERT INTO Department (id, name) VALUES ('1', 'IT');
INSERT INTO Department (id, name) VALUES ('2', 'Sales');

select *from employee;

select *from department;

/*To'g'ri ishlayotganini 100% bilishim uchun yana insert qildim, Employee table ga */
INSERT INTO Employee (id, name, salary, departmentId) VALUES ('1', 'Joe', '70000', '1');
INSERT INTO Employee (id, name, salary, departmentId) VALUES ('2', 'Jim', '90000', '1');
INSERT INTO Employee (id, name, salary, departmentId) VALUES ('3', 'Henry', '80000', '2');
INSERT INTO Employee (id, name, salary, departmentId) VALUES ('4', 'Sam', '60000', '2');
INSERT INTO Employee (id, name, salary, departmentId) VALUES ('5', 'Max', '90000', '1');

SELECT 
    d.name AS Department, 
    e.name AS Employee, 
    e.salary AS Salary
FROM Employee e                                                  
JOIN Department d ON e.departmentId = d.id
WHERE NOT EXISTS (
    SELECT 1 
    FROM Employee e2 
    WHERE e2.departmentId = e.departmentId 
      AND e2.salary > e.salary
)
ORDER BY Department;

 department | employee | salary 
------------+----------+--------
 IT         | Max      |  90000
 IT         | Jim      |  90000
 IT         | Max      |  90000
 IT         | Jim      |  90000
 Sales      | Henry    |  80000
 Sales      | Henry    |  80000

Drop database if exists g00359990;
Show databases;
create database g00359990 CHARACTER SET utf8 COLLATE UTF8_GENERAL_CI ;
Use g00359990;
Show tables;
Drop table if exists dept;


create table dept (
  deptno tinyint unsigned NOT NULL auto_increment ,  
  dname varchar(45) NOT NULL, -- maximum column length is 45 characters
  location ENUM ('New York','Chicago','Boston','Dallas') Not Null,  -- default value is first element in list
  last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (deptno)
  );

/* CHAR fixed length, Max no of char 255, right padded with space to required length, 50% faster than VARCHAR, static memory allocation
 VARCHAR variable length field, Max no of char 255, slower that CHAR, dynamic memory allocation
*/

show tables;
select * from dept;
Insert into dept values (10, 'Accounting', 'New York', CURRENT_TIMESTAMP), (20, 'Research', 'Dallas',CURRENT_TIMESTAMP),(30, 'Sales', 'Chicago',CURRENT_TIMESTAMP),(40, 'Operations', 'Boston',CURRENT_TIMESTAMP);

Drop table if exists emp;

Show databases;
Use g00359990;
create table emp (
  empno Int(6) unsigned zerofill auto_increment, -- see Numbers.sql next week
  title ENUM ('Mr.', 'Mrs.', 'Miss.', 'Ms.','Dr.','Fr.','Rev.'), --  constraint on values entered into the column, default value is first element in list, if wrong data entered MySQL truncates the illegal value to  ' ' (an empty string).
  ename varchar(45) not null default 'Smith',
  degree SET ('B Sc','B Eng','B Comm','M Sc','Phd') not null ,
  job ENUM ('CLERK','SALESMAN','MANAGER','ANALYST','PRESIDENT'),
  mgr smallint unsigned,
  hiredate date not null,
  currency_symbol varchar(10),
  salary DECIMAL(6,2) unsigned,# 6 is the total number of digits and 2 is the number of digits after the decimal point, values that can be stored in the salary column range from -9999.99 to 9999.99
  comm DECIMAL(6,2) unsigned, # values that can be stored in the comm column range from -9999.99 to 9999.99
  deptno TINYINT unsigned not null default 20,
  last_update  TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  picture LONGBLOB DEFAULT NULL,           # Picture in DATABASE as BLOB (up to 4.2GB)
  picture_path varchar(20) DEFAULT NULL,   # Path to where picture is stored in file system,
  primary key (empno)
)  Engine=InnoDB;

describe emp;

select * from emp;

-- Load data local infile "f:/emp.tsv" into table emp lines terminated by "\r\n"; 

INSERT INTO emp (empno, title, ename, degree, job, mgr, hiredate, currency_symbol,salary, comm, deptno,picture,picture_path) VALUES
(7369, 'Dr.','SMITH', ('B Sc,M Sc,Phd'),'CLERK', 7566, '2010-12-17', 0xE282AC,800.23, NULL, 20,load_file('c:/g00359990/pic1.png'),'/pic1.png'),
(7499, 'Mr.','ALLEN', ('B Eng,Phd'),'SALESMAN', 7698, '2011-02-20',0xE282AC, 1600.56, 300.23, 30, load_file('c:/g00359990/pic2.png'),'/pic2.png'),
(7521, 'Mr.','WARD', ('B Eng,B Comm'),'SALESMAN', 7566, '2011-02-22',0xE282AC, 1250, 500, 30,load_file('c:/g00359990/pic3.png'),'/pic3.png'),
(7566, 'Rev.','JONES', ('B Sc,M Sc,Phd'),'MANAGER', 7839, '2011-04-02',0xE282AC, 2976, NULL, 20, load_file('c:/g00359990/pic4.png'),'/pic4.png'),
(7654, 'Fr.','MARTIN', ('B Comm,Phd'),'SALESMAN', 7698, '2011-09-28',0xE282AC, 1250, 1400, 30,load_file('c:/g00359990/pic5.png'),'/pic5.png'),
(7698, 'Mr.','BLAKE', ('B Sc,B Eng,B Comm,M Sc,Phd'),'MANAGER', 7839, '2011-01-05', 0xE282AC,2850, NULL, 30, load_file('c:/g00359990/pic6.png'),'/pic6.png'),
(7782, 'Mr.','CLARK', ('B Comm,Phd'),'MANAGER', 7839, '2011-09-06',0xE282AC, 2450, NULL, 10, load_file('c:/g00359990/pic7.png'),'/pic7.png'),
(7788, 'Mr.','SCOTT', ('B Comm,Phd'),'ANALYST', 7788, '2012-12-09',0xE282AC, 3000, NULL, 20, load_file('c:/g00359990/pic8.png'),'/pic8.png'),
(7839, 'Miss.','KING',('B Comm'), 'PRESIDENT', NULL, '2011-11-17',0xE282AC, NULL, NULL, 10, load_file('c:/g00359990/pic9.png'),'/pic9.png'),
(7844, 'Mr.','TURNER', ('B Comm,Phd'),'SALESMAN', 7698, '2011-09-08', 0xE282AC,1500, 0, 30, load_file('c:/g00359990/pic10.png'),'/pic10.png'),
(7876, 'Mrs.','ADAMS',('B SC,M Sc') ,'CLERK', 7788, '2013-12-01',0xE282AC, 1100, NULL, 20, load_file('c:/g00359990/pic11.png'),'/pic11.png'),
(7900, 'Mr.','JAMES', ('B Comm,Phd'),'CLERK', 7698, '2011-12-03', 0xE282AC,950, NULL, 30, load_file('c:/g00359990/pic12.png'),'/pic12.png'),
(7902, 'Mrs.','FORD', ('B Comm,M Sc,Phd'),'ANALYST', 7902, '2011-12-01', 0xE282AC,3000, NULL, 20,load_file('c:/g00359990/pic6.png'),'/pic6.png'),
(7934, 'Mr.','MILLER',('B SC,M Sc') ,'CLERK', 7782, '2012-06-23',0xE282AC, 1300, NULL, 10, load_file('c:/g00359990/pic8.png'),'/pic8.png');


show warnings;

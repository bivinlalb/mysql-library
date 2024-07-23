create database library ;
use library ;
create table  Branch(
Branch_no int  PRIMARY KEY , 
Manager_Id  int,
Branch_address varchar(100), 
Contact_no float(10) unique
);
create table  Employee(  
Emp_Id int PRIMARY KEY,  
Emp_name  varchar(50),
Position  varchar(50),
Salary int,
Branch_no int,
FOREIGN KEY (Branch_no)references Branch(Branch_no)
);
create table Books(  
ISBN int PRIMARY KEY,  
Book_title varchar(100),  
Category varchar(100), 
Rental_Price int,
Status int check (Status <>0), 
Author varchar(100), 
Publisher varchar(100)
);
 create table Customer(  
Customer_Id int PRIMARY KEY ,
Customer_name varchar(100),  
Customer_address varchar(100),  
Reg_date date
);
create table  IssueStatus(  
Issue_Id int PRIMARY KEY,
Issued_cust int,
FOREIGN KEY (Issued_cust)references CUSTOMER(customer_id),
Issue_date date ,
ISBN_book int ,
FOREIGN KEY (ISBN_book) references Books(ISBN)
);
create table ReturnStatus(  
Return_Id int PRIMARY KEY,  
Return_cust int,
Return_book_name varchar(100), 
Return_date date,
Isbn_book2 int ,
FOREIGN KEY (Isbn_book2)references BOOKS(ISBN)
);

Insert into branch (Branch_no,Manager_Id,Branch_address,Contact_no) values
(101,1001,'kumarapuram',9998512315),
(102,1002,'medical colage',9512365487),
(103,1003,'ullor',9874562135),
(104,1004,'sreekayram',9826956204),
(105,1005,'kayivattom',9556956205),
(106,1006,'techinopark',7654216212),
(107,1007,'ust',8586847541),
(108,1008,'lulu_mall',8485848954),
(109,1009,'mot',8451623512),
(110,1010,'patta',9856321475);
Insert into Employee (Emp_Id,Emp_name,Position,Salary,Branch_no) values
(1001,'arun','manager',51000,101),
(1002,'vishnu','manager',51000,102),
(1003,'manu','manager',25000,103),
(1004,'niyas','manager',25000,104),
(1005,'priya','manager',25000,105),
(1006,'akhil','manager',25000,106),
(1007,'gokul','manager',50500,107),
(1008,'anathu','manager',50500,108),
(1009,'reshma','manager',25000,109),
(1010,'jagan','manager',25000,110),
(10011,'raju','csa',16000,101),
(10012,'karthik','csa',18000,101),
(10021,'raju','csa',16000,102),
(10022,'karthika','csa',18000,102),
(10031,'remesh','csa',16000,103),
(10032,'saji','csa',18000,103),
(10041,'prasad','csa',16000,104),
(10042,'gopal','csa',18000,104),
(10051,'sunil','csa',16000,105),
(10052,'suni','csa',18000,105),
(10061,'anjana','csa',16000,106),
(10062,'parvathy','csa',18000,106),
(10071,'vineeth','csa',16000,101),
(10072,'midhun','csa',18000,107),
(10081,'anju','csa',16000,108),
(10082,'praveen','csa',18000,101),
(10091,'samson','csa',16000,109),
(10092,'thomas','csa',18000,109),
(10101,'rakesh','csa',16000,101),
(10102,'kamal','csa',18000,110);
Insert into Books (ISBN,Book_title,Category,Rental_Price,Status,Author,Publisher) values
(51,'To Kill a Mockingbird','Classics',25,1,'Harper Lee','Harper Perennial Modern Classics'),
(52,'The Great Gatsby','Fiction',30,1,'F. Scott Fitzgerald','Scribner'),
(53,'Harry Potter and the Sorcerer’s Stone','Fantasy',25,1,'J.K. Rowling','Pottermore Publishing'),
(54,'Animal Farm','Classics',25,1,'George Orwell','Signet Classics'),
(55,'1984','Classics',25,1,'George Orwell','Plume'),
(56,'The Hobbit','Fantasy',25,1,'J.R.R. Tolkien',' Houghton Mifflin'),
(57,'The Little Prince','Fantasy',25,1,'Antoine de Saint-Exupéry','Harcourt'),
(58,'Fahrenheit 451','Fiction',30,1,'Ray Bradbury','Simon & Schuster'),
(59,'The Catcher in the Rye','Classics',25,1,'J.D. Salinger','Back Bay Books'),
(60,'The Lion,the Witch and the Wardrobe','Fantasy',25,1,'C.S. Lewis',' HarperCollins Publishers');
Insert into Customer (Customer_Id,Customer_name,Customer_address,Reg_date) values
(0001,'madhulal','kumarapuram','2020-12-02'),
(0002,'viji','medical colage','2020-12-07'),
(0003,'bivina','ullor','2020-12-12'),
(0004,'arun_das','sreekayram','2020-12-22'),
(0005,'vishnu_l','kayivattom','2020-12-26'),
(0006,'bivinlal','techinopark','2020-12-05'),
(0007,'babin_santhosh','ust','2020-12-09'),
(0008,'krishna_priya','lulu_mall','2020-12-03'),
(0009,'anathu_shaji','mot','2020-12-06'),
(00010,'athul','patta','2020-12-12');
Insert into IssueStatus (Issue_Id,Issued_cust,Issue_date,ISBN_book) values 
(1,0001,'2020-12-02',51),
(2,0002,'2021-01-07',52),
(3,0003,'2021-06-12',53),
(4,0004,'2021-06-22',55),
(5,0005,'2021-08-26',58),
(6,0006,'2021-09-05',60),
(7,0007,'2021-12-09',54),
(8,0008,'2022-01-03',59),
(9,0009,'2022-02-06',57),
(10,00010,'2022-03-12',56),
(11,0007,'2022-06-19',52),
(12,0002,'2022-06-17',55),
(13,0004,'2022-12-31',54);
Insert into ReturnStatus (Return_Id,Return_cust,Return_book_name,Return_date,Isbn_book2) values 
(1,0007,'Animal Farm','2022-06-19',54),
(2,0002,'The Great Gatsby','2022-06-17',52),
(3,0004,'1984','2022-12-31',55),
(4,0008,'The Catcher in the Rye','2023-01-05',59),
(5,0001,'To Kill a Mockingbird','2023-01-08',51);
-- Retrieve the book title, category, and rental price of all available books. 
select Book_title,Category,Rental_Price from Books;
-- List the employee names and their respective salaries in descending order of salary. 
select Emp_name,Salary from Employee order by Salary desc;
-- Retrieve the book titles and the corresponding customers who have issued those books.
select Book_title,Customer_name from Books,IssueStatus,Customer where Books.ISBN=IssueStatus.ISBN_book and Customer.Customer_Id=IssueStatus.Issued_cust;
-- Display the total count of books in each category. 
select Category,count(*)as 'no of books' from Books group by Category;
--  Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
select Emp_name,Position from Employee where Salary>50000;
-- List the customer names who registered before 2022-01-01 and have not issued any books yet. 
select Customer_name from Customer where Reg_date<'2022-01-01';
-- Display the branch numbers and the total count of employees in each branch. 
select Branch_no,count(*)as 'no of employees' from Employee group by Branch_no;
-- Display the names of customers who have issued books in the month of June 2022.
SELECT C.CUSTOMER_NAME,I.ISSUE_DATE FROM CUSTOMER C JOIN ISSUESTATUS I ON I.ISSUED_CUST=C.CUSTOMER_ID WHERE I.ISSUE_DATE BETWEEN '2022-06-01' AND '2022-06-30';
-- Retrieve book_title from book table containing Fantasy. 
select Book_title from Books where Category = 'Fantasy';
-- Retrieve the branch numbers along with the count of employees for branches having more than 5 employees
select Branch_no,count(*)as 'no of employees' from Employee group by Branch_no having count(*)>5;
-- Retrieve the names of employees who manage branches and their respective branch addresses.
select Employee.Emp_name,branch.Branch_address from Employee inner join branch on Employee.Emp_Id = branch.Manager_Id;
--  Display the names of customers who have issued books with a rental price higher than Rs. 25.
SELECT C.CUSTOMER_NAME, B.BOOK_TITLE, B.RENTAL_PRICE FROM ISSUESTATUS I JOIN BOOKS B ON I.ISBN_BOOK = B.ISBN JOIN CUSTOMER C ON I.ISSUED_CUST = C.CUSTOMER_ID WHERE B.RENTAL_PRICE > 25;


drop database library;

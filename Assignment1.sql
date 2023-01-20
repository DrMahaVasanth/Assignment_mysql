CREATE TABLE SalesPeople(
snum int,
sname char(20) unique, 
city char(30),
comm int,
primary key (snum)
);
select * from SalesPeople;

insert into SalesPeople(snum,sname,city,comm)
values(1001,'Peel','London',12),
(1002,'Serres', 'Sanjose',13),
(1004,'Motika','London',11),
(1007,'Rifkin','Barcelona',15),
(1003,'Axelrod','Newyork',10);

select * from SalesPeople;

# number of salesperson starts with A
select count(sname) from SalesPeople
	where sname LIKE 'A%';

# Count the number of Salesperson belonging to Newyork
select count(sname) from SalesPeople
 
where city='Newyork';

# Display the number of Salespeople belonging to London and belonging to Paris
select sname, city from SalesPeople

where city='London' and city='Paris';

create table Customers(
cnum int,
cname char(20),
city char(30) not null,
snum int,
primary key (cnum),
foreign key (snum) references SalesPeople (snum)
);
insert into Customers(cnum,cname,city,snum)
values(2001, 'Hoffman','London',1001),
(2002,'Giovanni','Rome',1003),
(2003,'Liu','Sanjose',1002),
(2004,'Grass','Berlin',1002),
(2006,'Clemens','London',1001),
(2008,'Cisneros','Sanjose',1007),
(2007,'Pereira','Rome',1004);

select * from Customers;

CREATE TABLE Orders(
Onum int,
Amt float,
Odate date,
cnum int,
snum int,
primary key (Onum), 
foreign key (cnum) references Customers (cnum),
foreign key (snum) references SalesPeople (snum)
);
INSERT INTO Orders(Onum,Amt,Odate,cnum,snum)
values(3001, 18.69, '1990-10-3', 2008, 1007),
(3003, 767.19, '1990-10-3', 2001, 1001),
(3002, 1900.10, '1990-10-3', 2007, 1004),
(3005,  5160.45, '1990-10-3', 2003, 1002),
(3006,  1098.16, '1990-10-3', 2008, 1007),
(3009, 1713.23, '1990-10-4', 2002, 1003),
(3007,  75.75, '1990-10-4', 2004, 1002),
(3008,  4273.00, '1990-10-5', 2006, 1001),
(3010,  1309.95, '1990-10-6', 2004, 1002),
(3011,  9891.88, '1990-10-6', 2006, 1001);

#Display all the Salesperson whose all orders worth is more than Rs. 2000
select SalesPeople.sname, Orders.Amt,Orders.snum

	from Orders

	Inner join SalesPeople on Orders.snum=SalesPeople.snum where Orders.Amt>=2000;

# Display the number of orders taken by each Salesperson and their date of orders
select SalesPeople.sname, Orders.Onum, Orders.Odate, Orders.snum

from Orders 
    
Inner join SalesPeople ON Orders.snum=SalesPeople.snum; 
    
    





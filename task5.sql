create table countorders (
	customerNumber int not null,
	orderCount int not null,
	primary key(customerNumber),
	foreign key(customerNumber) references customers(customerNumber)
);

insert into countorders
select customers.customerNumber, count(orderNumber)
from orders group by customerNumber;

create trigger updateordercnt 
after insert on orders for each row
update countorders set orderCount=orderCount+1 where customerNumber=New.customerNumber; 

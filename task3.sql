start transaction;
select @cus:=MAX(customerNumber)+1 from customers;
insert into customers values(@cus,'name','lname','fname','phno','add1','add2','city','state','zip','india',null,null);
select @ord:=MAX(orderNumber)+1 from orders;
insert into orders values (@ord,'2020-06-09','2020-06-20',null,'In Process',null,@cus);
select @pcode:=productCode from products where productLine='Motorcycles' limit 1;
select @price:=buyPrice from products where productCode=@pcode;
insert into orderdetails values (@ord,@pcode,1,@price,5);
insert into payments values (@cus,'13243','2020-06-09',@price,@ord);
commit;
/*
mysql> source C:\Users\Utkarsh\Documents\sqlonboarding1\task3.sql
Query OK, 0 rows affected (0.00 sec)

+-----------------------------+
| @cus:=MAX(customerNumber)+1 |
+-----------------------------+
|                         497 |
+-----------------------------+
1 row in set, 1 warning (0.00 sec)

Query OK, 1 row affected (0.01 sec)

+--------------------------+
| @ord:=MAX(orderNumber)+1 |
+--------------------------+
|                    10426 |
+--------------------------+
1 row in set, 1 warning (0.00 sec)

Query OK, 1 row affected (0.02 sec)

+---------------------+
| @pcode:=productCode |
+---------------------+
| S10_1678            |
+---------------------+
1 row in set, 1 warning (0.00 sec)

+------------------+
| @price:=buyPrice |
+------------------+
|            48.81 |
+------------------+
1 row in set, 1 warning (0.05 sec)

Query OK, 1 row affected (0.17 sec)

Query OK, 1 row affected (0.00 sec)

Query OK, 0 rows affected (0.16 sec)

*/
select customers.customerName, orders.ordernumber, orders.shippedDate, payments.paymentDate, payments.amount, orderdetails.quantityOrdered, products.productName, productlines.image
	from customers 
    inner join orders using(customerNumber)
    inner join orderdetails using(orderNumber)
    inner join payments using(customerNumber)
    inner join products using(productCode)
    inner join productlines using(productLine)
    where customerNumber=497;
/*
mysql> source C:\Users\Utkarsh\Documents\sqlonboarding1\task4.sql
+--------------+-------------+-------------+-------------+--------+-----------------+---------------------------------------+--------------+
| customerName | ordernumber | shippedDate | paymentDate | amount | quantityOrdered | productName                           | image        |
+--------------+-------------+-------------+-------------+--------+-----------------+---------------------------------------+--------------+
| name         |       10426 | NULL        | 2020-06-09  |  48.81 |               1 | 1969 Harley Davidson Ultimate Chopper | 0x           |
+--------------+-------------+-------------+-------------+--------+-----------------+---------------------------------------+--------------+
1 row in set (0.12 sec)
mysql> explain select customers.customerName, orders.ordernumber, orders.shippedDate, payments.paymentDate, payments.amount, orderdetails.quantityOrdered, products.productName, productlines.image
    -> from customers
    ->     inner join orders using(customerNumber)
    ->     inner join orderdetails using(orderNumber)
    ->     inner join payments using(customerNumber)
    ->     inner join products using(productCode)
    ->     inner join productlines using(productLine)
    ->     where customerNumber=497;
+----+-------------+--------------+------------+--------+------------------------+----------------+---------+----------------------------------------+------+----------+-------+
| id | select_type | table        | partitions | type   | possible_keys          | key            | key_len | ref                                    | rows | filtered | Extra |
+----+-------------+--------------+------------+--------+------------------------+----------------+---------+----------------------------------------+------+----------+-------+
|  1 | SIMPLE      | customers    | NULL       | const  | PRIMARY                | PRIMARY        | 4       | const                                  |    1 |   100.00 | NULL  |
|  1 | SIMPLE      | orders       | NULL       | ref    | PRIMARY,customerNumber | customerNumber | 4       | const                                  |    1 |   100.00 | NULL  |
|  1 | SIMPLE      | payments     | NULL       | ref    | PRIMARY                | PRIMARY        | 4       | const                                  |    1 |   100.00 | NULL  |
|  1 | SIMPLE      | orderdetails | NULL       | ref    | PRIMARY,productCode    | PRIMARY        | 4       | classicmodels.orders.orderNumber       |    9 |   100.00 | NULL  |
|  1 | SIMPLE      | products     | NULL       | eq_ref | PRIMARY,productLine    | PRIMARY        | 17      | classicmodels.orderdetails.productCode |    1 |   100.00 | NULL  |
|  1 | SIMPLE      | productlines | NULL       | eq_ref | PRIMARY                | PRIMARY        | 52      | classicmodels.products.productLine     |    1 |   100.00 | NULL  |
+----+-------------+--------------+------------+--------+------------------------+----------------+---------+----------------------------------------+------+----------+-------+
6 rows in set, 1 warning (0.06 sec)
*/
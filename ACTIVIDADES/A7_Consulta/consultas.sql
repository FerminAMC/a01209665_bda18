use classicmodels; 
#explain select * from orderdetails;
#show index from orderdetails;
#describe orderdetails;
explain
select *
from orderdetails 
where quantityOrdered = 45;

create index quantity_idx
on orderdetails (quantityOrdered);

show index from orderdetails;

explain
select orders.*, orderdetails.*, products.*, productlines.* 
from productlines 
join products on products.productLine = productlines.productLine
join orderdetails on orderdetails.productCode = products.productCode
join orders on orders.orderNumber = orderdetails.orderNumber
where customerNumber = 112;


select * from orders


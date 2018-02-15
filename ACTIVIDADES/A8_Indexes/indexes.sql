create index test on customers (customerName);

create index olnIndex on orderdetails (orderLineNumber);
create index compositeIndex1 on orderdetails (quantityOrdered, orderLineNumber);
create index compositeIndex2 on orderdetails (orderLineNumber, quantityOrdered);
create index compositeIndex3 on orderdetails (orderLineNumber, quantityOrdered) using hash;

select * from orderdetails force index(olnIndex)
where orderLineNumber = 1 and quantityOrdered > 50;

select * from orderdetails force index(compositeIndex1)
where orderLineNumber = 1 and quantityOrdered > 50;

select * from orderdetails force index(compositeIndex2)
where orderLineNumber = 1 and quantityOrdered > 50;

select productCode from orderdetails force index(olnIndex1)
where orderLineNumber = 1 and quantityOrdered > 50;

select productCode from orderdetails force index(compositeIndex1)
where orderLineNumber = 1 and quantityOrdered > 50;

select productCode from orderdetails force index(compositeIndex2)
where orderLineNumber = 1 and quantityOrdered > 50;

explain
select orderLineNumber, count(*) from orderdetails force index(olnIndex)
where orderLineNumber = 1 and quantityOrdered > 50
group by orderLineNumber;

explain
select orderLineNumber, count(*) from orderdetails force index(compositeIndex1)
where orderLineNumber = 1 and quantityOrdered > 50
group by orderLineNumber;

explain
select orderLineNumber, count(*) from orderdetails force index(compositeIndex2)
where orderLineNumber = 1 and quantityOrdered > 50
group by orderLineNumber;

explain
select orderLineNumber, count(*) from orderdetails force index(compositeIndex3)
where orderLineNumber = 1 and quantityOrdered > 50
group by orderLineNumber;

explain format = json
select * from orderdetails force index (compositeIndex2)
where orderLineNumber = 1 and quantityOrdered > 50;



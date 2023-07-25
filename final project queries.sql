select * from internetsales;
select * from customer;
select * from geography;
select * from product;
select * from productsubcategory;
select * from productcategory;
select * from SalesBudget;

create table internetsales (productkey int,
						   orderdatekey int,
						   duedatekey int,
						   shipdatekey int,
						   customerkey int,
						   salesorder varchar,
						   salesamount decimal);

copy internetsales from 'E:\postgre\internetsales.csv'delimiter ',' csv header;

create table SalesBudget ("Date" date,
						 Budget int);

copy SalesBudget from 'E:\postgre\SalesBudget.csv'delimiter ',' csv header;

select a.customerkey,
a.firstname, 
a.lastname,
a.yearlyincome,
b.city,
b.stateprovincename,
b.englishcountryregionname
from customer as a 
left join geography as b
on a.geographykey = b.geographykey
order by customerkey;

select a.productkey,
a.productsubcategorykey,
a.englishproductname,
a.color,
a.size,
b.englishproductsubcategoryname,
b.productcategorykey
from product as a 
inner join productsubcategory as b
on a.productsubcategorykey = b.productsubcategorykey
order by englishproductname;

create table productandsubcateg as (select a.productkey,
a.productsubcategorykey,
a.englishproductname,
a.color,
a.size,
b.englishproductsubcategoryname,
b.productcategorykey
from product as a 
inner join productsubcategory as b
on a.productsubcategorykey = b.productsubcategorykey
order by englishproductname);

select * from productandsubcateg;

select a.productkey,
a.productsubcategorykey,
a.englishproductname,
a.color, 
a.size,
a.englishproductsubcategoryname,
b.englishproductcategoryname,
b.productcategorykey
from productandsubcateg as a 
inner join productcategory as b
on a.productcategorykey = b.productcategorykey
order by englishproductname;

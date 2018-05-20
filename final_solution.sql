/*
category(CategoryID, CategoryName)
customer(CustomerID, FirstName, LastName, Address, City, Phone)
order(OrderID, CustomerID, OrderDate)
orderdetail(OrderID, ProductID, Quantity)
product(ProductID, ProductName, CategoryID, SupplierID, UnitPrice, UnitInStock)
supplier(SupplierID, SupplierName, Address, City, Phone)
*/

-- 1. Find the total sales in every 6 months of all supplier

    select DATE_FORMAT(DATE_ADD(cal.calDate, INTERVAL -5 MONTH), "%Y-%m") as orderDateStart, DATE_FORMAT(cal.calDate,"%Y-%m") as orderDateEnd, sum(p.UnitPrice * od.Quantity) as sumOfSale
    from product as p, orderdetail as od, (
        SELECT OrderID,
        CASE
            WHEN month(OrderDate) = 1 or month(OrderDate) = 7 THEN DATE_ADD(OrderDate, INTERVAL 5 MONTH)
            WHEN month(OrderDate) = 2 or month(OrderDate) = 8 THEN DATE_ADD(OrderDate, INTERVAL 4 MONTH)
            WHEN month(OrderDate) = 3 or month(OrderDate) = 9 THEN DATE_ADD(OrderDate, INTERVAL 3 MONTH)
            WHEN month(OrderDate) = 4 or month(OrderDate) = 10 THEN DATE_ADD(OrderDate, INTERVAL 2 MONTH)
            WHEN month(OrderDate) = 5 or month(OrderDate) = 11 THEN DATE_ADD(OrderDate, INTERVAL 1 MONTH)
            ELSE OrderDate
        END as calDate
        FROM `order`
    ) as cal
    where cal.OrderID = od.OrderID
    and od.ProductID = p.ProductID
    group by orderDateEnd;


-- 2. Find the customer that buys the most products
    select c.FirstName, c.LastName, sum(od.Quantity)
    from customer c
    join dblab.order o on c.CustomerID = o.CustomerID
    join orderdetail od on o.OrderID = od.OrderID
    group by c.CustomerID
    having sum(od.Quantity) >= all (
        select sum(od1.Quantity) 
        from customer c1
        join dblab.order o1 on c1.CustomerID = o1.CustomerID
        join orderdetail od1 on o1.OrderID = od1.OrderID
        group by c1.CustomerID
        );

-- 3. Find the customer that spend the most money buying products
        select c.CustomerID, c.FirstName, c.LastName, sum( p.UnitPrice * od.Quantity) as totalMoney 
        from dblab.order o 
        join orderdetail od on o.OrderID = od.OrderID
        join product p on p.ProductID = od.ProductID
        join customer c on c.CustomerID = o.CustomerID
        group by o.CustomerID
        having totalMoney >= all ( 
            select sum( p.UnitPrice * od.Quantity) 
            from dblab.order o 
            join orderdetail od on o.OrderID = od.OrderID
            join product p on p.ProductID = od.ProductID
            group by o.CustomerID  );
-- 4. Find the supplier that always supplies products with highest unit price
        select p.SupplierID, s.SupplierName
		from product p
        join supplier s on p.SupplierID = s.SupplierID 
		where not exists ( 
			select * 
			from product p1 
			where p.SupplierID = p1.SupplierID 
			and p1.UnitPrice < any (select p2.UnitPrice from product p2 where p1.SupplierID <> p2.SupplierID and p1.CategoryID = p2.categoryID) 
		);
    
-- 5. For every category, find the product that is purchased by the most customers
    -- Solution 1;

    select p.CategoryID, p.ProductID, p.ProductName, count(o.CustomerID)
    from product p 
    join orderdetail od on p.ProductID = od.ProductID
    join dblab.order o on o.OrderID = od.OrderID 
    group by p.ProductID
    having count(o.CustomerID) = (
        select y.maxBuyers
        from (select x.CategoryID, max(x.numberOfBuyers) as maxBuyers    
                from (
                    select p.CategoryID, p.ProductID, count(o.CustomerID) as numberOfBuyers
                    from product p 
                    join orderdetail od on p.ProductID = od.ProductID
                    join dblab.order o on o.OrderID = od.OrderID 
                    group by p.ProductID
                ) x
                group by x.CategoryID ) as y
        where p.CategoryID = y.CategoryID 
    )
    order by p.CategoryID ASC;


    --Solution 2:
   
        select p.CategoryID, p.ProductID, p.ProductName, count(o.CustomerID) as numberOfBuyers
        from product p 
        join orderdetail od on p.ProductID = od.ProductID
        join dblab.order o on o.OrderID = od.OrderID 
        group by p.CategoryID, p.ProductID 
        having count(o.CustomerID) >= all (
            select count(o1.CustomerID) as numberOfBuyers
            from product p1 
            join orderdetail od1 on p1.ProductID = od1.ProductID
            join dblab.order o1 on o1.OrderID = od1.OrderID 
            group by p1.CategoryID, p1.ProductID
            having p.CategoryID = p1.CategoryID
        )   
        order by p.CategoryID ASC;



-- 6. For every month, find the product that is purchased by most customers in that month 
    -- Solution 1
    select y.MonthinYear, p.ProductID, p.ProductName, y.numOfCustomers 
    from(
        select date_format(o.OrderDate,"%Y-%m") as MonthinYear, od.ProductID, count(o.CustomerID) as numOfCustomers
        from (dblab.order o)
        join (orderdetail od) on o.OrderID = od.OrderID
        group by date_format(o.OrderDate,"%Y-%m"), od.ProductID
    ) y
    join product p on y.ProductID = p.ProductID
    where y.numOfCustomers >= all (
        select x.numOfCustomers
        from (
            select date_format(o1.OrderDate,"%Y-%m") as MonthinYear, od1.ProductID, count(o1.CustomerID) as numOfCustomers
            from (dblab.order o1)
            join (orderdetail od1) on o1.OrderID = od1.OrderID
            group by date_format(o1.OrderDate,"%Y-%m"), od1.ProductID
        ) x
        where x.MonthinYear = y.MonthinYear
    );

    -- Solution 2
    select distinct a.MonthinYear, p.ProductName, a.numOfCustomers
    from (
    select x.MonthinYear, max(x.numOfCustomers) as maxNumofCustomers
    from (
        select date_format(o.OrderDate,"%Y-%m") as MonthinYear, count(o.CustomerID) as numOfCustomers
        from dblab.order o 
        join orderdetail od on o.OrderID = od.OrderID 
        group by date_format(o.OrderDate,"%Y-%m"), od.ProductID 
    ) x -- x: Number of customers of a product in a month
    group by x.MonthinYear ) y, -- y: highest number of customers of a product in a month
    (
        select date_format(o.OrderDate,"%Y-%m") as MonthinYear, od.ProductID ,count(o.CustomerID) as numOfCustomers
        from dblab.order o 
        join orderdetail od on o.OrderID = od.OrderID 
        group by date_format(o.OrderDate,"%Y-%m"), od.ProductID
    ) a
    join product p on a.ProductID = p.ProductID
    where a.MonthinYear = y.MonthinYear 
    and a.numOfCustomers = y.maxNumofCustomers;  



-- 7.Find the city where most customers are living
    select c.City ,count(c.CustomerID)
    from customer c 
    group by c.City
    having count(c.CustomerID) >= all (
        select count(CustomerID)
        from customer
        group by City
    );   

-- 8. For every month, find the products that have greatest amount sold in that month
    
    select y.MonthinYear, p.ProductID, p.ProductName, y.totalAmount 
    from (
        select date_format(o.OrderDate,"%Y-%m") as MonthinYear, od.ProductID, sum(od.Quantity) as totalAmount
        from (dblab.order o)
        join (orderdetail od) on o.OrderID = od.OrderID
        group by date_format(o.OrderDate,"%Y-%m"), od.ProductID
    ) y
    join product p on y.ProductID = p.ProductID
    where not exists (
        select x.totalAmount
        from (
            select date_format(o1.OrderDate,"%Y-%m") as MonthinYear, od1.ProductID, sum(od1.Quantity) as totalAmount
            from (dblab.order o1)
            join (orderdetail od1) on o1.OrderID = od1.OrderID
            group by date_format(o1.OrderDate,"%Y-%m"), od1.ProductID
        ) x
        where x.MonthinYear = y.MonthinYear
        and x.totalAmount > y.totalAmount
    );


-- 9. Find the product(s) that are sold at most for one customer

    select od.ProductID, c.CustomerID, sum(od.Quantity) as Quantity
    from orderdetail as od, `order` as o, customer as c
    where od.OrderID = o.OrderID
        and o.CustomerID = c.CustomerID
    group by od.ProductID, c.CustomerID
    having Quantity >= all(
        select sum(od.Quantity) as Quantity
        from orderdetail as od, `order` as o, customer as c
        where od.OrderID = o.OrderID
            and o.CustomerID = c.CustomerID
        group by od.ProductID, c.CustomerID
    );

-- 10. Find the city that consume at most number of product

    select result.City, max(result.sum_of_product)
    from (select c.City, sum(od.Quantity) as sum_of_product
    from orderdetail as od, `order` as o, customer as c
    where od.OrderID = o.OrderID
        and o.CustomerID = c.CustomerID
    group by c.City
    order by sum_of_product desc) as result;

-- 11. Find the city that spend at most money on buying

    select result.City, max(result.sum_of_money)
    from (select c.City, sum(od.Quantity * p.UnitPrice) as sum_of_money
    from orderdetail as od, `order` as o, customer as c, product as p
    where od.OrderID = o.OrderID
        and o.CustomerID = c.CustomerID
        and p.ProductID = od.ProductID
    group by c.City
    order by sum_of_money desc) as result;


-- 12. Display full name of customer and 3 last tel number of them

    select concat(FirstName, ' ', LastName, ' : ', substr(Phone, length(Phone) - 3, 3)) as infor
    from customer;


-- 13. Find the category that the customer love most

    select r.CategoryName, max(r.sumOfQuantity)
    from (
        select c.CategoryName, sum(od.Quantity) as sumOfQuantity
        from category as c, product as p, orderdetail as od
        where c.CategoryID = p.CategoryID
            and p.ProductID = od.ProductID
        group by c.CategoryID
        order by sumOfQuantity desc    
    ) as r;


-- 14. In an order, find a product whose cost equals to sum of cost of other products in the same order. 
        
    select od.OrderID, od.ProductID, result.cost
    from orderdetail as od, product as p ,(
        select o.OrderID, sum(od.Quantity * p.UnitPrice) as cost
        from product as p, `order` as o, orderdetail as od
        where o.OrderID = od.OrderID
            and od.ProductID = p.ProductID
        group by o.OrderID    
    ) as result
    where od.OrderID  = result.OrderID
    and p.ProductID = od.ProductID
    and p.UnitPrice * od.Quantity = result.cost/2;
    

-- 15.Find the supplier who earn the most money in most months
    select r.SupplierID, s.SupplierName, count(r.month) as num_of_month 
    from  
    (
        select re.SupplierID, re.month, max(re.totalSale) as maxSale
        from (
            select p.SupplierID, date_format(o.OrderDate,"%Y-%m") as month, sum( p.UnitPrice * od.Quantity ) as totalSale  
            from product p 
            join orderdetail od on od.ProductID = p.ProductID
            join dblab.order o on o.OrderID = od.OrderID
            group by month
        ) as re 
        group by re.month, re.SupplierID
    ) as r
    join supplier s on r.SupplierID = s.SupplierID 
    group by r.SupplierID
    having count(r.month) >= all (
        select count(r.month) as num_of_month 
        from  
        (
            select re.SupplierID, re.month, max(re.totalSale) as maxSale
            from (
                select p.SupplierID, date_format(o.OrderDate,"%Y-%m") as month, sum( p.UnitPrice * od.Quantity ) as totalSale  
                from product p 
                join orderdetail od on od.ProductID = p.ProductID
                join dblab.order o on o.OrderID = od.OrderID
                group by month
            ) as re 
            group by re.month, re.SupplierID
        ) as r 
        group by r.SupplierID
    );

-- 16. Find month in which customers tend to spend most money.
    select date_format(o.OrderDate, "%m") as month, sum(od.Quantity * p.UnitPrice) / (select count(distinct year(OrderDate)) from dblab.order) as average_sales_per_month
    from dblab.order o 
    join orderdetail od on o.OrderID = od.OrderID
    join product p on p.ProductID = od.ProductID
    group by date_format(o.OrderDate,"%m")
    having average_sales_per_month >= all (
        select sum(od1.Quantity * p1.UnitPrice) / (select count(distinct year(OrderDate)) from dblab.order) as average_quanity_per_month
        from dblab.order o1 
        join orderdetail od1 on o1.OrderID = od1.OrderID
        join product p1 on p1.ProductID = od1.ProductID
        group by date_format(o1.OrderDate,"%m")
    );

-- 17. Which category has the biggest number of suppliers?
    select c.CategoryName, count(p.SupplierID) as num_of_suppliers
    from category as c, product as p
    where c.CategoryID = p.CategoryID
    group by c.CategoryID
    having num_of_suppliers >= all(
        select count(p.SupplierID) as num
        from category as c, product as p
        where c.CategoryID = p.CategoryID
        group by c.CategoryID
    );


-- 18. In each category, which city has the biggest number of suppliers?
    select p.CategoryID, s.City, count(p.SupplierID)
    from product p 
    join supplier s on p.SupplierID = s.SupplierID
    group by p.CategoryID, s.City
    having count(p.SupplierID) >= all (
        select count(p1.SupplierID)
        from product p1 
        join supplier s1 on p1.SupplierID = s1.SupplierID
        group by p1.CategoryID, s1.City
        having p.CategoryID = p1.CategoryID
    );

-- 19. Which supplier supplies the biggest number of products ?
    select s.SupplierID, s.SupplierName, count(p.ProductID)
    from product p 
    join supplier s on p.SupplierID = s.SupplierID  
    group by SupplierID    
    having count(p.ProductID) >= all (
        select count(ProductID)
        from product 
        group by SupplierID
    ); 

-- 20. Find the product that has greatest number of items sold in 2016
    select od.ProductID, p.ProductName, sum(od.Quantity)
    from orderdetail od 
    join dblab.order o on od.OrderID = o.OrderID
    join product p on od.ProductID = p.ProductID
    where year(o.OrderDate) = 2016
    group by od.ProductID
    having sum(od.Quantity) >= all (
        select sum(od.Quantity)
        from orderdetail od 
        join dblab.order o on od.OrderID = o.OrderID
        where year(o.OrderDate) = 2016
        group by od.ProductID
    );

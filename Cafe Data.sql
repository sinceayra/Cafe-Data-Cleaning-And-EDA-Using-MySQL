#copying og data into sample data to prevent losing original data
select * from dirty_cafe_sales;
create table cafe_sales_staging like dirty_cafe_sales;
insert into cafe_sales_staging select * from dirty_cafe_sales;
select * from cafe_sales_staging;

#finding duplicates: row_num>1 then duplicate found
select *, row_number() over(partition by `Item`, `Quantity`, `Price Per Unit`, `Total Spent`, `Payment Method`, `Location`, `Transaction Date`) 
as row_num from cafe_sales_staging ORDER BY `Transaction ID`;

#creating a duplicate table with row_num as a column 
CREATE TABLE `cafe_sales_staging2` (
  `Transaction ID` text,
  `Item` text,
  `Quantity` int DEFAULT NULL,
  `Price Per Unit` double DEFAULT NULL,
  `Total Spent` text,
  `Payment Method` text,
  `Location` text,
  `Transaction Date` text,
  `row_num` int #column added
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
insert into cafe_sales_staging2
select *, row_number() over(partition by `Item`, `Quantity`, `Price Per Unit`, `Total Spent`, `Payment Method`, `Location`, `Transaction Date`) 
as row_num from cafe_sales_staging ORDER BY `Transaction ID`;
select * from cafe_sales_staging2;
#deleting dupicates
delete from cafe_sales_staging2 where row_num>1;

#standardizing data
select distinct `Item` from cafe_sales_staging2;
select distinct `Payment Method` from cafe_sales_staging2;
select distinct `Location` from cafe_sales_staging2;

#converting unwanted values into null
update cafe_sales_staging2 
set `Item`= NULL
where trim(`Item`)= '' or `Item`in ("ERROR", "UNKNOWN");

update cafe_sales_staging2 
set `Payment Method`= NULL
where trim(`Payment Method`)='' or `Payment Method` in ("ERROR", "UNKNOWN");

update cafe_sales_staging2 
set `Location`= NULL
where trim(`Location`)='' or `Location` in ("ERROR", "UNKNOWN");

update cafe_sales_staging2 
set `Transaction Date`= NULL
where trim(`Transaction Date`)='' or `Transaction Date` in ("ERROR", "UNKNOWN");

update cafe_sales_staging2 
set `Total Spent`= NULL
where trim(`Total Spent`)='' or `Total Spent` in ("ERROR", "UNKNOWN");

#handling null values
update cafe_sales_staging2 
set `Total Spent` =`Quantity` * `Price Per Unit`
where `Total Spent` IS NULL OR
`Total Spent` != `Quantity` * `Price Per Unit`;

select count(*) from cafe_sales_staging2 where `Payment Method` is null;

update cafe_sales_staging2 
set `Location` = "Unknown"
where `Location` IS NULL;

update cafe_sales_staging2
set `Payment Method` = "Unknown"
where `Payment Method` IS NULL;

update cafe_sales_staging2
set `Item` = "Other"
where `Item` IS NULL;

#checking whether it is safe to delete null values by checking the ratio 
select count(*) FROM cafe_sales_staging2 WHERE `Transaction Date` IS NULL;
select count(*) FROM cafe_sales_staging2;
#safely deleting null values
delete from cafe_sales_staging2 where `Transaction Date` IS NULL;



#exploratory data analysis

#1. How many rows are in the dataset?
select count(*) FROM cafe_sales_staging2;

#2. What is the total revenue?
select sum(`Total Spent`) as Total_Revenue FROM cafe_sales_staging2;

#3. What are the different items sold?
select distinct `Item` from cafe_sales_staging2;

#4. Which item sells the most?
select `Item`, sum(`Total Spent`) from cafe_sales_staging2 group by(`Item`) order by(sum(`Total Spent`));

#5. Which payment method is used the most?
select `Payment Method`, count(*) from cafe_sales_staging2 group by(`Payment Method`) order by(count(*));
select * from cafe_sales_staging2;

#6. What is the average amount spent per transaction?
select AVG(`Total Spent`) from cafe_sales_staging2;

#7. Which item is sold the most based on total quantity?
select `Item`, sum(`Quantity`) from cafe_sales_staging2 group by(`Item`) order by(sum(`Quantity`));

#8. Which location generates the most revenue?
select `Location`, sum(`Total Spent`) from cafe_sales_staging2 group by(`Location`) order by(sum(`Total Spent`));

#9. Which item has both: total quantity, sold total revenue
select `Item`, sum(`Quantity`), sum(`Total Spent`) from cafe_sales_staging2 group by(`Item`);

#10. What is the average spending per payment method?
select `Payment Method`, avg(`Total Spent`) from cafe_sales_staging2 group by(`Payment Method`) order by(`Payment Method`);

#11. How many transactions have Total Spent greater than the overall average?
select count(*) from cafe_sales_staging2
where `Total Spent`>
	(
    select avg(`Total Spent`)
    from cafe_sales_staging2
    );
    
#12. For each item, how many transactions have Total Spent above the overall average?
select `Item`, count(*) as abv_avg_count from cafe_sales_staging2 
where `Total Spent`>
	( 
    select avg(`Total Spent`) 
    from cafe_sales_staging2
    )
group by(`Item`);

#13. Show all items with their total revenue, and rank them from highest to lowest revenue
select 'above average' as category, count(*) as above_avg from cafe_sales_staging2 
where `Total Spent` >
	(
    select avg(`Total Spent`)
    from cafe_sales_staging2
    )
union 
select 'below average' as category, count(*) as below_avg from cafe_sales_staging2 
where `Total Spent` <
	(
    select avg(`Total Spent`)
    from cafe_sales_staging2
    );
   
#14. For each location, what is the total revenue and number of transactions?
select `Location`, sum(`Total Spent`) as revenue, count(*) as transactions from cafe_sales_staging2 group by(`Location`);

#15. Total Spent is in the top 10 highest values
select distinct `Total Spent` from cafe_sales_staging2 order by(`Total Spent`)desc ;
alter table cafe_sales_staging2 modify `Total Spent` double;



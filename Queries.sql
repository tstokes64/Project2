/* Create Initial Database */
CREATE DATABASE "NYSE";


/* Merge Securities and Fund Stock to see the name of each ticker symbol and their fund stock */
SELECT * FROM "Securities"
	inner join "Fund Stock"
	on "Securities"."Ticker Symbol" = "Fund Stock"."Ticker Symbol";

/*Merge Stock Prices and Securities to get the name and sector of each stock along with their stock prices */
SELECT "Stock Prices"."Ticker Symbol", "Securities"."Security", "Securities"."GICS Sector", "Stock Prices"."Date",
		"Stock Prices"."Open", "Stock Prices"."Close", "Stock Prices"."Low", "Stock Prices"."High", "Stock Prices"."Volume" from "Stock Prices"
inner join "Securities" on 
"Stock Prices"."Ticker Symbol" = "Securities"."Ticker Symbol"
Order by "Ticker Symbol" asc;


/* Get the average stock prices by GICS Sector */
Select "Securities"."GICS Sector", count(distinct "Stock Prices"."Ticker Symbol") as "Number of Companies", avg("Stock Prices"."Open") as "Average Open", 
		avg("Stock Prices"."Close") as "Average Close", avg("Stock Prices"."Low") as "Average Low", 
		avg("Stock Prices"."High") as "Average High", avg("Stock Prices"."Volume") as "Average Volume" from "Stock Prices"
inner join "Securities" 
	on "Stock Prices"."Ticker Symbol" = "Securities"."Ticker Symbol"
Group by "Securities"."GICS Sector";
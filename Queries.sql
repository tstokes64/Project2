CREATE DATABASE "NYSE";

SELECT * FROM "Securities"
	inner join "Fund Stock"
	on "Securities"."Ticker Symbol" = "Fund Stock"."Ticker Symbol";

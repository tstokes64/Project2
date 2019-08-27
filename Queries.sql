/* Create Initial Database */
CREATE DATABASE "NYSE";


/* Merge Securities and Fund Stock to see the name of each ticker symbol and their fund stock */
SELECT * FROM securities
	INNER JOIN fund_stock
	ON securities.ticker_symbol = fund_stock.ticker_symbol;;

/*Merge Stock Prices and Securities to get the name and sector of each stock along with their stock prices */
SELECT stock_prices.ticker_symbol, securities.security, securities.gics_sector,
	stock_prices.date, stock_prices.open, stock_prices.close, stock_prices.low, 
	stock_prices.high, stock_prices.volume FROM stock_prices
INNER JOIN securities
	ON stock_prices.ticker_symbol = securities.ticker_symbol
ORDER BY ticker_symbol asc;


/* Get the average stock prices by GICS Sector */
SELECT securities.gics_sector, count(distinct stock_prices.ticker_symbol) as "Number of Companies",
	avg(stock_prices.open) as "Average Open", avg(stock_prices.close) as "Average Close",
	avg(stock_prices.low) as "Average Low", avg(stock_prices.high) as "Average High",
	avg(stock_prices.volume) as "Average Volume" FROM stock_prices
INNER JOIN securities
	ON stock_prices.ticker_symbol = securities.ticker_symbol
GROUP BY securities.gics_sector;
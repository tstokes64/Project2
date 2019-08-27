{\rtf1\ansi\ansicpg1252\cocoartf1671\cocoasubrtf600
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww18080\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 ETL Project\
August 2019\
Heather, Mike, and Tommy\
\
For our ETL Project, we used data found at https://www.kaggle.com/dgawlik/nyse#securities.csv, a page that listed NYSE stock exchange historical data.\
\
We were able to merge our data using two of the CSV files available at that website, specifically \'91securities.csv\'92 and \'91fundamentals.csv\'92. We merged these CSV files using their common primary key \'93Ticker Symbol\'94. \
\
Upon merging the files, we cleaned the dataframe created. The columns were also renamed to show a cleaner format, IE from \'91ticker symbol\'92 to \'91ticker_symbol\'92. \
\
We then connected the data to a local database using Postgres. We created the dataframes on our computers within our local SQL environment first, then pushed the cleaned dataframe into SQL using pandas, using the \'91to_sql\'92 command. \
\
Now we were able to confirm the data was added by querying the securities and fund stock databases. \
\
There is also an app we created via Flask that would use our session engine to query the data from the dataframes, which we hope would return all data for a ticker symbol. This also had the exception to print \'91no such ticker symbol\'92 if no information was available or an incorrect ticker symbol was given. \
\
We were all able to contribute to this project, we feel we worked well together and are happy with the results. }
import sqlalchemy
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from sqlalchemy import create_engine, func, inspect
from config import username, password
from flask import Flask, jsonify


# Database Setup
rds_connection_string = f"{username}:{password}@localhost:5432/NYSE"
engine = create_engine(f'postgresql://{rds_connection_string}')

# Reflect existing database
Base = automap_base()
Base.prepare(engine, reflect=True)

# Save reference to the table
securities = Base.classes.securities

# Flask Setup
app = Flask(__name__)

# App Routes


@app.route("/")
def home():
    return(
        f"Available Routes:<br/>"
        f"/api/ticker/your-chosen-stock-abbreviation<br/>"
        f"/api/stocks"
    )


@app.route("/api/stocks")
def stocks():
    session = Session(engine)
    ticker_symbols = session.query(securities).all()
    stock_names = []
    for symbol in ticker_symbols:
        security = {'Name': symbol.security,
                    'Symbol': symbol.ticker_symbol}
        stock_names.append(security)
    return jsonify(stock_names)
    session.close()


@app.route("/api/ticker/<chosen_symbol>")
def ticker(chosen_symbol):
    session = Session(engine)

    # Return all data for a ticker symbol
    results = session.query(securities.ticker_symbol, securities.security, securities.gics_sector,
                            securities.gics_sub_industry).filter(securities.ticker_symbol == chosen_symbol).all()
    if results:
        for result in results:
            if result:
                return jsonify(result)
            else:
                return jsonify("No such ticker symbol")
        session.close()
    else:
        return jsonify("No such ticker symbol")

if __name__ == "__main__":
    app.run(debug=True)

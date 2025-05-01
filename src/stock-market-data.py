import yfinance as yf
import datetime
import os

currentData = datetime.datetime.now().strftime("%Y-%m-%d")
currentHour = datetime.datetime.now().strftime("%H-%M-%S")

output_directory = '/home/yfinance-data'
os.makedirs(output_directory, exist_ok=True)

ticker_obj = yf.Ticker('^bvsp')
data_ticker = ticker_obj.history(period='max')
data_ticker.to_csv(f'{output_directory}/{currentData}-{currentHour}-bvsp.csv', index=True, sep=',', decimal='.')


from tradingview_ta import TA_Handler, Interval
import time
from datetime import datetime


now = datetime.now()
fecha = now.strftime("%d-%m-%y %H:%M:%S")
lista = ["BTCUSDT", "ETHUSDT"]
strongBuy_list = []
strongSell_list = []
for i in lista:
    tesla = TA_Handler()
    tesla.set_symbol_as(i['symbol'])
    tesla.set_exchange_as_crypto_or_stock("BINANCE")
    tesla.set_screener_as_crypto()
    tesla.set_interval_as(Interval.INTERVAL_1_HOUR)
    print(i['symbol'])
    try:
      print(tesla.get_analysis().summary)
    except Exception as e:
      print("No Data")
      continue
    if((tesla.get_analysis().summary)["RECOMMENDATION"])=="STRONG_BUY":
        print(f" Compar más fuerte {i}", fecha)
        strongBuy_list.append(i['symbol'])
    elif((tesla.get_analysis().summary)["RECOMMENDATION"])=="STRONG_SELL":
        print(f" Compar más fuerte {i}", fecha)
        strongSell_list.append(i['symbol'])

print("*** STRONG BUY LIST ***")

print(strongBuy_list)

print("*** STRONG SELL LIST ***")

print(strongSell_list)

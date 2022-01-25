## https://TradingView.com client.

type
  Recommendation* = enum  ## Buy or Sell ?.
    buy        = "BUY"
    strongBuy  = "STRONG_BUY"
    sell       = "SELL"
    strongSell = "STRONG_SELL"
    neutral    = "NEUTRAL"

  Interval* = enum        ## Time intervals.
    INTERVAL1MINUTE   = "1m"
    INTERVAL5MINUTES  = "5m"
    INTERVAL15MINUTES = "15m"
    INTERVAL30MINUTES = "30m"
    INTERVAL1HOUR     = "1h"
    INTERVAL2HOURS    = "2h"
    INTERVAL4HOURS    = "4h"
    INTERVAL1DAY      = "1d"
    INTERVAL1WEEK     = "1W"
    INTERVAL1MONTH    = "1M"

  Screener* = enum        ## Screeners, currently only Crypto.
    Crypto  = "CRYPTO"    ## Crypto currencies.
    # Forex   = "FOREX"     ## Forex (untested).
    # America = "AMERICA"   ## USA Market (untested).
    # Cfd     = "CFD"       ## Contract For Differences (untested).

  Exchange* = enum        ## Exchanges, currently only Binance.
    Binance  = "BINANCE"  ## Crypto currencies.
    # Coinbase = "COINBASE" ## Crypto currencies (untested, use Binance).
    # Fx_Idc   = "FX_IDC"   ## FX_IDC for Forex (untested).
    # Tvc      = "TVC"      ## TVC for Contract For Differences (untested).

  TradingView* = object   ## TradingView client.
    screener: Screener    ## Screener, currently only Crypto.
    exchange: Exchange    ## Exchange to use, currently only Binance.
    symbol: string        ## Symbol (e.g. "BTCUSDT", "ETHBUSD", "DOGEDAI", etc).
    interval: Interval    ## Time interval to use (e.g. "1m", "5m", "15m", "30m", "1h", "2h", "4h", "1d", "1W", "1M").
    timeout: Positive     ## Timeout.
    indicators: seq[Indicators]  ## Indicators to be used in the chart (e.g. "SMA", "EMA", "MACD", etc).

  # TODO: make an enum for the following.
  Indicators* = enum      ## Technical analysis indicators.
    "Recommend.Other",
    "Recommend.All",
    "Recommend.MA",
    "RSI",
    "RSI[1]",
    "Stoch.K",
    "Stoch.D",
    "Stoch.K[1]",
    "Stoch.D[1]",
    "CCI20",
    "CCI20[1]",
    "ADX",
    "ADX+DI",
    "ADX-DI",
    "ADX+DI[1]",
    "ADX-DI[1]",
    "AO",
    "AO[1]",
    "Mom",
    "Mom[1]",
    "MACD.macd",
    "MACD.signal",
    "Rec.Stoch.RSI",
    "Stoch.RSI.K",
    "Rec.WR",
    "W.R",
    "Rec.BBPower",
    "BBPower",
    "Rec.UO",
    "UO",
    "close",
    "EMA5",
    "SMA5",
    "EMA10",
    "SMA10",
    "EMA20",
    "SMA20",
    "EMA30",
    "SMA30",
    "EMA50",
    "SMA50",
    "EMA100",
    "SMA100",
    "EMA200",
    "SMA200",
    "Rec.Ichimoku",
    "Ichimoku.BLine",
    "Rec.VWMA",
    "VWMA",
    "Rec.HullMA9",
    "HullMA9",
    "Pivot.M.Classic.S3",
    "Pivot.M.Classic.S2",
    "Pivot.M.Classic.S1",
    "Pivot.M.Classic.Middle",
    "Pivot.M.Classic.R1",
    "Pivot.M.Classic.R2",
    "Pivot.M.Classic.R3",
    "Pivot.M.Fibonacci.S3",
    "Pivot.M.Fibonacci.S2",
    "Pivot.M.Fibonacci.S1",
    "Pivot.M.Fibonacci.Middle",
    "Pivot.M.Fibonacci.R1",
    "Pivot.M.Fibonacci.R2",
    "Pivot.M.Fibonacci.R3",
    "Pivot.M.Camarilla.S3",
    "Pivot.M.Camarilla.S2",
    "Pivot.M.Camarilla.S1",
    "Pivot.M.Camarilla.Middle",
    "Pivot.M.Camarilla.R1",
    "Pivot.M.Camarilla.R2",
    "Pivot.M.Camarilla.R3",
    "Pivot.M.Woodie.S3",
    "Pivot.M.Woodie.S2",
    "Pivot.M.Woodie.S1",
    "Pivot.M.Woodie.Middle",
    "Pivot.M.Woodie.R1",
    "Pivot.M.Woodie.R2",
    "Pivot.M.Woodie.R3",
    "Pivot.M.Demark.S1",
    "Pivot.M.Demark.Middle",
    "Pivot.M.Demark.R1",
    "open",
    "P.SAR",
    "BB.lower",
    "BB.upper",
    "AO[2]",
    "volume",
    "change",
    "low",
    "high",

  "name",
  "change",
  "close",
  "change_abs",
  "high",
  "low",
  "volume",
  "Recommend.All",
  "exchange",
  "High.1M",
  "Low.1M",
  "Pivot.M.Camarilla.Middle",
  "Pivot.M.Camarilla.R1",
  "Pivot.M.Camarilla.R2",
  "Pivot.M.Camarilla.R3",
  "Pivot.M.Camarilla.S1",
  "Pivot.M.Camarilla.S2",
  "Pivot.M.Camarilla.S3",
  "Pivot.M.Classic.Middle",
  "Pivot.M.Classic.R1",
  "Pivot.M.Classic.R2",
  "Pivot.M.Classic.R3",
  "Pivot.M.Classic.S1",
  "Pivot.M.Classic.S2",
  "Pivot.M.Classic.S3",
  "Pivot.M.Demark.Middle",
  "Pivot.M.Demark.R1",
  "Pivot.M.Demark.S1",
  "Pivot.M.Fibonacci.Middle",
  "Pivot.M.Fibonacci.R1",
  "Pivot.M.Fibonacci.R2",
  "Pivot.M.Fibonacci.R3",
  "Pivot.M.Fibonacci.S1",
  "Pivot.M.Fibonacci.S2",
  "Pivot.M.Fibonacci.S3",
  "Pivot.M.Woodie.Middle",
  "Pivot.M.Woodie.R1",
  "Pivot.M.Woodie.R2",
  "Pivot.M.Woodie.R3",
  "Pivot.M.Woodie.S1",
  "Pivot.M.Woodie.S2",
  "Pivot.M.Woodie.S3",
  "High.3M",
  "Low.3M",
  "Perf.3M",
  "price_52_week_high",
  "price_52_week_low",
  "High.6M",
  "Low.6M",
  "Perf.6M",
  "High.All",
  "Low.All",
  "Aroon.Down",
  "Aroon.Up",
  "ADR",
  "ADX",
  "ATR",
  "average_volume_10d_calc",
  "Perf.Y",
  "Perf.YTD",
  "W.R",
  "average_volume_30d_calc",
  "average_volume_60d_calc",
  "average_volume_90d_calc",
  "AO",
  "BB.lower",
  "BB.upper",
  "BBPower",
  "change_abs|15",
  "change|15",
  "change_abs|60",
  "change|60",
  "change_abs|1",
  "change|1",
  "change_abs|240",
  "change|240",
  "change_abs|5",
  "change|5",
  "change_from_open_abs",
  "change_from_open",
  "CCI20",
  "DonchCh20.Lower",
  "DonchCh20.Upper",
  "EMA10",
  "EMA100",
  "EMA20",
  "EMA200",
  "EMA30",
  "EMA5",
  "EMA50",
  "gap",
  "HullMA9",
  "Ichimoku.BLine",
  "Ichimoku.CLine",
  "Ichimoku.Lead1",
  "Ichimoku.Lead2",
  "KltChnl.lower",
  "KltChnl.upper",
  "MACD.macd",
  "MACD.signal",
  "market_cap_calc",
  "Mom",
  "Perf.1M",
  "Recommend.MA",
  "open",
  "Recommend.Other",
  "P.SAR",
  "name",
  "ROC",
  "RSI",
  "RSI7",
  "relative_volume_10d_calc",
  "SMA10",
  "SMA100",
  "SMA20",
  "SMA200",
  "SMA30",
  "SMA5",
  "SMA50",
  "Stoch.D",
  "Stoch.K",
  "Stoch.RSI.K",
  "Stoch.RSI.D",
  "UO",
  "Volatility.D",
  "Volatility.M",
  "Volatility.W",
  "VWAP",
  "VWMA",
  "Perf.W",
  "description",
  "name",
  "type",
  "subtype",
  "update_mode",
  "pricescale",
  "minmov",
  "fractional",
  "minmove2",
  "ADX-DI[1]",
  "Rec.WR",
  "AO",
  "AO[1]",
  "close",
  "BB.lower",
  "BB.upper",
  "Rec.BBPower",
  "CCI20",
  "CCI20[1]",
  "EMA10",
  "EMA100",
  "EMA20",
  "EMA200",
  "EMA30",
  "EMA5",
  "EMA50",
  "Rec.HullMA9",
  "Rec.Ichimoku",
  "MACD.macd",
  "MACD.signal",
  "Mom",
  "Mom[1]",
  "P.SAR",
  "open",
  "Candle.AbandonedBaby.Bearish",
  "Candle.AbandonedBaby.Bullish",
  "Candle.Engulfing.Bearish",
  "Candle.Harami.Bearish",
  "Candle.Engulfing.Bullish",
  "Candle.Harami.Bullish",
  "Candle.Doji",
  "Candle.Doji.Dragonfly",
  "Candle.EveningStar",
  "Candle.Doji.Gravestone",
  "Candle.Hammer",
  "Candle.HangingMan",
  "Candle.InvertedHammer",
  "Candle.Kicking.Bearish",
  "Candle.Kicking.Bullish",
  "Candle.LongShadow.Lower",
  "Candle.LongShadow.Upper",
  "Candle.Marubozu.Black",
  "Candle.Marubozu.White",
  "Candle.MorningStar",
  "Candle.ShootingStar",
  "Candle.SpinningTop.Black",
  "Candle.SpinningTop.White",
  "Candle.3BlackCrows",
  "Candle.3WhiteSoldiers",
  "Candle.TriStar.Bearish",
  "Candle.TriStar.Bullish",
  "RSI",
  "RSI[1]",
  "RSI7",
  "RSI7[1]",
  "SMA10",
  "SMA100",
  "SMA20",
  "SMA200",
  "SMA30",
  "SMA5",
  "SMA50",
  "Stoch.K",
  "Stoch.D",
  "Stoch.K[1]",
  "Stoch.D[1]",
  "Rec.Stoch.RSI",
  "Rec.UO",
  "Rec.VWMA",

const tradingviewAPIUrl: string = "https://scanner.tradingview.com/"

template movingAverage*(ma, close: float): Recommendation =
  ## https://en.wikipedia.org/wiki/Moving_average
  if ma < close: Recommendation.buy elif ma > close: Recommendation.sell else: Recommendation.neutral

template relativeStrengthIndex*(rsi, rsi1: float): Recommendation =
  ## https://en.wikipedia.org/wiki/Relative_strength_index
  if rsi < 30 and rsi1 < rsi: Recommendation.buy elif rsi > 70 and rsi1 > rsi: Recommendation.sell else: Recommendation.neutral

template stochastic*(k, d, k1, d1: float): Recommendation =
  ## https://en.wikipedia.org/wiki/Stochastic_oscillator
  if k < 20 and d < 20 and k > d and k1 < d1: Recommendation.buy elif k > 80 and d > 80 and k < d and k1 > d1: Recommendation.sell else: Recommendation.neutral

template commodityChannelIndex20*(cci20, cci201: float): Recommendation =
  ## https://en.wikipedia.org/wiki/Commodity_channel_index
  if cci20 < -100 and cci20 > cci201: Recommendation.buy elif cci20 > 100 and cci20 < cci201: Recommendation.sell else: Recommendation.neutral

template averageDirectionalIndex*(adx, adxpdi, adxndi, adxpdi1, adxndi1: float): Recommendation =
  ## https://en.wikipedia.org/wiki/Average_directional_movement_index
  if adx > 20 and adxpdi1 < adxndi1 and adxpdi > adxndi: Recommendation.buy elif adx > 20 and adxpdi1 > adxndi1 and adxpdi < adxndi: Recommendation.sell else: Recommendation.neutral

template movingAverageConvergenceDivergence*(macd, signal: float): Recommendation =
  ##  https://en.wikipedia.org/wiki/MACD
  if macd > signal: Recommendation.buy elif macd < signal: Recommendation.sell else: Recommendation.neutral

template bullBearBuy*(close, bblower: float): Recommendation =
  ## https://en.wikipedia.org/wiki/Bull_and_bear_markets
  if close < bblower: Recommendation.buy else: Recommendation.neutral

template bullBearSell*(close, bbupper: float): Recommendation =
  ## https://en.wikipedia.org/wiki/Bull_and_bear_markets
  if close > bbupper: Recommendation.sell else: Recommendation.neutral

template parabolicStopAndReverse*(psar, open: float): Recommendation =
  ## https://en.wikipedia.org/wiki/Parabolic_SAR
  if psar < open: Recommendation.buy elif psar > open: Recommendation.sell else: Recommendation.neutral

template momentum*(mom, mom1: float): Recommendation =
  if mom < mom1: Recommendation.sell elif mom > mom1: Recommendation.buy else: Recommendation.neutral

func awesomeOscillator*(ao, ao1, ao2: float): Recommendation =
  if (ao > 0 and ao1 < 0) or (ao > 0 and ao1 > 0 and ao > ao1 and ao2 > ao1):   Recommendation.buy
  elif (ao < 0 and ao1 > 0) or (ao < 0 and ao1 < 0 and ao < ao1 and ao2 < ao1): Recommendation.sell
  else: Recommendation.neutral

func recommend*(value: float): Recommendation =
  ## Generic basic recommendation.
  if value >= -1.0 and value < -0.5:   Recommendation.strongSell
  elif value >= -0.5 and value < -0.1: Recommendation.sell
  elif value > 0.1 and value <= 0.5:   Recommendation.buy
  elif value > 0.5 and value <= 1:     Recommendation.strongBuy
  else:                                Recommendation.neutral

template toString*(interval: Interval): string =
  ## `Interval` to `string` but in format `"|1"`, `"|60"`, `"|1W"`, `"|1M"`, etc.
  case interval
  of INTERVAL1MINUTE:   "|1"
  of INTERVAL5MINUTES:  "|5"
  of INTERVAL15MINUTES: "|15"
  of INTERVAL30MINUTES: "|30"
  of INTERVAL1HOUR:     "|60"
  of INTERVAL2HOURS:    "|120"
  of INTERVAL4HOURS:    "|240"
  of INTERVAL1WEEK:     "|1W"
  of INTERVAL1MONTH:    "|1M"
  of INTERVAL1DAY:      ""  # Default is 1 day.

func tradingViewData*(exchangeSymbols: seq[string]; indicators: seq[Indicators]; interval: Interval): JsonNode =
  ## Format TradingView Scanner Post Data.
  ## * `exchangeSymbols` example `@["BINANCE:BTCUSDT", "BINANCE:ETHBUSD"]`, indicators must be all uppercase.
  assert exchangeSymbols.len > 0, "exchangeSymbols must not be a an empty seq."
  assert indicators.len > 0, "indicators must not be a an empty seq."
  var columns: seq[string] = newSeqOfCap(indicators.len)
  for indicator in indicators: columns.add($indicator & interval.toString)
  result = %*{
    "symbols": {
      "tickers": exchangeSymbols,
      "query":{
        "types": []
      }
    },
    "columns": columns
  }


func calculate*(indicators, indicators_key, screener, symbol, exchange, interval):
    oscillators_counter, ma_counter = {"BUY": 0, "SELL": 0, "NEUTRAL": 0}, {"BUY": 0, "SELL": 0, "NEUTRAL": 0}
    computed_oscillators, computed_ma = {}, {}

    indicators = list(indicators.values())

    # RECOMMENDATIONS
    if None not in indicators[0:2]:
        recommend_oscillators = Compute.Recommend(indicators[0])
        recommend_summary = Compute.Recommend(indicators[1])
        recommend_moving_averages = Compute.Recommend(indicators[2])
    else:
        return None

    # OSCILLATORS
    # RSI (14)
    if None not in indicators[3:5]:
        computed_oscillators["RSI"] = Compute.RSI(indicators[3], indicators[4])
        oscillators_counter[computed_oscillators["RSI"]] += 1
    # Stoch %K
    if None not in indicators[5:9]:
        computed_oscillators["STOCH.K"] = Compute.Stoch(indicators[5], indicators[6], indicators[7], indicators[8])
        oscillators_counter[computed_oscillators["STOCH.K"]] += 1
    # CCI (20)
    if None not in indicators[9:11]:
        computed_oscillators["CCI"] = Compute.CCI20(indicators[9], indicators[10])
        oscillators_counter[computed_oscillators["CCI"]] += 1
    # ADX (14)
    if None not in indicators[11:16]:
        computed_oscillators["ADX"] = Compute.ADX(indicators[11], indicators[12], indicators[13], indicators[14], indicators[15])
        oscillators_counter[computed_oscillators["ADX"]] += 1
    # AO
    if None not in indicators[16:18] and indicators[86] != None:
        computed_oscillators["AO"] = Compute.AO(indicators[16], indicators[17], indicators[86])
        oscillators_counter[computed_oscillators["AO"]] += 1
    # Mom (10)
    if None not in indicators[18:20]:
        computed_oscillators["Mom"] = Compute.Mom(indicators[18], indicators[19])
        oscillators_counter[computed_oscillators["Mom"]] += 1
    # MACD
    if None not in indicators[20:22]:
        computed_oscillators["MACD"] = Compute.MACD(indicators[20], indicators[21])
        oscillators_counter[computed_oscillators["MACD"]] += 1
    # Stoch RSI
    if indicators[22] != None:
        computed_oscillators["Stoch.RSI"] = Compute.Simple(indicators[22])
        oscillators_counter[computed_oscillators["Stoch.RSI"]] += 1
    # W%R
    if indicators[24] != None:
        computed_oscillators["W%R"] = Compute.Simple(indicators[24])
        oscillators_counter[computed_oscillators["W%R"]] += 1
    # BBP
    if indicators[26] != None:
        computed_oscillators["BBP"] = Compute.Simple(indicators[26])
        oscillators_counter[computed_oscillators["BBP"]] += 1
    # UO
    if indicators[28] != None:
        computed_oscillators["UO"] = Compute.Simple(indicators[28])
        oscillators_counter[computed_oscillators["UO"]] += 1

    # MOVING AVERAGES
    ma_list = ["EMA10","SMA10","EMA20","SMA20","EMA30","SMA30","EMA50","SMA50","EMA100","SMA100","EMA200","SMA200"]
    close = indicators[30]
    ma_list_counter = 0
    for index in range(33, 45):
        if indicators[index] != None:
            computed_ma[ma_list[ma_list_counter]] = Compute.MA(indicators[index], close)
            ma_counter[computed_ma[ma_list[ma_list_counter]]] += 1
            ma_list_counter += 1

    # MOVING AVERAGES, pt 2
    # ICHIMOKU
    if indicators[45] != None:
        computed_ma["Ichimoku"] = Compute.Simple(indicators[45])
        ma_counter[computed_ma["Ichimoku"]] += 1
    # VWMA
    if indicators[47] != None:
        computed_ma["VWMA"] = Compute.Simple(indicators[47])
        ma_counter[computed_ma["VWMA"]] += 1
    # HullMA (9)
    if indicators[49] != None:
        computed_ma["HullMA"] = Compute.Simple(indicators[49])
        ma_counter[computed_ma["HullMA"]] += 1

    analysis = Analysis()
    analysis.screener = screener
    analysis.exchange = exchange
    analysis.symbol = symbol
    analysis.interval = interval
    analysis.time = datetime.datetime.now()

    for x in range(len(indicators)):
        analysis.indicators[indicators_key[x]] = indicators[x]

    analysis.indicators = analysis.indicators.copy()

    analysis.oscillators = {"RECOMMENDATION": recommend_oscillators, "BUY": oscillators_counter["BUY"], "SELL": oscillators_counter["SELL"], "NEUTRAL": oscillators_counter["NEUTRAL"], "COMPUTE": computed_oscillators}
    analysis.moving_averages = {"RECOMMENDATION": recommend_moving_averages, "BUY": ma_counter["BUY"], "SELL": ma_counter["SELL"], "NEUTRAL": ma_counter["NEUTRAL"], "COMPUTE": computed_ma}
    analysis.summary = {"RECOMMENDATION": recommend_summary, "BUY": oscillators_counter["BUY"] + ma_counter["BUY"], "SELL": oscillators_counter["SELL"] + ma_counter["SELL"], "NEUTRAL": oscillators_counter["NEUTRAL"] + ma_counter["NEUTRAL"]}

    return analysis

class TA_Handler(object):  # Esta clase es el type TradingView !
    screener = ""
    exchange = ""
    symbol = ""
    interval = ""
    timeout = None

    indicators = TradingView.indicators.copy()

    def __init__(self, screener="", exchange="", symbol="", interval="", timeout=None, proxies=None):
        self.screener = screener
        self.exchange = exchange
        self.symbol = symbol
        self.interval = interval
        self.timeout = timeout

    def get_indicators(self, indicators=[]):
        """
        Args:
            indicators (list, optional): List of string of indicators (ex: ["RSI7", "open"]). Defaults to self.indicators.
        Returns:
            dict: A dictionary with a format of {"indicator": value}.
        """
        if len(indicators) == 0:
            indicators = self.indicators

        if self.screener == "" or type(self.screener) != str:
            raise Exception("Screener is empty or not valid.")
        elif self.exchange == "" or type(self.exchange) != str:
            raise Exception("Exchange is empty or not valid.")
        elif self.symbol == "" or type(self.symbol) != str:
            raise Exception("Symbol is empty or not valid.")

        exchange_symbol = f"{self.exchange}:{self.symbol}"
        data = TradingView.data([exchange_symbol], self.interval, indicators)
        scan_url = f"{TradingView.scan_url}{self.screener.lower()}/scan"
        headers = {"User-Agent": "tradingview_ta/{}".format(__version__)}
        response = requests.post(scan_url,json=data, headers=headers, timeout=self.timeout, proxies=self.proxies)

        # Return False if can't get data
        if response.status_code != 200:
            raise Exception("Can't access TradingView's API. HTTP status code: {}. Check for invalid symbol, exchange, or indicators.".format(response.status_code))

        result = json.loads(response.text)["data"]
        if result != []:
            indicators_val = {}
            for x in range(len(indicators)):
                indicators_val[indicators[x]] = result[0]["d"][x]
            return indicators_val
        else:
            raise Exception("Exchange or symbol not found.")

    def get_analysis(self):
        """Get analysis from TradingView and compute it.
        Returns:
            Analysis: Contains information about the analysis.
        """

        return calculate(indicators=self.get_indicators(), indicators_key=self.indicators, screener=self.screener, symbol=self.symbol, exchange=self.exchange, interval=self.interval)

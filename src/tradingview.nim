## https://TradingView.com client.
import std/[strutils, json]

type
  Recommendation* {.pure.} = enum      ## Buy or Sell ?.
    buy        = "BUY"
    strongBuy  = "STRONG_BUY"
    sell       = "SELL"
    strongSell = "STRONG_SELL"
    neutral    = "NEUTRAL"

  Interval* {.pure.} = enum            ## Time intervals.
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

  Screener* {.pure.} = enum   ## Screeners, currently only Crypto.
    Crypto  = "CRYPTO"        ## Crypto currencies.
    # Forex   = "FOREX"       ## Forex (untested).
    # America = "AMERICA"     ## USA Market (untested).
    # Cfd     = "CFD"         ## Contract For Differences (untested).

  Exchange* {.pure.} = enum   ## Exchanges, currently only Binance.
    Binance  = "BINANCE"      ## Crypto currencies.
    # Coinbase = "COINBASE"   ## Crypto currencies (untested, use Binance).
    # Fx_Idc   = "FX_IDC"     ## FX_IDC for Forex (untested).
    # Tvc      = "TVC"        ## TVC for Contract For Differences (untested).

  Indicators* {.pure.} = enum ## Technical analysis indicators.
    RecommendOther = "Recommend.Other"
    RecommendAll = "Recommend.All"
    RecommendMA = "Recommend.MA"
    RSI = "RSI"
    RSI1 = "RSI[1]"
    StochK = "Stoch.K"
    StochD = "Stoch.D"
    StochK1 = "Stoch.K[1]"
    StochD1 = "Stoch.D[1]"
    CCI20 = "CCI20"
    CCI201 = "CCI20[1]"
    ADX = "ADX"
    ADXplusDI = "ADX+DI"
    ADXminusDI = "ADX-DI"
    ADXplusDI1 = "ADX+DI[1]"
    ADXminusDI1 = "ADX-DI[1]"
    AO = "AO"
    AO1 = "AO[1]"
    Mom = "Mom"
    Mom1 = "Mom[1]"
    MACDmacd = "MACD.macd"
    MACDsignal = "MACD.signal"
    RecStochRSI = "Rec.Stoch.RSI"
    StochRSIK = "Stoch.RSI.K"
    RecWR = "Rec.WR"
    WR = "W.R"
    RecBBPower = "Rec.BBPower"
    BBPower = "BBPower"
    RecUO = "Rec.UO"
    UO = "UO"
    close = "close"
    EMA5 = "EMA5"
    SMA5 = "SMA5"
    EMA10 = "EMA10"
    SMA10 = "SMA10"
    EMA20 = "EMA20"
    SMA20 = "SMA20"
    EMA30 = "EMA30"
    SMA30 = "SMA30"
    EMA50 = "EMA50"
    SMA50 = "SMA50"
    EMA100 = "EMA100"
    SMA100 = "SMA100"
    EMA200 = "EMA200"
    SMA200 = "SMA200"
    RecIchimoku = "Rec.Ichimoku"
    IchimokuBLine = "Ichimoku.BLine"
    RecVWMA = "Rec.VWMA"
    VWMA = "VWMA"
    RecHullMA9 = "Rec.HullMA9"
    HullMA9 = "HullMA9"
    PivotMClassicS3 = "Pivot.M.Classic.S3"
    PivotMClassicS2 = "Pivot.M.Classic.S2"
    PivotMClassicS1 = "Pivot.M.Classic.S1"
    PivotMClassicMiddle = "Pivot.M.Classic.Middle"
    PivotMClassicR1 = "Pivot.M.Classic.R1"
    PivotMClassicR2 = "Pivot.M.Classic.R2"
    PivotMClassicR3 = "Pivot.M.Classic.R3"
    PivotMFibonacciS3 = "Pivot.M.Fibonacci.S3"
    PivotMFibonacciS2 = "Pivot.M.Fibonacci.S2"
    PivotMFibonacciS1 = "Pivot.M.Fibonacci.S1"
    PivotMFibonacciMiddle = "Pivot.M.Fibonacci.Middle"
    PivotMFibonacciR1 = "Pivot.M.Fibonacci.R1"
    PivotMFibonacciR2 = "Pivot.M.Fibonacci.R2"
    PivotMFibonacciR3 = "Pivot.M.Fibonacci.R3"
    PivotMCamarillaS3 = "Pivot.M.Camarilla.S3"
    PivotMCamarillaS2 = "Pivot.M.Camarilla.S2"
    PivotMCamarillaS1 = "Pivot.M.Camarilla.S1"
    PivotMCamarillaMiddle = "Pivot.M.Camarilla.Middle"
    PivotMCamarillaR1 = "Pivot.M.Camarilla.R1"
    PivotMCamarillaR2 = "Pivot.M.Camarilla.R2"
    PivotMCamarillaR3 = "Pivot.M.Camarilla.R3"
    PivotMWoodieS3 = "Pivot.M.Woodie.S3"
    PivotMWoodieS2 = "Pivot.M.Woodie.S2"
    PivotMWoodieS1 = "Pivot.M.Woodie.S1"
    PivotMWoodieMiddle = "Pivot.M.Woodie.Middle"
    PivotMWoodieR1 = "Pivot.M.Woodie.R1"
    PivotMWoodieR2 = "Pivot.M.Woodie.R2"
    PivotMWoodieR3 = "Pivot.M.Woodie.R3"
    PivotMDemarkS1 = "Pivot.M.Demark.S1"
    PivotMDemarkMiddle = "Pivot.M.Demark.Middle"
    PivotMDemarkR1 = "Pivot.M.Demark.R1"
    open = "open"
    PSAR = "P.SAR"
    BBlower = "BB.lower"
    BBupper = "BB.upper"
    AO2 = "AO[2]"
    volume = "volume"
    change = "change"
    name = "name"
    changeabs = "change_abs"
    exchange = "exchange"
    High1M = "High.1M"
    Low1M = "Low.1M"
    High3M = "High.3M"
    Low3M = "Low.3M"
    Perf3M = "Perf.3M"
    price52weekhigh = "price_52_week_high"
    price52weeklow = "price_52_week_low"
    High6M = "High.6M"
    Low6M = "Low.6M"
    Perf6M = "Perf.6M"
    HighAll = "High.All"
    LowAll = "Low.All"
    AroonDown = "Aroon.Down"
    AroonUp = "Aroon.Up"
    ADR = "ADR"
    ATR = "ATR"
    averagevolume10dcalc = "average_volume_10d_calc"
    PerfY = "Perf.Y"
    PerfYTD = "Perf.YTD"
    averagevolume30dcalc = "average_volume_30d_calc"
    averagevolume60dcalc = "average_volume_60d_calc"
    averagevolume90dcalc = "average_volume_90d_calc"
    changeabs15 = "change_abs|15"
    change15 = "change|15"
    changeabs60 = "change_abs|60"
    change60 = "change|60"
    changeabs1 = "change_abs|1"
    change1 = "change|1"
    changeabs240 = "change_abs|240"
    change240 = "change|240"
    changeabs5 = "change_abs|5"
    change5 = "change|5"
    changefromopenabs = "change_from_open_abs"
    changefromopen = "change_from_open"
    DonchCh20Lower = "DonchCh20.Lower"
    DonchCh20Upper = "DonchCh20.Upper"
    gap = "gap"
    IchimokuCLine = "Ichimoku.CLine"
    IchimokuLead1 = "Ichimoku.Lead1"
    IchimokuLead2 = "Ichimoku.Lead2"
    KltChnllower = "KltChnl.lower"
    KltChnlupper = "KltChnl.upper"
    marketcapcalc = "market_cap_calc"
    Perf1M = "Perf.1M"
    ROC = "ROC"
    RSI7 = "RSI7"
    relativevolume10dcalc = "relative_volume_10d_calc"
    StochRSID = "Stoch.RSI.D"
    VolatilityD = "Volatility.D"
    VolatilityM = "Volatility.M"
    VolatilityW = "Volatility.W"
    VWAP = "VWAP"
    PerfW = "Perf.W"
    description = "description"
    subtype = "subtype"
    updatemode = "update_mode"
    pricescale = "pricescale"
    minmov = "minmov"
    fractional = "fractional"
    minmove2 = "minmove2"
    ADXDI = "ADX-DI[1]"
    CandleAbandonedBabyBearish = "Candle.AbandonedBaby.Bearish"
    CandleAbandonedBabyBullish = "Candle.AbandonedBaby.Bullish"
    CandleEngulfingBearish = "Candle.Engulfing.Bearish"
    CandleHaramiBearish = "Candle.Harami.Bearish"
    CandleEngulfingBullish = "Candle.Engulfing.Bullish"
    CandleHaramiBullish = "Candle.Harami.Bullish"
    CandleDoji = "Candle.Doji"
    CandleDojiDragonfly = "Candle.Doji.Dragonfly"
    CandleEveningStar = "Candle.EveningStar"
    CandleDojiGravestone = "Candle.Doji.Gravestone"
    CandleHammer = "Candle.Hammer"
    CandleHangingMan = "Candle.HangingMan"
    CandleInvertedHammer = "Candle.InvertedHammer"
    CandleKickingBearish = "Candle.Kicking.Bearish"
    CandleKickingBullish = "Candle.Kicking.Bullish"
    CandleLongShadowLower = "Candle.LongShadow.Lower"
    CandleLongShadowUpper = "Candle.LongShadow.Upper"
    CandleMarubozuBlack = "Candle.Marubozu.Black"
    CandleMarubozuWhite = "Candle.Marubozu.White"
    CandleMorningStar = "Candle.MorningStar"
    CandleShootingStar = "Candle.ShootingStar"
    CandleSpinningTopBlack = "Candle.SpinningTop.Black"
    CandleSpinningTopWhite = "Candle.SpinningTop.White"
    Candle3BlackCrows = "Candle.3BlackCrows"
    Candle3WhiteSoldiers = "Candle.3WhiteSoldiers"
    CandleTriStarBearish = "Candle.TriStar.Bearish"
    CandleTriStarBullish = "Candle.TriStar.Bullish"

  TradingView* = object         ## TradingView client.
    screener: Screener          ## Screener, currently only Crypto.
    exchange: Exchange          ## Exchange to use, currently only Binance.
    symbol: string              ## Symbol (e.g. "BTCUSDT", "ETHBUSD", "DOGEDAI", etc).
    interval: Interval          ## Time interval to use (e.g. "1m", "5m", "15m", "30m", "1h", "2h", "4h", "1d", "1W", "1M").
    timeout: Positive           ## Timeout.
    indicators: set[Indicators] ## Indicators to be used in the chart (e.g. "SMA", "EMA", "MACD", etc).

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


func newTradingView*(symbol: string; timeout: Positive; interval = INTERVAL1DAY; indicators: set[Indicators]): TradingView =
  ## Constructor for `TradingView`.
  result.screener = Screener.Crypto
  result.exchange = Exchange.Binance
  result.symbol = symbol
  result.interval = interval
  result.timeout = timeout
  result.indicators = indicators

func tradingViewData*(exchangeSymbols: seq[string]; indicators: seq[Indicators]; interval: Interval): JsonNode =
  ## Format TradingView Scanner Post Data.
  ## * `exchangeSymbols` example `@["BINANCE:BTCUSDT", "BINANCE:ETHBUSD"]`, indicators must be all uppercase.
  assert exchangeSymbols.len > 0, "exchangeSymbols must not be a an empty seq."
  assert indicators.len > 0, "indicators must not be a an empty seq."
  var columns: seq[string] = newSeqOfCap[string](indicators.len)
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



func getAnalysis(self: TradingView): Analysis =
  ## Get analysis from TradingView.
  calculate(indicators=self.get_indicators(), indicators_key=self.indicators, screener=self.screener, symbol=self.symbol, exchange=self.exchange, interval=self.interval)



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

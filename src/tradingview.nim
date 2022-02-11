## https://TradingView.com client.
import std/[strutils, sequtils, sugar, json, tables, httpclient]


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
    Forex   = "FOREX"         ## Forex (untested).
    America = "AMERICA"       ## USA Market (untested).
    Cfd     = "CFD"           ## Contract For Differences (untested).

  Exchange* {.pure.} = enum   ## Exchanges, currently only Binance.
    Binance  = "BINANCE"      ## Crypto currencies.
    Coinbase = "COINBASE"     ## Crypto currencies (untested, use Binance).
    BITTREX = "BITTREX"       ## Crypto currencies (untested, use Binance).
    Fx_Idc   = "FX_IDC"       ## FX_IDC for Forex (untested).
    Tvc      = "TVC"          ## TVC for Contract For Differences (untested).
    NASDAQ = "NASDAQ"         ## NASDAQ for USA Market (untested).
    NYSE = "NYSE"             ## NYSE for USA Market (untested).

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
    screener:   Screener        ## Screener, currently only Crypto.
    exchange:   Exchange        ## Exchange to use, currently only Binance.
    symbol:     string          ## Symbol (e.g. "BTCUSDT", "ETHBUSD", "DOGEDAI", etc).
    interval:   Interval        ## Time interval to use (e.g. "1m", "5m", "15m", "30m", "1h", "2h", "4h", "1d", "1W", "1M").
    timeout:    Positive        ## Timeout.
    indicators: set[Indicators] ## Indicators to be used in the chart (e.g. "SMA", "EMA", "MACD", etc).

  BaseAnalysis = object
    recommendation*:    Recommendation
    buy, sell, neutral: int
    compute:            Table[string, Recommendation]

  Summary       = BaseAnalysis
  MovingAverage = BaseAnalysis
  Oscillators   = BaseAnalysis

  Analysis* = tuple[summary: Summary, moving_average: MovingAverage, oscillators: Oscillators]  ## Technical analysis.


const
  tradingviewAPIUrl: string = "https://scanner.tradingview.com/"
  apiVersion: string = "3.2.10"


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

func getIndicators*(): set[Indicators] = { low(Indicators) .. high(Indicators) }

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


func newTradingView*(symbol: string; timeout: Positive; interval = INTERVAL1DAY; indicators: set[Indicators]): TradingView {.inline.} =
  ## Constructor for `TradingView`.
  assert symbol.len > 0, "Symbol must not be an empty string."
  TradingView(screener: Screener.Crypto, exchange: Exchange.Binance, symbol: symbol, interval: interval, timeout: timeout, indicators: indicators)


proc tradingViewData*(exchangeSymbols: seq[string]; indicators: set[Indicators]; interval: Interval): JsonNode =
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
    "columns": columns,
  }


proc get_indicators(self: TradingView): tuple[data: OrderedTable[string,JsonNode], technical_rating:float ] =
  var indicators:set[Indicators] = {}

  if indicators.len == 0:
    indicators = self.indicators

  let
    exchange_symbol = $self.exchange & ':' & self.symbol
    data     = tradingViewData(@[exchange_symbol], self.indicators, self.interval)
    scan_url = tradingviewAPIUrl & toLowerAscii($self.screener) & "/scan"
    client   = newHttpClient()
    headers  = newHttpHeaders({ "Content-Type": "application/json", "User-Agent": "tradingview_ta/" & apiVersion })
    response = client.request(scan_url, headers = headers, httpMethod = HttpPOST, body = $data)

  var err_msg = "Can't access TradingView's API. HTTP status code:" & $response.status & " Check for invalid symbol, exchange, or indicators."

  assert response.status != "200", err_msg

  var json_data = parseJson(response.body)["data"]

  var result_data  = initOrderedTable[string, JsonNode]()

  assert json_data != %*{}, "Json data is empty."

  for indicator in indicators: result_data[$indicator] = json_data[0]["d"][indicator.ord]

  (result_data, json_data[0]["d"][RecommendAll.ord].getFloat)


proc calculate*(self: TradingView): Analysis =
  var
    oscillators_counter  = {"STRONG_SELL": 0, "SELL": 0, "NEUTRAL": 0, "BUY": 0, "STRONG_BUY": 0}.toTable
    ma_counter           = {"STRONG_SELL": 0, "SELL": 0, "NEUTRAL": 0, "BUY": 0, "STRONG_BUY": 0}.toTable

    computed_oscillators = initTable[string,Recommendation]()
    computed_ma =  initTable[string,Recommendation]()

    indicators = get_indicators(self)

    #indicators_val
    iv = toSeq(indicators.data.values).filter(x => x.kind == JFloat).map( x => x.getFloat )

    #Recommendation
    recommend_oscillators = recommend(iv[0])
    recommend_summary = recommend(indicators.technical_rating)
    recommend_moving_averages = recommend(iv[2])

  #RSI
  computed_oscillators["RSI"] = relativeStrengthIndex(iv[3], iv[4])
  oscillators_counter[ $computed_oscillators["RSI"] ] += 1

  # Stoch %K
  computed_oscillators["STOCH.K"] = stochastic(iv[5], iv[6], iv[7], iv[8])
  oscillators_counter[ $computed_oscillators["STOCH.K"] ] += 1

  #cci (20)
  computed_oscillators["CCI"] = commodityChannelIndex20(iv[9], iv[10])
  oscillators_counter[ $computed_oscillators["CCI"] ] += 1

  #ADX (14)
  computed_oscillators["ADX"] = averageDirectionalIndex(iv[11], iv[12], iv[13] , iv[14], iv[15])
  oscillators_counter[ $computed_oscillators["ADX"] ] += 1

  #AO
  computed_oscillators["AO"] = awesomeOscillator(iv[16], iv[17], iv[86])
  oscillators_counter[ $computed_oscillators["AO"] ] += 1

  #MOM (10)
  computed_oscillators["MOM"] = momentum(iv[18], iv[19])
  oscillators_counter[ $computed_oscillators["MOM"] ] += 1

  #MACD
  computed_oscillators["MACD"] = movingAverageConvergenceDivergence(iv[20], iv[21])
  oscillators_counter[ $computed_oscillators["MACD"] ] += 1

  #Stoch RSI
  computed_oscillators["STOCH.RSI"] = recommend(iv[22])
  oscillators_counter[ $computed_oscillators["STOCH.RSI"] ] += 1

  #W%R
  computed_oscillators["W%R"] = recommend(iv[24])
  oscillators_counter[ $computed_oscillators["W%R"] ] += 1

  #BBP
  computed_oscillators["BBP"] = recommend(iv[26])
  oscillators_counter[ $computed_oscillators["BBP"] ] += 1

  #UO
  computed_oscillators["UO"] = recommend(iv[28])
  oscillators_counter[ $computed_oscillators["UO"] ] += 1


  # MOVING AVERAGES
  let ma_list = ["EMA10","SMA10","EMA20","SMA20","EMA30","SMA30","EMA50","SMA50","EMA100","SMA100","EMA200","SMA200"]
  let close = iv[30]
  var ma_list_counter = 0

  for index in 33 ..< 45:
    computed_ma[ma_list[ma_list_counter]] = movingAverage(iv[index], close)
    ma_counter[ $computed_ma[ma_list[ma_list_counter] ] ] += 1
    ma_list_counter += 1

  # MOVING AVERAGES, pt 2
  # ICHIMOKU
  computed_ma["Ichimoku"] = recommend(iv[45])
  ma_counter[ $computed_ma["Ichimoku"] ] += 1

  # VMA
  computed_ma["VMA"] = recommend(iv[47])
  ma_counter[ $computed_ma["VMA"] ] += 1

  # HullMA (9)
  computed_ma["HullMA"] = recommend(iv[49])
  ma_counter[ $computed_ma["HullMA"] ] += 1

  let
    oscillators = Oscillators(recommendation: recommend_oscillators, buy: oscillators_counter["BUY"], sell: oscillators_counter["SELL"], neutral: oscillators_counter["NEUTRAL"], compute: computed_oscillators)
    moving_avg  = MovingAverage(recommendation: recommend_moving_averages, buy: ma_counter["BUY"], sell: ma_counter["SELL"], neutral: ma_counter["NEUTRAL"], compute: computed_ma)
    summary     = Summary(recommendation: recommend_summary, buy: oscillators.buy + moving_avg.buy, sell: oscillators.sell + moving_avg.sell, neutral: oscillators.neutral + moving_avg.neutral)

  (summary, moving_avg, oscillators)


proc getAnalysis*(self: TradingView): Analysis = self.calculate


runnableExamples"-d:ssl -d:nimDisableCertificateValidation":
  const indicators: set[Indicators] = { low(Indicators) .. high(Indicators) }
  doAssert indicators.len == 180
  let trading = newTradingView(symbol = "BTCUSDT", timeout = 999.Positive, indicators = indicators)
  echo "BTCUSDT\n", trading.getAnalysis()


## .. code:: nim
##   (
##     summary: (recommendation: NEUTRAL, buy: 2, sell: 1, neutral: 8, compute: {"MACD": SELL, "CCI": NEUTRAL, "RSI": NEUTRAL, "BBP": NEUTRAL, "STOCH.RSI": NEUTRAL, "ADX": NEUTRAL, "STOCH.K": NEUTRAL, "AO": BUY, "UO": NEUTRAL, "W%R": NEUTRAL, "MOM": BUY}),
##     moving_average: (recommendation: NEUTRAL, buy: 13, sell: 1, neutral: 2, compute: {"HullMA": NEUTRAL, "Ichimoku": NEUTRAL, "VMA": SELL, "EMA10": BUY}),
##     oscillators: (recommendation: NEUTRAL, buy: 15, sell: 2, neutral: 10, compute: {:})
##   )

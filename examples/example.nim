import tradingview

var trading = newTradingView("1INCHUSDT_PREMIUM", 10_000, indicators = getIndicators())
echo "\n1INCHUSDT_PREMIUM\t", trading.getAnalysis().summary.recommendation

trading = newTradingView("BTCUSDT", 10_000, indicators = getIndicators())
echo "\nBTCUSDT\t", trading.getAnalysis().summary.recommendation

trading = newTradingView("AAVEBTC", 10_000, indicators = getIndicators())
echo "\nAAVEBTC\t", trading.getAnalysis().summary.recommendation

trading = newTradingView("ACMUSD", 10_000, indicators = getIndicators())
echo "\nACMUSD\t", trading.getAnalysis().summary.recommendation

trading = newTradingView("1000SHIBUSDTPERP", 10_000, indicators = getIndicators())
echo "\n000SHIBUSDTPERP\t", trading.getAnalysis().summary.recommendation

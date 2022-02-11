import tradingview

var trading = newTradingView("1INCHUSDT_PREMIUM", getIndicators())
echo "\n1INCHUSDT_PREMIUM\t", trading.getAnalysis().summary.recommendation

trading = newTradingView("BTCUSDT", getIndicators())
echo "\nBTCUSDT\t", trading.getAnalysis().summary.recommendation

trading = newTradingView("AAVEBTC", getIndicators())
echo "\nAAVEBTC\t", trading.getAnalysis().summary.recommendation

trading = newTradingView("ACMUSD", getIndicators())
echo "\nACMUSD\t", trading.getAnalysis().summary.recommendation

trading = newTradingView("1000SHIBUSDTPERP", getIndicators())
echo "\n000SHIBUSDTPERP\t", trading.getAnalysis().summary.recommendation

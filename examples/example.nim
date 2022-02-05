import ../src/tradingview

var trading = newTradingView("1INCHUSDT_PREMIUM", 10_000, indicators = getIndicators())
echo "1INCHUSDT_PREMIUM\n", $trading.getAnalysis().summary.recommendation & "\n"

trading = newTradingView("BTCUSDT", 10_000, indicators = getIndicators())
echo "BTCUSDT\n", $trading.getAnalysis().summary.recommendation & "\n"

trading = newTradingView("AAVEBTC", 10_000, indicators = getIndicators())
echo "AAVEBTC\n", $trading.getAnalysis().summary.recommendation & "\n"

trading = newTradingView("ACMUSD", 10_000, indicators = getIndicators())
echo "ACMUSD\n", $trading.getAnalysis().summary.recommendation & "\n"

trading = newTradingView("1000SHIBUSDTPERP", 10_000, indicators = getIndicators())
echo "1000SHIBUSDTPERP\n", $trading.getAnalysis().summary.recommendation & "\n"


import tradingview

var indicators = { low(Indicators) .. high(Indicators) }
var trading = newTradingView("BTCUSDT", 10000, indicators = indicators)

echo "BTCUSDT"
echo "========="
echo trading.getAnalysis().summary.recommendation



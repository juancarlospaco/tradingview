import tradingview

const indicators = { low(Indicators) .. high(Indicators) }
var trading = newTradingView("BTCUSDT", 10_000, indicators = indicators)

echo "BTCUSDT\n", trading.getAnalysis().summary.recommendation

# TradingView

![](https://raw.githubusercontent.com/juancarlospaco/tradingview/nim/tradingview.jpg)



- https://juancarlospaco.github.io/tradingview
- https://github.com/juancarlospaco/tradingview/blob/nim/examples/example.nim#L6-LL7

![](https://github.com/juancarlospaco/tradingview/actions/workflows/build.yml/badge.svg)


# Example

```nim
import tradingview
let trading = newTradingView("BTCUSDT", getIndicators())
echo trading.getAnalysis()
```

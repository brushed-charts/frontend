import 'package:brushed_charts_graphql/main.dart' as graphql;

main(List<String> args) async {
  final variables = graphql.VariablesGetCandles();
  variables.dateFrom = "2021-01-20 10:00:00";
  variables.dateTo = "2021-01-20 10:10:00";
  variables.instrument = "EUR_USD";
  variables.granularity = "SS5";
  List<graphql.DataCandle> candles;

  try {
    candles = await graphql.getCandles(variables);
  } on graphql.ResponseError catch (e) {
    print("sdsdsd");
    print(e.cause);
  }

  for (final candle in candles) {
    print(candle.mid.open);
  }
}

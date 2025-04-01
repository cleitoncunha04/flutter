import 'package:bloc_weather_app/data/converter/conveter.dart';
import 'package:bloc_weather_app/data/model/hourly_forecast_model.dart';

class OpenWeatherToHourlyForecastModel
    implements Conveter<Map<String, dynamic>, HourlyForecastModel> {
  @override
  HourlyForecastModel convert(Map<String, dynamic> source) {
    return HourlyForecastModel(
      temperature: (source['main']['temp'] as double).round(),
      skyCondition: source['weather'][0]['main'],
      time: DateTime.parse(
        source['dt_txt'],
      ),
    );
  }
}

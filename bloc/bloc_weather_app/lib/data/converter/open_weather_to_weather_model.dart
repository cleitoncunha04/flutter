import 'package:bloc_weather_app/data/converter/open_weather_to_hourly_forecast_model.dart';
import 'package:bloc_weather_app/data/model/hourly_forecast_model.dart';

import 'conveter.dart';

import 'package:bloc_weather_app/data/model/weather_model.dart';

class OpenWeatherToWeatherModel
    implements Conveter<Map<String, dynamic>, WeatherModel> {
  @override
  WeatherModel convert(Map<String, dynamic> source) {
    List<HourlyForecastModel> hourlyData = (source['list'] as List)
        .skip(1)
        .take(5)
        .map(
          (item) => OpenWeatherToHourlyForecastModel().convert(
            item,
          ),
        )
        .toList();

    return WeatherModel(
      temperature: (source['list'][0]['main']['temp'] as double).round(),
      skyCondition: source['list'][0]['weather'][0]['main'],
      humidity: source['list'][0]['main']['humidity'],
      windSpeed: source['list'][0]['wind']['speed'].toDouble(),
      pressure: source['list'][0]['main']['pressure'],
      hourlyForecast: hourlyData,
    );
  }
}


import 'package:bloc_weather_app/domain/model/hourly_forecast.dart';

class Weather {
  final int temperature;
  final String skyCondition;
  final int humidity;
  final double windSpeed;
  final int pressure;
  final List<HourlyForecast> hourlyForecast;

  Weather({
    required this.temperature,
    required this.skyCondition,
    required this.humidity,
    required this.windSpeed,
    required this.pressure,
    required this.hourlyForecast,
  });

  
}

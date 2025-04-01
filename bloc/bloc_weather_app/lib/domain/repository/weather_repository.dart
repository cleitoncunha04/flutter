import 'package:bloc_weather_app/domain/model/weather.dart';
import 'package:bloc_weather_app/domain/usecase/fetch_weather_by_city_name.dart';

abstract class WeatherRepository {
  Future<Weather> fetchWeatherByCityName(ParamsFetchWeatherByCityName params);
}
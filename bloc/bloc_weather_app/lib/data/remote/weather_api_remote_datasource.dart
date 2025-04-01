import 'package:bloc_weather_app/data/model/weather_model.dart';

abstract class WeatherApiRemoteDatasource {
  Future<WeatherModel> fetchWeatherByCityName(
    String cityName,
  );
}

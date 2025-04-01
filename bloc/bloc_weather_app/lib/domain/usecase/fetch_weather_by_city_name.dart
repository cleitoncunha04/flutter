import 'package:bloc_weather_app/domain/model/weather.dart';
import 'package:bloc_weather_app/domain/repository/weather_repository.dart';

class FetchWeatherByCityName {
  final WeatherRepository weatherRepository;

  FetchWeatherByCityName({
    required this.weatherRepository,
  });

  Future<Weather> call(ParamsFetchWeatherByCityName params) =>
      weatherRepository.fetchWeatherByCityName(
        params,
      );
}

class ParamsFetchWeatherByCityName {
  final String cityName;

  ParamsFetchWeatherByCityName({
    required this.cityName,
  });
}

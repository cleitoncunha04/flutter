import 'package:bloc_weather_app/data/remote/weather_api_remote_datasource.dart';
import 'package:bloc_weather_app/domain/model/weather.dart';
import 'package:bloc_weather_app/domain/repository/weather_repository.dart';
import 'package:bloc_weather_app/domain/usecase/fetch_weather_by_city_name.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  WeatherRepositoryImpl({
    required this.datasource,
  });

  final WeatherApiRemoteDatasource datasource;

  @override
  Future<Weather> fetchWeatherByCityName(
      ParamsFetchWeatherByCityName params) async {
    return await datasource.fetchWeatherByCityName(
      params.cityName,
    );
  }
}

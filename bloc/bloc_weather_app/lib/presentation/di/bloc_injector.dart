import 'package:bloc_weather_app/data/remote/open_weather/open_weather_service.dart';
import 'package:bloc_weather_app/data/repository/weather_repository_impl.dart';
import 'package:bloc_weather_app/domain/usecase/fetch_weather_by_city_name.dart';
import 'package:bloc_weather_app/presentation/bloc/weather_bloc.dart';

class BlocInjector {
  BlocInjector._();

  static WeatherBloc provideWeatherBloc() {
    return WeatherBloc(
      fetchWeatherByCityName: FetchWeatherByCityName(
        weatherRepository: WeatherRepositoryImpl(
          datasource: OpenWeatherService(),
        ),
      ),
    );
  }
}

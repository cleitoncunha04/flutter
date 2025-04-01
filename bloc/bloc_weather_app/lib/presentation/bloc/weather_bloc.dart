import 'package:bloc_weather_app/domain/model/weather.dart';
import 'package:bloc_weather_app/domain/usecase/fetch_weather_by_city_name.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final FetchWeatherByCityName fetchWeatherByCityName;

  WeatherBloc({
    required this.fetchWeatherByCityName,
  }) : super(WeatherInitial()) {
    on<FetchedWeatherEvent>(
      _onFetchedWeatherEvent,
    );
  }

  Future<void> _onFetchedWeatherEvent(
      FetchedWeatherEvent event, Emitter<WeatherState> emit) async {
    emit(
      WeatherLoading(),
    );

    try {
      Weather weather = await fetchWeatherByCityName(
        ParamsFetchWeatherByCityName(
          cityName: event.cityName,
        ),
      );

      emit(
        WeatherLoaded(
          weather: weather,
        ),
      );
    } catch (e) {
      emit(
        WeatherError(
          message: e.toString(),
        ),
      );
    }
  }
}

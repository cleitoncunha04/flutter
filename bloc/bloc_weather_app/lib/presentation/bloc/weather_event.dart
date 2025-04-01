part of 'weather_bloc.dart';

sealed class WeatherEvent {}

final class FetchedWeatherEvent implements WeatherEvent {
  FetchedWeatherEvent({
    required this.cityName,
  });

  final String cityName;
}

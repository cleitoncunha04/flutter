part of 'weather_bloc.dart';

sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherLoading extends WeatherState {}

final class WeatherLoaded extends WeatherState {
  WeatherLoaded({
    required this.weather,
  });
  
  final Weather weather;
}

final class WeatherError extends WeatherState {
  WeatherError({
    required this.message,
  });

  final String message;
}

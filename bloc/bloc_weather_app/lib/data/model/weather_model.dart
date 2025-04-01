import 'dart:convert';

import 'package:bloc_weather_app/data/model/hourly_forecast_model.dart';
import 'package:bloc_weather_app/domain/model/weather.dart';
import 'package:flutter/foundation.dart';

class WeatherModel extends Weather {
  WeatherModel({
    required super.temperature,
    required super.skyCondition,
    required super.humidity,
    required super.windSpeed,
    required super.pressure,
    required super.hourlyForecast,
  });

  WeatherModel copyWith({
    int? temperature,
    String? skyCondition,
    int? humidity,
    double? windSpeed,
    int? pressure,
    List<HourlyForecastModel>? hourlyForecast,
  }) {
    return WeatherModel(
      temperature: temperature ?? this.temperature,
      skyCondition: skyCondition ?? this.skyCondition,
      humidity: humidity ?? this.humidity,
      windSpeed: windSpeed ?? this.windSpeed,
      pressure: pressure ?? this.pressure,
      hourlyForecast: hourlyForecast ?? this.hourlyForecast,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'temperature': temperature,
      'skyCondition': skyCondition,
      'humidity': humidity,
      'windSpeed': windSpeed,
      'pressure': pressure,
      'hourlyForecast': hourlyForecast
          .map(
            (h) => (h as HourlyForecastModel).toMap(),
          )
          .toList(),
    };
  }

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    return WeatherModel(
      temperature: map['temperature'] as int,
      skyCondition: map['skyCondition'] as String,
      humidity: map['humidity'] as int,
      windSpeed: map['windSpeed'] as double,
      pressure: map['pressure'] as int,
      hourlyForecast: List<HourlyForecastModel>.from(
        (map['hourlyForecast'] as List<int>).map<HourlyForecastModel>(
          (x) => HourlyForecastModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherModel.fromJson(String source) =>
      WeatherModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Weather(temperature: $temperature, skyCondition: $skyCondition, humidity: $humidity, windSpeed: $windSpeed, pressure: $pressure, hourlyForecast: $hourlyForecast)';
  }

  @override
  bool operator ==(covariant Weather other) {
    if (identical(this, other)) return true;

    return other.temperature == temperature &&
        other.skyCondition == skyCondition &&
        other.humidity == humidity &&
        other.windSpeed == windSpeed &&
        other.pressure == pressure &&
        listEquals(
          other.hourlyForecast,
          hourlyForecast,
        );
  }

  @override
  int get hashCode {
    return temperature.hashCode ^
        skyCondition.hashCode ^
        humidity.hashCode ^
        windSpeed.hashCode ^
        pressure.hashCode ^
        hourlyForecast.hashCode;
  }
}

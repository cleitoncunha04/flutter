import 'dart:convert';

import 'package:bloc_weather_app/domain/model/hourly_forecast.dart';

class HourlyForecastModel extends HourlyForecast {
  HourlyForecastModel({
    required super.temperature,
    required super.skyCondition,
    required super.time,
  });

  HourlyForecastModel copyWith({
    int? temperature,
    String? skyCondition,
    DateTime? time,
  }) {
    return HourlyForecastModel(
      temperature: temperature ?? this.temperature,
      skyCondition: skyCondition ?? this.skyCondition,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'temperature': temperature,
      'skyCondition': skyCondition,
      'time': time,
    };
  }

  factory HourlyForecastModel.fromMap(Map<String, dynamic> map) {
    return HourlyForecastModel(
      temperature: map['temperature'] as int,
      skyCondition: map['skyCondition'] as String,
      time: map['time'] as DateTime,
    );
  }

  String toJson() => json.encode(toMap());

  factory HourlyForecastModel.fromJson(String source) =>
      HourlyForecastModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() =>
      'HourlyForecast(temperature: $temperature, skyCondition: $skyCondition, time: $time)';

  @override
  bool operator ==(covariant HourlyForecast other) {
    if (identical(this, other)) return true;

    return other.temperature == temperature &&
        other.skyCondition == skyCondition &&
        other.time == time;
  }

  @override
  int get hashCode =>
      temperature.hashCode ^ skyCondition.hashCode ^ time.hashCode;
}

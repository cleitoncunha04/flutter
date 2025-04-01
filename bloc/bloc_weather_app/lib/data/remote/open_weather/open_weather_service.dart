import 'dart:convert';

import 'package:bloc_weather_app/data/constant/api_token.dart';
import 'package:bloc_weather_app/data/converter/open_weather_to_weather_model.dart';
import 'package:bloc_weather_app/data/model/weather_model.dart';
import 'package:bloc_weather_app/data/remote/weather_api_remote_datasource.dart';
import 'package:http/http.dart' as http;

class OpenWeatherService implements WeatherApiRemoteDatasource {
  @override
  Future<WeatherModel> fetchWeatherByCityName(String cityName) async {
    try {
      final res = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&units=metric&APPID=${ApiToken.accessToken}',
        ),
      );

      final data = jsonDecode(res.body);

      if (data['cod'] != '200') {
        throw 'An unexpected error occurred';
      }

      return OpenWeatherToWeatherModel().convert(
        data,
      );
    } catch (e) {
      throw e.toString();
    }
  }
}

import 'package:bloc_weather_app/presentation/di/bloc_injector.dart';
import 'package:flutter/material.dart';
import 'package:bloc_weather_app/presentation/screen/weather_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => BlocInjector.provideWeatherBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(useMaterial3: true),
        home: const WeatherScreen(),
      ),
    );
  }
}

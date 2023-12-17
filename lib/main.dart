import 'dart:developer';

import 'package:app/Cubits/getWeatherCubit/getWeatherCubit.dart';
import 'package:app/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //provide Cubit
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(builder: (context) {
        final weatherCondition =
            BlocProvider.of<GetWeatherCubit>(context).weatherModel?.condition;
        log("Weather Condition: $weatherCondition");
        final themeColor = getThemeColor(weatherCondition);
        log("Theme Color: $themeColor");

        return MaterialApp(
          theme: ThemeData(
            primarySwatch: themeColor,
          ),
          home: const HomeView(),
        );
      }),
    );
  }

  MaterialColor getThemeColor(String? weatherCondition) {
    if (weatherCondition == null) {
      return Colors.green;
    }
    switch (weatherCondition) {
      case 'Sunny':
        return Colors.orange;
      case 'Partly cloudy':
      case 'Cloudy':
      case 'Overcast':
        return Colors.grey;
      case 'Mist':
        return Colors.blueGrey;
      case 'Patchy rain possible':
      case 'Patchy snow possible':
      case 'Patchy sleet possible':
      case 'Patchy freezing drizzle possible':
        return Colors.lightBlue;
      case 'Thundery outbreaks possible':
        return Colors.deepPurple;
      case 'Blowing snow':
      case 'Blizzard':
        return Colors.blueGrey;
      case 'Fog':
      case 'Freezing fog':
        return Colors.grey;
      case 'Patchy light drizzle':
      case 'Light drizzle':
        return Colors.brown;
      case 'Freezing drizzle':
      case 'Heavy freezing drizzle':
        return Colors.blue;
      case 'Patchy light rain':
      case 'Light rain':
      case 'Moderate rain at times':
      case 'Moderate rain':
        return Colors.lightGreen;
      case 'Heavy rain at times':
      case 'Heavy rain':
        return Colors.green;
      case 'Light freezing rain':
      case 'Moderate or heavy freezing rain':
        return Colors.blue;
      // Add more weatherConditions as needed
      default:
        return Colors.blue;
    }
  }
}

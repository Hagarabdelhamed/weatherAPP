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
    return  BlocProvider(
      create: (context) => GetWeattherCubit(),
      child: const MaterialApp(
        home: HomeView(),
      ),
    );
  }
}

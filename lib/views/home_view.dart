import 'package:app/Cubits/getWeatherCubit/getWeatherState.dart';
import 'package:app/views/search_view.dart';
import 'package:app/widgets/no_weather_body.dart';
import 'package:app/widgets/weather_info_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Cubits/getWeatherCubit/getWeatherCubit.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    var weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    return Scaffold(
        appBar: AppBar(
          elevation: 2 ,
          title: const Text(
            'Weather App',
            style: TextStyle(
              color: Colors.white,
            fontWeight: FontWeight.bold),
          ),
          backgroundColor: const Color(0xff5FBDFF),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchView(),
                    ));
              },
              icon: const Icon(Icons.search),
              color: Colors.white,
              iconSize: 30,
            ),
          ],
        ),
        body: BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is NoWeatherState) {
              return const NoWeatherBody();
            } else if (state is WeatherLoadedState) {
              return WeatherInfoBody(weather: state.weatherModel);
            } else {
              return const Text('There is an error , please search again');
            }
          },
        ));
  }
}

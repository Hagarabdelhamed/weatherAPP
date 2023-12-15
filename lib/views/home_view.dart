import 'package:app/views/search_view.dart';
import 'package:app/widgets/no_weather_body.dart';
import 'package:app/widgets/weather_info_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
      body: weatherModel == null ? const NoWeatherBody() : const WeatherInfoBody(),
    );
  }
}

import 'package:app/Cubits/getWeatherCubit/getWeatherState.dart';
import 'package:app/Services/weatherService.dart';
import 'package:app/models/weatherModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../views/search_view.dart';

class GetWeattherCubit extends Cubit<WeatherState>
{
  GetWeattherCubit(super.initialState);
//create function contain the logic
  getWeather({ required String value }) async {
    WeatherModel weatherModel = await WeatherService(dio: Dio()).getCurrentWeather(cityName: value);
  }
}
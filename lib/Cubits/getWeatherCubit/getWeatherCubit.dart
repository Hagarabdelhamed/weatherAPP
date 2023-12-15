import 'package:app/Cubits/getWeatherCubit/getWeatherState.dart';
import 'package:app/Services/weatherService.dart';
import 'package:app/models/weatherModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class GetWeattherCubit extends Cubit<WeatherState>
{
  GetWeattherCubit()  :   super(NoWeatherState());
//create function contain the logic
  getWeather({ required String value }) async {
    try {
  WeatherModel weatherModel = await WeatherService(dio: Dio()).getCurrentWeather(cityName: value);
    emit(WeatherLoadedState()); 
} on Exception catch (e) {
    emit(WeatherFailureState());
}
  }
}
import 'package:app/Cubits/getWeatherCubit/getWeatherState.dart';
import 'package:app/Services/weatherService.dart';
import 'package:app/models/weatherModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(NoWeatherState());
    WeatherModel? weatherModel;
//create function contain the logic
  getWeather({required String cityName}) async {
    try {
       weatherModel = await WeatherService(dio: Dio())
          .getCurrentWeather(cityName: cityName);
      emit(WeatherLoadedState(weatherModel!));
    } on Exception catch (e) {
      emit(WeatherFailureState());
    }
  }
}

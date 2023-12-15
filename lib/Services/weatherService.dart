import 'package:app/models/weatherModel.dart';
import 'package:dio/dio.dart';


class WeatherService {
  //intialize dio in the constructore to avoid intialize it in every get method
  //in this case it is fine to intialize it like >>  Dio dio = Dio();
  //cuz i have one response to get (getCurrentWeather())
  final Dio dio;
  final String baseURL = 'https://api.weatherapi.com/v1';
  final String ApiKey = '61f2bece6bc7488f96f170757231112';
  WeatherService({required this.dio});

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseURL/forecast.json?key=$ApiKey&q=$cityName&days=1');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMsg = e.response?.data['error']['message'] ??
          'there is an Error , Try Later';
      throw Exception(errorMsg);
    } catch (e) {
      throw Exception('There is an Error , Try Later');
    }
  }
}

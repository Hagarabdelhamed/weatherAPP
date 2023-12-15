// ignore_for_file: file_names

class WeatherModel {
  final String cityName;
  final String? date;
  final double? temp;
  final double? maxTemp;
  final double? minTemp;
  final String? condition;
  final String? condImage;

  WeatherModel({
    required this.cityName,
    this.date,
    this.temp,
    this.maxTemp,
    this.minTemp,
    this.condition,
    this.condImage,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    // Extracting the first forecast entry for simplicity, you might want to iterate over forecastday list
    var forecastEntry = json['forecast']['forecastday'][0]['day'];

    return WeatherModel(
      cityName: json['location']['name'],
      date: json['current']['last_updated'],
      temp: forecastEntry['avgtemp_c'],
      maxTemp: forecastEntry['maxtemp_c'],
      minTemp: forecastEntry['mintemp_c'],
      condition: forecastEntry['condition']['text'],
      condImage: forecastEntry['condition']['icon'],
    );
  }
}

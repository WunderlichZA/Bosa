import 'dart:convert';

import 'package:flutter_projects/core/error/exceptions.dart';
import 'package:flutter_projects/features/weather/data/models/five_day_weather_forecast.dart';
import 'package:flutter_projects/features/weather/data/models/weather_response_model.dart';
import 'package:http/http.dart';

abstract class WeatherRemoteDataSource {
  /// Calls the https://api.openweathermap.org/data/2.5/weather?{lat$lon$apikey} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<WeatherResponseModel> getWeatherUpdate(double lat, double lon, String apiKey);

  /// https://api.openweathermap.org/data/2.5/weather?{lat$lon$apikey} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<FiveDayForecastModel> getFiveDayForecast(double lat, double lon, String apiKey);
}

class WeatherRemoteDataSourceImpl extends WeatherRemoteDataSource{
  final Client? client;

  WeatherRemoteDataSourceImpl({required this.client});
  @override
  Future<FiveDayForecastModel> getFiveDayForecast(double lat, double lon, String apiKey) async {
    final response = await client?.post(
      Uri(path: 'http://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&appid=$apiKey'),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if(response!.statusCode == 200){
      return FiveDayForecastModel.fromJson(json.decode(response.body));
    }else{
      throw ServerException();
    }
  }

  @override
  Future<WeatherResponseModel> getWeatherUpdate(double lat, double lon, String apiKey) async {
    final response = await client?.post(
      Uri(path: 'http://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey'),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if(response!.statusCode == 200){
      return WeatherResponseModel.fromJson(json.decode(response.body));
    }else{
      throw ServerException();
    }
  }

}
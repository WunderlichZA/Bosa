import 'package:dartz/dartz.dart';
import 'package:flutter_projects/core/error/failures.dart';
import 'package:flutter_projects/features/weather/domain/entities/fivedayforecast.dart';
import 'package:flutter_projects/features/weather/domain/entities/weatherresponse.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherResponse>> getWeatherUpdate(double? lat, double? lon, String? apiKey);
  Future<Either<Failure, FiveDayForecastResponse>> getFiveDayForecast(double? lat, double? lon, String? apiKey);
}
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_projects/core/error/failures.dart';
import 'package:flutter_projects/core/usecases/usecase.dart';
import 'package:flutter_projects/features/weather/domain/entities/weatherresponse.dart';
import 'package:flutter_projects/features/weather/domain/repositories/weather_repository.dart';

class GetWeatherUpdatesUsecase implements UseCase<WeatherResponse, Params>{

  final WeatherRepository? repository;

  GetWeatherUpdatesUsecase(this.repository);

  @override
  Future<Either<Failure, WeatherResponse>> call(Params params) async {
    return await repository!.getWeatherUpdate(params.lat, params.lon, params.apiKey);
  }
}

class Params extends Equatable{
  final double? lat;
  final double? lon;
  final String? apiKey;

  Params({required this.lat, required this.lon, required this.apiKey});

  @override
  List<Object?> get props => [lat, lon, apiKey];

}
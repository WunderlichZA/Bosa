import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_projects/core/error/exceptions.dart';
import 'package:flutter_projects/core/error/failures.dart';
import 'package:flutter_projects/features/weather/data/datasources/weather_remote_data_source.dart';
import 'package:flutter_projects/features/weather/domain/entities/fivedayforecast.dart';
import 'package:flutter_projects/features/weather/domain/entities/weatherresponse.dart';
import 'package:flutter_projects/features/weather/domain/repositories/weather_repository.dart';
import 'package:flutter_projects/network/network_info.dart';

class WeatherRepositoryImpl extends WeatherRepository{
  final WeatherRemoteDataSource? dataSource;
  final NetworkInfo? networkInfo;

  WeatherRepositoryImpl({required this.dataSource, required this.networkInfo});

  @override
  Future<Either<Failure, FiveDayForecastResponse>> getFiveDayForecast(double? lat, double? lon, String? apiKey) async {
    if(await networkInfo!.isConnected){
      try{
        final remoteFiveDayForecast = await dataSource?.getFiveDayForecast(lat, lon, apiKey);
        return Right(remoteFiveDayForecast!);
      } on ServerException{
        return Left(ServerFailure());
      }
    }else{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, WeatherResponse>> getWeatherUpdate(double? lat, double? lon, String? apiKey) async {
    if(await networkInfo!.isConnected){
      try{
        final remoteWeatherUpdate = await dataSource?.getWeatherUpdate(lat, lon, apiKey);
        return Right(remoteWeatherUpdate!);
      } on ServerException{
        return Left(ServerFailure());
      }
    }else{
      return Left(ServerFailure());
    }
  }
}
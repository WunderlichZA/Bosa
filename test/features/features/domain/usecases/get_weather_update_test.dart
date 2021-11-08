import 'package:dartz/dartz.dart';
import 'package:flutter_projects/features/weather/data/models/clouds_model.dart';
import 'package:flutter_projects/features/weather/domain/entities/coordinates.dart';
import 'package:flutter_projects/features/weather/domain/entities/main.dart';
import 'package:flutter_projects/features/weather/domain/entities/sys.dart';
import 'package:flutter_projects/features/weather/domain/entities/weather.dart';
import 'package:flutter_projects/features/weather/domain/entities/weatherresponse.dart';
import 'package:flutter_projects/features/weather/domain/entities/wind.dart';
import 'package:flutter_projects/features/weather/domain/repositories/weather_repository.dart';
import 'package:flutter_projects/features/weather/domain/usecases/get_weather_update.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockWeatherRepository extends Mock implements WeatherRepository{}

void main(){
  GetWeatherUpdatesUsecase? usecase;
  MockWeatherRepository? mockWeatherRepository;

  setUp((){
    mockWeatherRepository = MockWeatherRepository();
    usecase = GetWeatherUpdatesUsecase(mockWeatherRepository);
  });

  final tLat = -33.9493;
  final tLon = 18.53;
  final tApiKey = '6968ada2271ff56637317e5c6ad43ab0';

  final tCloudsModel = CloudsModel(all: 0);
  final tWeatherResponse = WeatherResponse(
      base: 'stations',
      clouds: tCloudsModel,
      cod: 200,
      coord: Coord(lon: 18.53, lat: -33.9493),
      dt: 1630971862,
      id: 3362864,
      main: Main(),
      name: 'Pinelands',
      sys: Sys(),
      timezone: 7200,
      visibility: 10000,
      weather: <Weather>[],
      wind: Wind(deg: 170, speed: 6.7));

  test('should get WeatherModel for the lat and lon from the repository', () async {
    // arrange
    
  });

}
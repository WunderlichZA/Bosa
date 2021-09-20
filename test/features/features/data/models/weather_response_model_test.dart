import 'dart:convert';

import 'package:flutter_projects/features/weather/data/models/weather_response_model.dart';
import 'package:flutter_projects/features/weather/domain/entities/clouds.dart';
import 'package:flutter_projects/features/weather/domain/entities/coordinates.dart';
import 'package:flutter_projects/features/weather/domain/entities/main.dart';
import 'package:flutter_projects/features/weather/domain/entities/sys.dart';
import 'package:flutter_projects/features/weather/domain/entities/weather.dart';
import 'package:flutter_projects/features/weather/domain/entities/weatherresponse.dart';
import 'package:flutter_projects/features/weather/domain/entities/wind.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/fixture_reader.dart';

void main(){
  final Clouds tClouds = Clouds(all: 200);
  final tWeatherModel = WeatherResponseModel(base : 'stations',
      clouds : tClouds,
      cod: 200,
      coord : Coord(lon: 18.53,
          lat: -33.9493),
      dt : 1630971862,
      id : 3362864,
      main : Main(),
      name : 'Pinelands',
      sys : Sys(),
      timezone : 7200,
      visibility : 10000,
      weather : <Weather>[],
      wind : Wind(deg: 170, speed: 6.7));

  test(
    'should be a subclass of WeatherResponse entity',
        () async {
      // assert
      expect(tWeatherModel, isA<WeatherResponse>());
    },
  );

  group('fromJson', () {
    test(
      'should return a valid model when the JSON number is an integer',
          () async * {
        // arrange
        final Map<String, dynamic> jsonMap =
        json.decode(fixture('response.json'));
        // act
        final result = WeatherResponseModel.fromJson(jsonMap);
        // assert
        expect(result, tWeatherModel);
      },
    );
  });
}
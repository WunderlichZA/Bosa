import 'dart:convert';

import 'package:flutter_projects/features/weather/data/models/weather_model.dart';
import 'package:flutter_projects/features/weather/domain/entities/weather.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tWeatherModel = WeatherModel(
      description: 'clear sky', icon: '01n', id: 800, main: 'Clear');

  test(
    'should be a subclass of Weather entity',
        () async {
      // assert
      expect(tWeatherModel, isA<Weather>());
    },
  );

  group('fromJson', () {
    test(
      'should return a valid model',
          () async * {
        // arrange
        final Map<String, dynamic> jsonMap =
        json.decode(fixture('response.json'));
        // act
        final result = WeatherModel.fromJson(jsonMap);
        // assert
        expect(result, tWeatherModel);
      },
    );
  });
}

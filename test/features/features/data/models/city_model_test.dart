import 'dart:convert';

import 'package:flutter_projects/features/weather/data/models/city_model.dart';
import 'package:flutter_projects/features/weather/domain/entities/city.dart';
import 'package:flutter_projects/features/weather/domain/entities/coordinates.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tCityModel = CityModel(
    coord: Coord(lon: 18.53, lat: -33.9493),
    country: '',
    id: 3362864,
    name: 'Pinelands',
    population: 122502,
    sunrise: 1632024355,
    sunset: 1632067640,
    timezone: 7200,
  );

  test(
    'should be a subclass of City entity',
        () async {
      // assert
      expect(tCityModel, isA<City>());
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
        final result = CityModel.fromJson(jsonMap);
        // assert
        expect(result, tCityModel);
      },
    );
  });
}

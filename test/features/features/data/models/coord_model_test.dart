import 'dart:convert';

import 'package:flutter_projects/features/weather/data/models/coordinates_model.dart';
import 'package:flutter_projects/features/weather/domain/entities/coordinates.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/fixture_reader.dart';

void main (){
  final tCoordModel = CoordModel(lon: 18.53, lat: -33.9493);

  test(
    'should be a subclass of Coord entity',
        () async {
      // assert
      expect(tCoordModel, isA<Coord>());
    },
  );

  group('fromJson', () {
    test(
      'should return a valid model when lat and long provided',
          () async * {
        // arrange
        final Map<String, dynamic> jsonMap =
        json.decode(fixture('response.json'));
        // act
        final result = CoordModel.fromJson(jsonMap);
        // assert
        expect(result, tCoordModel);
      },
    );
  });
}
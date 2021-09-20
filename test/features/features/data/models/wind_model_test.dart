import 'dart:convert';

import 'package:flutter_projects/features/weather/data/models/wind_mode.dart';
import 'package:flutter_projects/features/weather/domain/entities/wind.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tWindModel = WindModel(deg: 0, speed: 1.4);

  test(
    'should be a subclass of Wind entity',
    () async {
      // assert
      expect(tWindModel, isA<Wind>());
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
        final result = WindModel.fromJson(jsonMap);
        // assert
        expect(result, tWindModel);
      },
    );
  });
}

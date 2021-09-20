import 'dart:convert';

import 'package:flutter_projects/features/weather/data/models/main_model.dart';
import 'package:flutter_projects/features/weather/domain/entities/main.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tMainModel = MainModel(
      temp: 284.38,
      feelsLike: 283.41,
      tempMin: 280.98,
      tempMax: 284.38,
      pressure: 1029,
      humidity: 71);

  test(
    'should be a subclass of Main entity',
    () async {
      // assert
      expect(tMainModel, isA<Main>());
    },
  );

  group('fromJson', () {
    test(
      'should return a valid model',
      () async* {
        // arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('response.json'));
        // act
        final result = MainModel.fromJson(jsonMap);
        // assert
        expect(result, tMainModel);
      },
    );
  });
}

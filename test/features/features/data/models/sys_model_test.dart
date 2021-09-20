import 'dart:convert';

import 'package:flutter_projects/features/weather/data/models/sys_model.dart';
import 'package:flutter_projects/features/weather/domain/entities/sys.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tSysModel = SysModel(
      type: 0, id: 0, country: 'df', sunrise: 0, sunset: 9);

  test(
    'should be a subclass of Sys entity',
        () async {
      // assert
      expect(tSysModel, isA<Sys>());
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
        final result = SysModel.fromJson(jsonMap);
        // assert
        expect(result, tSysModel);
      },
    );
  });
}

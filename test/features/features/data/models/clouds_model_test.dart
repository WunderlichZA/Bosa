import 'dart:convert';

import 'package:flutter_projects/features/weather/data/models/clouds_model.dart';
import 'package:flutter_projects/features/weather/domain/entities/clouds.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/fixture_reader.dart';

void main(){
  final tCloudsModel = CloudsModel(all: 0);

  test(
    'should be a subclass of Clouds entity',
        () async {
      // assert
      expect(tCloudsModel, isA<Clouds>());
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
        final result = CloudsModel.fromJson(jsonMap);
        // assert
        expect(result, tCloudsModel);
      },
    );
  });
}
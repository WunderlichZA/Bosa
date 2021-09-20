import 'dart:convert';

import 'package:flutter_projects/features/weather/data/models/list_item_model.dart';
import 'package:flutter_projects/features/weather/domain/entities/clouds.dart';
import 'package:flutter_projects/features/weather/domain/entities/list_item.dart';
import 'package:flutter_projects/features/weather/domain/entities/main.dart';
import 'package:flutter_projects/features/weather/domain/entities/sys.dart';
import 'package:flutter_projects/features/weather/domain/entities/weather.dart';
import 'package:flutter_projects/features/weather/domain/entities/wind.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tListItemModel = ListItemModel(
    clouds: Clouds(all: 200),
    dt: 1630971862,
    dtTxt: '2021-09-20 21:00:00',
    main: Main(),
    pop: 0,
    sys: Sys(),
    visibility: 10000,
    weather: <Weather>[],
    wind: Wind(deg: 170, speed: 6.7),
  );

  test(
    'should be a subclass of ListItem entity',
        () async {
      // assert
      expect(tListItemModel, isA<ListItem>());
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
        final result = ListItemModel.fromJson(jsonMap);
        // assert
        expect(result, tListItemModel);
      },
    );
  });
}

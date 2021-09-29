import 'package:flutter_projects/features/weather/data/models/list_item_model.dart';
import 'package:flutter_projects/features/weather/domain/entities/city.dart';
import 'package:flutter_projects/features/weather/domain/entities/fivedayforecast.dart';
import 'package:flutter_projects/features/weather/domain/entities/list_item.dart';

import 'city_model.dart';

class FiveDayForecastModel extends FiveDayForecastResponse {
  FiveDayForecastModel({
    City? city,
    int? cnt,
    int? cod,
    List<ListItem>? list,
    int? message,
  }) : super(city: city, cnt: cnt, cod: cod, list: list, message: message);

  factory FiveDayForecastModel.fromJson(Map<String, dynamic> json) {
    return FiveDayForecastModel(
      city: json['city'] != null ? CityModel.fromJson(json['city']) : null,
      cnt: json['cnt'],
      cod: json['cod'],
      list: (json['list'] as List)
          .map((e) => ListItemModel.fromJson(e))
          .toList(),
      message: json['message'],
    );
  }
}

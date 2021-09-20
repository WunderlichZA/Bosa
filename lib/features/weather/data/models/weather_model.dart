import 'package:flutter_projects/features/weather/domain/entities/weather.dart';

class WeatherModel extends Weather {
  WeatherModel(
      {final String? description,
      final String? icon,
      final int? id,
      final String? main})
      : super(description: description, icon: icon, id: id, main: main);

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      description: json['description'],
      icon: json['icon'],
      id: json['id'],
      main: json['main'],
    );
  }
}

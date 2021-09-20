import 'package:flutter/foundation.dart';
import 'package:flutter_projects/features/weather/domain/entities/wind.dart';

class WindModel extends Wind{
  WindModel({
    int? deg,
    double? speed,
}) : super(deg: deg, speed: speed);

  factory WindModel.fromJson(Map<String, dynamic> json){
    return WindModel(deg: json['deg'], speed: json['speed']);
  }
}
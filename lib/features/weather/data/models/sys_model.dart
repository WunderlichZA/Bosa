import 'package:flutter_projects/features/weather/domain/entities/sys.dart';

class SysModel extends Sys {

  SysModel({
    int? type,
    int? id,
    double? message,
    String? country,
    int? sunrise,
    int? sunset}) : super(type: type, id: id, country: country, sunrise: sunrise, sunset: sunset);

  factory SysModel.fromJson(Map<String, dynamic> json) {
    return SysModel(type : json['type'],
    id : json['id'],
    country : json['country'],
    sunrise : json['sunrise'],
    sunset : json['sunset']);
  }
}
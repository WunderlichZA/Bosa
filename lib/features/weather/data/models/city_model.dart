import 'package:flutter_projects/features/weather/data/models/coordinates_model.dart';
import 'package:flutter_projects/features/weather/domain/entities/city.dart';
import 'package:flutter_projects/features/weather/domain/entities/coordinates.dart';

class CityModel extends City{
  CityModel({
    Coord? coord,
    String? country,
    int? id,
    String? name,
    int? population,
    int? sunrise,
    int? sunset,
    int? timezone,
}) : super(coord: coord, country: country, id: id, name: name, population: population, sunrise: sunrise, sunset: sunset, timezone: timezone);

  factory CityModel.fromJson(Map<String, dynamic> json){
    return CityModel(
      coord: json['coord'] != null ? CoordModel.fromJson(json['coord']) : null,
      country: json['country'],
      id: json['id'],
      name: json['name'],
      population: json['population'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
      timezone: json['timezone'],
    );
  }
}
import 'package:flutter_projects/features/weather/domain/entities/coordinates.dart';

class CoordModel extends Coord {
  CoordModel({double? lon, double? lat}) : super(lon: lon, lat: lat);

  factory CoordModel.fromJson(Map<String, dynamic> json) {
    return CoordModel(lon: json['lon'], lat: json['lat']);
  }
}

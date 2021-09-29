import 'package:flutter_projects/features/weather/data/models/clouds_model.dart';
import 'package:flutter_projects/features/weather/data/models/coordinates_model.dart';
import 'package:flutter_projects/features/weather/data/models/sys_model.dart';
import 'package:flutter_projects/features/weather/data/models/weather_model.dart';
import 'package:flutter_projects/features/weather/data/models/wind_mode.dart';
import 'package:flutter_projects/features/weather/domain/entities/clouds.dart';
import 'package:flutter_projects/features/weather/domain/entities/coordinates.dart';
import 'package:flutter_projects/features/weather/domain/entities/main.dart';
import 'package:flutter_projects/features/weather/domain/entities/sys.dart';
import 'package:flutter_projects/features/weather/domain/entities/weather.dart';
import 'package:flutter_projects/features/weather/domain/entities/weatherresponse.dart';
import 'package:flutter_projects/features/weather/domain/entities/wind.dart';

import 'main_model.dart';

class WeatherResponseModel extends WeatherResponse{
  WeatherResponseModel({
    String? base,
    Clouds? clouds,
    int? cod,
    Coord? coord,
    int? dt,
    int? id,
    Main? main,
    String? name,
    Sys? sys,
    int? timezone,
    int? visibility,
    List<Weather>? weather,
    Wind? wind,
}) : super(base: base, clouds: clouds, cod: cod, coord: coord, dt: dt, id: id, main: main, name: name, sys: sys, timezone: timezone, visibility: visibility, weather: weather, wind: wind);


  factory WeatherResponseModel.fromJson(Map<String, dynamic> json){
    return WeatherResponseModel(
      base: json['base'],
      clouds: json['clouds'] != null ? CloudsModel.fromJson(json['clouds']) : null,
      cod: json['cod'],
      coord: json['coord'] != null ? CoordModel.fromJson(json['coord']) : null,
      dt: json['dt'],
      main: json['main'] != null ? MainModel.fromJson(json['main']) : null,
      name: json['name'],
      sys: json['sys'] != null ? SysModel.fromJson(json['sys']) : null,
      timezone: json['timezone'],
      visibility: json['visibility'],
      weather: (json['weather'] as List)
        .map((e) => WeatherModel.fromJson(e))
        .toList(),
      wind: json['wind'] != null ? WindModel.fromJson(json['wind']) : null,
    );
  }

}
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_projects/features/weather/domain/entities/clouds.dart';
import 'package:flutter_projects/features/weather/domain/entities/coordinates.dart';
import 'package:flutter_projects/features/weather/domain/entities/main.dart';
import 'package:flutter_projects/features/weather/domain/entities/sys.dart';
import 'package:flutter_projects/features/weather/domain/entities/weather.dart';
import 'package:flutter_projects/features/weather/domain/entities/wind.dart';

class WeatherResponse extends Equatable {
  final String? base;
  final Clouds? clouds;
  final int? cod;
  final Coord? coord;
  final int? dt;
  final int? id;
  final Main? main;
  final String? name;
  final Sys? sys;
  final int? timezone;
  final int? visibility;
  final List<Weather>? weather;
  final Wind? wind;

  WeatherResponse({
    @required this.base,
    @required this.clouds,
    @required this.cod,
    @required this.coord,
    @required this.dt,
    @required this.id,
    @required this.main,
    @required this.name,
    @required this.sys,
    @required this.timezone,
    @required this.visibility,
    @required this.weather,
    @required this.wind,
  });

  @override
  List<Object?> get props => [
        base,
        clouds,
        cod,
        coord,
        dt,
        id,
        main,
        name,
        sys,
        timezone,
        visibility,
        weather,
        wind,
      ];
}

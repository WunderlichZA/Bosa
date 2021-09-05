import 'package:flutter_projects/features/weather/domain/entities/clouds.dart';
import 'package:flutter_projects/features/weather/domain/entities/coordinates.dart';
import 'package:flutter_projects/features/weather/domain/entities/main.dart';
import 'package:flutter_projects/features/weather/domain/entities/sys.dart';
import 'package:flutter_projects/features/weather/domain/entities/weather.dart';
import 'package:flutter_projects/features/weather/domain/entities/wind.dart';

abstract class WeatherResponse {
  final String base;
  final Clouds clouds;
  final int cod;
  final Coord coord;
  final int dt;
  final id;
  final Main main;
  final String name;
  final Sys sys;
  final int timezone;
  final int visibility;
  final List<Weather> weather;
  final Wind wind;

  WeatherResponse(this.base, this.clouds, this.cod, this.coord, this.dt, this.id, this.main, this.name, this.sys, this.timezone, this.visibility, this.weather, this.wind);
}

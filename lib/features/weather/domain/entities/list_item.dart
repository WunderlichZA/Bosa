import 'package:flutter_projects/features/weather/domain/entities/clouds.dart';
import 'package:flutter_projects/features/weather/domain/entities/main.dart';
import 'package:flutter_projects/features/weather/domain/entities/sys.dart';
import 'package:flutter_projects/features/weather/domain/entities/weather.dart';
import 'package:flutter_projects/features/weather/domain/entities/wind.dart';

abstract class ListItem {
  final Clouds clouds;
  final int dt;
  final String dtTxt;
  final Main main;
  final int pop;
  final Sys sys;
  final int visibility;
  final List<Weather> weather;
  final Wind wind;

  ListItem(this.clouds, this.dt, this.dtTxt, this.main, this.pop, this.sys, this.visibility, this.weather, this.wind);
}

import 'package:flutter_projects/features/weather/data/models/sys_model.dart';
import 'package:flutter_projects/features/weather/data/models/weather_model.dart';
import 'package:flutter_projects/features/weather/data/models/wind_mode.dart';
import 'package:flutter_projects/features/weather/domain/entities/clouds.dart';
import 'package:flutter_projects/features/weather/domain/entities/list_item.dart';
import 'package:flutter_projects/features/weather/domain/entities/main.dart';
import 'package:flutter_projects/features/weather/domain/entities/sys.dart';
import 'package:flutter_projects/features/weather/domain/entities/weather.dart';
import 'package:flutter_projects/features/weather/domain/entities/wind.dart';

import 'clouds_model.dart';
import 'main_model.dart';

class ListItemModel extends ListItem {
  ListItemModel({
    Clouds? clouds,
    int? dt,
    String? dtTxt,
    Main? main,
    int? pop,
    Sys? sys,
    int? visibility,
    List<Weather>? weather,
    Wind? wind,
  }) : super(
          clouds: clouds,
          dt: dt,
          dtTxt: dtTxt,
          main: main,
          pop: pop,
          sys: sys,
          visibility: visibility,
          weather: weather,
          wind: wind,
        );

  factory ListItemModel.fromJson(Map<String, dynamic> json){
    return ListItemModel(
      clouds: json['clouds'] != null ? CloudsModel.fromJson(json['clouds']) : null,
      dt: json['dt'],
      dtTxt: json['dt_txt'],
      main: json['main'] != null ? MainModel.fromJson(json['main']) : null,
      pop: json['pop'],
      sys:json['sys'] != null ? SysModel.fromJson(json['sys']) : null,
      visibility: json['visibility'],
      weather: json['weather']
          .map((e) => WeatherModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      wind: json['wind'] != null ? WindModel.fromJson(json['wind']) : null,
    );
  }
}

import 'package:flutter_projects/features/weather/domain/entities/city.dart';
import 'package:flutter_projects/features/weather/domain/entities/list_item.dart';

abstract class FiveDayForecastResponse {
final City city;
final int cnt;
final String cod;
final List<ListItem> list;
final int message;

  FiveDayForecastResponse(this.city, this.cnt, this.cod, this.list, this.message);
}
import 'coordinates.dart';

abstract class City {
  final Coord coord;
  final String country;
  final int id;
  final String name;
  final int population;
  final int sunrise;
  final int sunset;
  final int timezone;

  City(this.coord, this.country, this.id, this.name, this.population, this.sunrise, this.sunset, this.timezone);
}

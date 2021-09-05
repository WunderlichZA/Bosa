import 'package:equatable/equatable.dart';

import 'coordinates.dart';

class City extends Equatable {
  final Coord? coord;
  final String? country;
  final int? id;
  final String? name;
  final int? population;
  final int? sunrise;
  final int? sunset;
  final int? timezone;

  City(
      {this.coord,
      this.country,
      this.id,
      this.name,
      this.population,
      this.sunrise,
      this.sunset,
      this.timezone});

  @override
  List<Object?> get props => [
        coord,
        country,
        id,
        name,
        population,
        sunrise,
        sunset,
        timezone,
      ];
}

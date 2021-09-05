import 'package:equatable/equatable.dart';

class Sys extends Equatable {
  final String? country;
  final int? id;
  final int? sunrise;
  final int? sunset;
  final int? type;

  Sys({this.country, this.id, this.sunrise, this.sunset, this.type});

  @override
  List<Object?> get props => [
        this.country,
        this.id,
        this.sunrise,
        this.sunset,
        this.type,
      ];
}

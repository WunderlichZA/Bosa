import 'package:equatable/equatable.dart';

class Main extends Equatable {
  final double? feelsLike;
  final int? humidity;
  final int? pressure;
  final double? temp;
  final double? tempMax;
  final double? tempMin;

  Main(
      {this.feelsLike,
      this.humidity,
      this.pressure,
      this.temp,
      this.tempMax,
      this.tempMin});

  @override
  List<Object?> get props => [
        feelsLike,
        humidity,
        pressure,
        temp,
        tempMax,
        tempMin,
      ];
}

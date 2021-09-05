import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Wind extends Equatable {
  final int? deg;
  final double? speed;

  Wind({@required this.deg, @required this.speed});

  @override
  List<Object?> get props => [
        deg,
        speed,
      ];
}

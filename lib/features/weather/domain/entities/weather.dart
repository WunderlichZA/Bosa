import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final String? description;
  final String? icon;
  final int? id;
  final String? main;

  Weather({this.description, this.icon, this.id, this.main});

  @override
  List<Object?> get props => [
        description,
        icon,
        id,
        main,
      ];
}

import 'package:equatable/equatable.dart';

class Clouds extends Equatable{
  final int? all;
  Clouds({this.all});

  @override
  List<Object?> get props => [all];
}
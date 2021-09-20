import 'package:flutter_projects/features/weather/domain/entities/clouds.dart';

class CloudsModel extends Clouds {
  CloudsModel({int? all}) : super(all: all);

  factory CloudsModel.fromJson(Map<String, dynamic> json) {
    return CloudsModel(all: json['al']);
  }
}

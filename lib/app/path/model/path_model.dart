import 'package:pocket/pocket.dart';

class PathModel extends IPocketModel {
  @override
  final String id;
  final String name;

  PathModel({
    required this.id,
    required this.name,
  });

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory PathModel.fromJson(Map<String, dynamic> json) => PathModel(
        id: json['id'] as String,
        name: json['name'] as String,
      );
}

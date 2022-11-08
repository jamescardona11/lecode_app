import 'package:pocket/pocket.dart';

class PathContentModel extends IPocketModel {
  @override
  final String id;

  PathContentModel({
    required this.id,
  });

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
    };
  }

  factory PathContentModel.fromJson(Map<String, dynamic> json) =>
      PathContentModel(
        id: json['id'] as String,
      );
}

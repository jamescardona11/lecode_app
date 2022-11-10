import 'package:pocket/pocket.dart';

class DsaExerciseModel extends IPocketModel {
  @override
  final String id;

  DsaExerciseModel({
    required this.id,
  });

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
    };
  }

  factory DsaExerciseModel.fromJson(Map<String, dynamic> json) =>
      DsaExerciseModel(
        id: json['id'] as String,
      );
}

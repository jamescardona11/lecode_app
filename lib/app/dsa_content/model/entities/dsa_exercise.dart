import 'package:json_annotation/json_annotation.dart';
import 'package:pocket/pocket.dart';

part 'dsa_exercise.g.dart';

@JsonSerializable()
class DsaExerciseModel extends IPocketModel {
  DsaExerciseModel({
    required this.id,
    required this.name,
    required this.url,
    required this.difficulty,
    required this.topics,
    required this.groups,
    required this.acceptanceRate,
    required this.myRate,
    required this.notes,
    required this.explanation,
    required this.solved,
    required this.mySolution,
  });

  @override
  @JsonKey(fromJson: _fromJsonId)
  final String id;
  final String name;
  final String url;
  final String difficulty;
  final List<String> topics;
  final List<String> groups;
  final String notes;
  final List<String> explanation;

  @JsonKey(name: 'acceptance_rate')
  final double acceptanceRate;

  @JsonKey(name: 'my_rate')
  final double myRate;

  @JsonKey(defaultValue: false)
  final bool solved;

  @JsonKey(name: 'my_solution', defaultValue: '')
  final String mySolution;

  @override
  Map<String, dynamic> toJson() => _$DsaExerciseModelToJson(this);

  factory DsaExerciseModel.fromJson(Map<String, dynamic> json) =>
      _$DsaExerciseModelFromJson(json);

  static String _fromJsonId(int value) => value.toString();
}

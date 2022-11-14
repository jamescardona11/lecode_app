// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:pocket/pocket.dart';

import 'package:lepath_app/cross/cross.dart';

part 'dsa_exercise_dto.g.dart';

@JsonSerializable()
class DsaExerciseDto extends IPocketModel {
  DsaExerciseDto({
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
    this.completedDate,
  });

  @override
  final String id;
  final String name;
  final String url;
  final String difficulty;
  final List<String> topics;
  final List<String> groups;
  final String notes;
  final List<String> explanation;
  final bool solved;
  final DateTime? completedDate;

  @JsonKey(name: 'acceptance_rate')
  final double acceptanceRate;

  @JsonKey(name: 'my_rate')
  final double myRate;

  @JsonKey(name: 'my_solution', defaultValue: '')
  final String mySolution;

  @override
  Map<String, dynamic> toJson() => _$DsaExerciseDtoToJson(this);

  DsaExerciseModel toEntity() => DsaExerciseModel(
        id: id,
        name: name,
        url: url,
        difficulty: difficulty,
        topics: topics,
        groups: groups,
        acceptanceRate: acceptanceRate,
        myRate: myRate,
        notes: notes,
        explanation: explanation,
        solved: solved,
        mySolution: mySolution,
        completedDate: completedDate,
      );

  factory DsaExerciseDto.fromJson(Map<String, dynamic> json) =>
      _$DsaExerciseDtoFromJson(json);

  DsaExerciseDto copyWith({
    String? id,
    String? name,
    String? url,
    String? difficulty,
    List<String>? topics,
    List<String>? groups,
    String? notes,
    List<String>? explanation,
    bool? solved,
    DateTime? completedDate,
    double? acceptanceRate,
    double? myRate,
    String? mySolution,
  }) {
    return DsaExerciseDto(
      id: id ?? this.id,
      name: name ?? this.name,
      url: url ?? this.url,
      difficulty: difficulty ?? this.difficulty,
      topics: topics ?? this.topics,
      groups: groups ?? this.groups,
      notes: notes ?? this.notes,
      explanation: explanation ?? this.explanation,
      solved: solved ?? this.solved,
      completedDate: completedDate,
      acceptanceRate: acceptanceRate ?? this.acceptanceRate,
      myRate: myRate ?? this.myRate,
      mySolution: mySolution ?? this.mySolution,
    );
  }

  @override
  String toString() {
    return 'DsaExerciseDto(id: $id, name: $name, url: $url, difficulty: $difficulty, topics: $topics, groups: $groups, notes: $notes, explanation: $explanation, solved: $solved, completedDate: $completedDate, acceptanceRate: $acceptanceRate, myRate: $myRate, mySolution: $mySolution)';
  }
}

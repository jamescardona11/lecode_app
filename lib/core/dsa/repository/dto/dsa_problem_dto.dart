// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:lepath_app/core/core.dart';
import 'package:pocket/pocket.dart';

part 'dsa_problem_dto.g.dart';

@JsonSerializable()
class DsaProblemDto extends IPocketModel {
  DsaProblemDto({
    required this.id,
    required this.name,
    required this.url,
    required this.difficulty,
    required this.topics,
    required this.routes,
    required this.acceptanceRate,
    required this.myRate,
    required this.notes,
    required this.explanation,
    required this.solved,
    required this.mySolution,
    this.solvedDate,
  });

  @override
  final String id;
  final String name;
  final String url;
  final String difficulty;
  final List<String> topics;
  final List<String> routes;
  final String notes;
  final List<String> explanation;
  final bool solved;
  // todo change this for solvedDate
  final DateTime? solvedDate;

  @JsonKey(name: 'acceptance_rate')
  final double acceptanceRate;

  @JsonKey(name: 'my_rate')
  final double myRate;

  @JsonKey(name: 'my_solution', defaultValue: '')
  final String mySolution;

  @override
  Map<String, dynamic> toJson() => _$DsaProblemDtoToJson(this);

  DsaProblemModel toEntity() => DsaProblemModel(
        id: id,
        name: name,
        url: url,
        difficulty: difficulty,
        topics: topics,
        routes: routes.map((e) => GroupType.fromString(e)).toList(),
        acceptanceRate: acceptanceRate,
        myRate: myRate,
        notes: notes,
        explanation: explanation,
        solved: solved,
        mySolution: mySolution,
        solvedDate: solvedDate,
      );

  factory DsaProblemDto.fromJson(Map<String, dynamic> json) =>
      _$DsaProblemDtoFromJson(json);

  static DsaProblemModel toEntityByJson(Map<String, dynamic> json) =>
      DsaProblemDto.fromJson(json).toEntity();

  DsaProblemDto copyWith({
    String? id,
    String? name,
    String? url,
    String? difficulty,
    List<String>? topics,
    List<String>? routes,
    String? notes,
    List<String>? explanation,
    bool? solved,
    DateTime? solvedDate,
    double? acceptanceRate,
    double? myRate,
    String? mySolution,
  }) {
    return DsaProblemDto(
      id: id ?? this.id,
      name: name ?? this.name,
      url: url ?? this.url,
      difficulty: difficulty ?? this.difficulty,
      topics: topics ?? this.topics,
      routes: routes ?? this.routes,
      notes: notes ?? this.notes,
      explanation: explanation ?? this.explanation,
      solved: solved ?? this.solved,
      solvedDate: solvedDate,
      acceptanceRate: acceptanceRate ?? this.acceptanceRate,
      myRate: myRate ?? this.myRate,
      mySolution: mySolution ?? this.mySolution,
    );
  }

  @override
  String toString() {
    return 'DsaProblemDto(id: $id, name: $name, url: $url, difficulty: $difficulty, topics: $topics, routes: $routes, notes: $notes, explanation: $explanation, solved: $solved, solvedDate: $solvedDate, acceptanceRate: $acceptanceRate, myRate: $myRate, mySolution: $mySolution)';
  }
}

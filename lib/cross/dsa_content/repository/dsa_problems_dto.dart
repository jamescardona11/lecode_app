import 'package:json_annotation/json_annotation.dart';
import 'package:pocket/pocket.dart';
import 'dsa_exercise_dto.dart';

part 'dsa_problems_dto.g.dart';

@JsonSerializable()
class DsaProblemsDto extends IPocketModel {
  DsaProblemsDto({
    required this.problems,
    required this.blind75,
    required this.grind75,
    required this.leetCode60,
    required this.topInterviewQuestions,
    required this.topLikedQuestions,
    required this.curatedAlgo170,
  });

  @override
  String get id => 'dsaProblems';

  @JsonKey(name: 'entries', defaultValue: [])
  final List<DsaExerciseDto> problems;

  @JsonKey(name: 'blind_75', defaultValue: [])
  final List<int> blind75;

  @JsonKey(name: 'grind_75', defaultValue: [])
  final List<int> grind75;

  @JsonKey(name: 'leet_code_60', defaultValue: [])
  final List<int> leetCode60;

  @JsonKey(name: 'top_interview_questions', defaultValue: [])
  final List<int> topInterviewQuestions;

  @JsonKey(name: 'top_liked_questions', defaultValue: [])
  final List<int> topLikedQuestions;

  @JsonKey(name: 'curated_algo_170', defaultValue: [])
  final List<int> curatedAlgo170;

  @override
  Map<String, dynamic> toJson() => _$DsaProblemsDtoToJson(this);

  factory DsaProblemsDto.fromJson(Map<String, dynamic> json) =>
      _$DsaProblemsDtoFromJson(json);
}

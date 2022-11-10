import 'package:json_annotation/json_annotation.dart';
import 'package:lepath_app/app/dsa_content/model/entities/dsa_exercise.dart';
import 'package:pocket/pocket.dart';

part 'dsa_problems.g.dart';

@JsonSerializable()
class DsaProblemsModel extends IPocketModel {
  DsaProblemsModel({
    required this.problems,
    required this.blind75,
    required this.grind75,
    required this.leetCode60,
    required this.topInterviewQuestions,
    required this.topLikedQuestions,
    required this.curatedAlgo170,
  });

  @override
  String get id => 'dsaProblemsModels';

  @JsonKey(name: 'entries', defaultValue: [])
  final List<DsaExerciseModel> problems;

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
  Map<String, dynamic> toJson() => _$DsaProblemsModelToJson(this);

  factory DsaProblemsModel.fromJson(Map<String, dynamic> json) =>
      _$DsaProblemsModelFromJson(json);
}

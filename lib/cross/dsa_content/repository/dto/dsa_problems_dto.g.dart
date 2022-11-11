// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dsa_problems_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DsaProblemsDto _$DsaProblemsDtoFromJson(Map<String, dynamic> json) =>
    DsaProblemsDto(
      problems: (json['entries'] as List<dynamic>?)
              ?.map((e) => DsaExerciseDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      blind75:
          (json['blind_75'] as List<dynamic>?)?.map((e) => e as int).toList() ??
              [],
      grind75:
          (json['grind_75'] as List<dynamic>?)?.map((e) => e as int).toList() ??
              [],
      leetCode60: (json['leet_code_60'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          [],
      topInterviewQuestions: (json['top_interview_questions'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          [],
      topLikedQuestions: (json['top_liked_questions'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          [],
      curatedAlgo170: (json['curated_algo_170'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          [],
    );

Map<String, dynamic> _$DsaProblemsDtoToJson(DsaProblemsDto instance) =>
    <String, dynamic>{
      'entries': instance.problems,
      'blind_75': instance.blind75,
      'grind_75': instance.grind75,
      'leet_code_60': instance.leetCode60,
      'top_interview_questions': instance.topInterviewQuestions,
      'top_liked_questions': instance.topLikedQuestions,
      'curated_algo_170': instance.curatedAlgo170,
    };

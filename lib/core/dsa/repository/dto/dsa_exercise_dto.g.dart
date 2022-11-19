// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dsa_exercise_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DsaExerciseDto _$DsaExerciseDtoFromJson(Map<String, dynamic> json) =>
    DsaExerciseDto(
      id: json['id'] as String,
      name: json['name'] as String,
      url: json['url'] as String,
      difficulty: json['difficulty'] as String,
      topics:
          (json['topics'] as List<dynamic>).map((e) => e as String).toList(),
      groups:
          (json['groups'] as List<dynamic>).map((e) => e as String).toList(),
      acceptanceRate: (json['acceptance_rate'] as num).toDouble(),
      myRate: (json['my_rate'] as num).toDouble(),
      notes: json['notes'] as String,
      explanation: (json['explanation'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      solved: json['solved'] as bool,
      mySolution: json['my_solution'] as String? ?? '',
      solvedDate: json['solvedDate'] == null
          ? null
          : DateTime.parse(json['solvedDate'] as String),
    );

Map<String, dynamic> _$DsaExerciseDtoToJson(DsaExerciseDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
      'difficulty': instance.difficulty,
      'topics': instance.topics,
      'groups': instance.groups,
      'notes': instance.notes,
      'explanation': instance.explanation,
      'solved': instance.solved,
      'solvedDate': instance.solvedDate?.toIso8601String(),
      'acceptance_rate': instance.acceptanceRate,
      'my_rate': instance.myRate,
      'my_solution': instance.mySolution,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dsa_exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DsaExerciseModel _$DsaExerciseModelFromJson(Map<String, dynamic> json) =>
    DsaExerciseModel(
      id: DsaExerciseModel._fromJsonId(json['id'] as int),
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
      solved: json['solved'] as bool? ?? false,
      mySolution: json['my_solution'] as String? ?? '',
    );

Map<String, dynamic> _$DsaExerciseModelToJson(DsaExerciseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
      'difficulty': instance.difficulty,
      'topics': instance.topics,
      'groups': instance.groups,
      'notes': instance.notes,
      'explanation': instance.explanation,
      'acceptance_rate': instance.acceptanceRate,
      'my_rate': instance.myRate,
      'solved': instance.solved,
      'my_solution': instance.mySolution,
    };

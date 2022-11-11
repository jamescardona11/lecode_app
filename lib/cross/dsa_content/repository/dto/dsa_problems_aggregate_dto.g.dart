// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dsa_problems_aggregate_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DsaProblemsAggregateDto _$DsaProblemsAggregateDtoFromJson(
        Map<String, dynamic> json) =>
    DsaProblemsAggregateDto(
      dsaExerciseDto: (json['dsaExerciseDto'] as List<dynamic>)
          .map((e) => DsaExerciseDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      dsaProblemsDto: DsaProblemsDto.fromJson(
          json['dsaProblemsDto'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DsaProblemsAggregateDtoToJson(
        DsaProblemsAggregateDto instance) =>
    <String, dynamic>{
      'dsaExerciseDto': instance.dsaExerciseDto,
      'dsaProblemsDto': instance.dsaProblemsDto,
    };

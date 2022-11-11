// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dsa_problems_aggregate_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DsaProblemsAggregateDto _$DsaProblemsAggregateDtoFromJson(
        Map<String, dynamic> json) =>
    DsaProblemsAggregateDto(
      dsaExerciseDto: DsaExerciseDto.fromJson(
          json['dsaExerciseDto'] as Map<String, dynamic>),
      dsaProblemsDto: DsaExerciseDto.fromJson(
          json['dsaProblemsDto'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DsaProblemsAggregateDtoToJson(
        DsaProblemsAggregateDto instance) =>
    <String, dynamic>{
      'dsaExerciseDto': instance.dsaExerciseDto,
      'dsaProblemsDto': instance.dsaProblemsDto,
    };

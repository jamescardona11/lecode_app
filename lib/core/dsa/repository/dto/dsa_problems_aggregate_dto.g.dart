// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dsa_problems_aggregate_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DsaProblemsAggregateDto _$DsaProblemsAggregateDtoFromJson(
        Map<String, dynamic> json) =>
    DsaProblemsAggregateDto(
      dsaExerciseDto: (json['entries'] as List<dynamic>)
          .map((e) => DsaExerciseDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      groups: (json['groups'] as List<dynamic>)
          .map((e) => DsaGroupsDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DsaProblemsAggregateDtoToJson(
        DsaProblemsAggregateDto instance) =>
    <String, dynamic>{
      'entries': instance.dsaExerciseDto,
      'groups': instance.groups,
    };

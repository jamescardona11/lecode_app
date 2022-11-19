// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dsa_content_problems_aggregate_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DsaContentProblemsAggregateDto _$DsaContentProblemsAggregateDtoFromJson(
        Map<String, dynamic> json) =>
    DsaContentProblemsAggregateDto(
      dsaProblemDto: (json['entries'] as List<dynamic>)
          .map((e) => DsaProblemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      groups: (json['groups'] as List<dynamic>)
          .map((e) => DsaGroupsDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DsaContentProblemsAggregateDtoToJson(
        DsaContentProblemsAggregateDto instance) =>
    <String, dynamic>{
      'entries': instance.dsaProblemDto,
      'groups': instance.groups,
    };

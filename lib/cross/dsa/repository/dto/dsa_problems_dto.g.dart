// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dsa_problems_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DsaProblemsDto _$DsaProblemsDtoFromJson(Map<String, dynamic> json) =>
    DsaProblemsDto(
      id: json['id'] as String,
      description: json['description'] as String,
      entries:
          (json['entries'] as List<dynamic>?)?.map((e) => e as int).toList() ??
              [],
    );

Map<String, dynamic> _$DsaProblemsDtoToJson(DsaProblemsDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'entries': instance.entries,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dsa_groups_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DsaGroupsDto _$DsaProblemsDtoFromJson(Map<String, dynamic> json) =>
    DsaGroupsDto(
      id: json['id'] as String,
      description: json['description'] as String,
      entries:
          (json['entries'] as List<dynamic>?)?.map((e) => e as int).toList() ??
              [],
    );

Map<String, dynamic> _$DsaProblemsDtoToJson(DsaGroupsDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'entries': instance.entries,
    };

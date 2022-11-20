// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dsa_routes_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DsaRoutesDto _$DsaRoutesDtoFromJson(Map<String, dynamic> json) => DsaRoutesDto(
      id: json['id'] as String,
      description: json['description'] as String,
      entries:
          (json['entries'] as List<dynamic>?)?.map((e) => e as int).toList() ??
              [],
    );

Map<String, dynamic> _$DsaRoutesDtoToJson(DsaRoutesDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'entries': instance.entries,
    };

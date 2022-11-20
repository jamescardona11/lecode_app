import 'package:json_annotation/json_annotation.dart';
import 'package:lecode_app/core/core.dart';
import 'package:pocket/pocket.dart';

part 'dsa_routes_dto.g.dart';

@JsonSerializable()
class DsaRoutesDto extends IPocketModel {
  DsaRoutesDto({
    required this.id,
    required this.description,
    required this.entries,
  });

  @override
  final String id;

  final String description;

  @JsonKey(defaultValue: [])
  final List<int> entries;

  @override
  Map<String, dynamic> toJson() => _$DsaRoutesDtoToJson(this);

  DsaRouteModel toEntity() => DsaRouteModel(
        id: id,
        description: description,
        setProblems: entries,
      );

  static DsaRouteModel toEntityByJson(Map<String, dynamic> json) =>
      DsaRoutesDto.fromJson(json).toEntity();

  factory DsaRoutesDto.fromJson(Map<String, dynamic> json) =>
      _$DsaRoutesDtoFromJson(json);
}

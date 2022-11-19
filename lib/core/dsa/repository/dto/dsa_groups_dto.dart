import 'package:json_annotation/json_annotation.dart';
import 'package:lepath_app/core/core.dart';
import 'package:pocket/pocket.dart';

part 'dsa_groups_dto.g.dart';

@JsonSerializable()
class DsaGroupsDto extends IPocketModel {
  DsaGroupsDto({
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
  Map<String, dynamic> toJson() => _$DsaGroupsDtoToJson(this);

  DsaGroupsModel toEntity() => DsaGroupsModel(
        id: id,
        description: description,
        setProblems: entries,
      );

  static DsaGroupsModel toEntityByJson(Map<String, dynamic> json) =>
      DsaGroupsDto.fromJson(json).toEntity();

  factory DsaGroupsDto.fromJson(Map<String, dynamic> json) =>
      _$DsaGroupsDtoFromJson(json);
}

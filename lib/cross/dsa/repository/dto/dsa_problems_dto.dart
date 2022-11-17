import 'package:json_annotation/json_annotation.dart';
import 'package:pocket/pocket.dart';

part 'dsa_problems_dto.g.dart';

@JsonSerializable()
class DsaProblemsDto extends IPocketModel {
  DsaProblemsDto({
    required this.id,
    required this.description,
    required this.entries,
  });

  // factory DsaProblemsDto.def() => DsaProblemsDto(
  //       id: '',
  //       description: '',
  //       entries: [],
  //     );

  @override
  final String id;

  final String description;

  @JsonKey(defaultValue: [])
  final List<int> entries;

  @override
  Map<String, dynamic> toJson() => _$DsaProblemsDtoToJson(this);

  factory DsaProblemsDto.fromJson(Map<String, dynamic> json) =>
      _$DsaProblemsDtoFromJson(json);
}

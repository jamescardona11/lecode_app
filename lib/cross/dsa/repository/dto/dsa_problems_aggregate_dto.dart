import 'package:json_annotation/json_annotation.dart';
import 'package:pocket/pocket.dart';
import 'dsa_exercise_dto.dart';
import 'dsa_problems_dto.dart';

part 'dsa_problems_aggregate_dto.g.dart';

@JsonSerializable()
class DsaProblemsAggregateDto extends IPocketModel {
  DsaProblemsAggregateDto({
    required this.dsaExerciseDto,
    required this.groups,
  });

  factory DsaProblemsAggregateDto.def() => DsaProblemsAggregateDto(
        dsaExerciseDto: [],
        groups: [],
      );

  @override
  String get id => 'dsaProblemsAggregate';

  @JsonKey(name: 'entries')
  final List<DsaExerciseDto> dsaExerciseDto;

  final List<DsaProblemsDto> groups;

  @override
  Map<String, dynamic> toJson() => _$DsaProblemsAggregateDtoToJson(this);

  factory DsaProblemsAggregateDto.fromJson(Map<String, dynamic> json) =>
      _$DsaProblemsAggregateDtoFromJson(json);
  // DsaProblemsAggregateDto(
  //   dsaExerciseDto: (json['entries'] as List<dynamic>)
  //       .map((e) => DsaExerciseDto.fromJson(e as Map<String, dynamic>))
  //       .toList(),
  //   dsaProblemsDto: DsaProblemsDto.fromJson(json),
  // );
}

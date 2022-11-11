import 'package:json_annotation/json_annotation.dart';

import 'package:pocket/pocket.dart';
import 'dsa_exercise_dto.dart';
import 'dsa_problems_dto.dart';

part 'dsa_problems_aggregate_dto.g.dart';

@JsonSerializable()
class DsaProblemsAggregateDto extends IPocketModel {
  DsaProblemsAggregateDto({
    required this.dsaExerciseDto,
    required this.dsaProblemsDto,
  });

  @override
  String get id => 'dsaProblemsAggregate';

  List<DsaExerciseDto> dsaExerciseDto;
  DsaProblemsDto dsaProblemsDto;

  @override
  Map<String, dynamic> toJson() => _$DsaProblemsAggregateDtoToJson(this);

  factory DsaProblemsAggregateDto.fromJson(Map<String, dynamic> json) =>
      _$DsaProblemsAggregateDtoFromJson(json);
}

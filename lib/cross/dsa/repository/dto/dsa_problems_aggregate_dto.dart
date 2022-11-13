import 'package:pocket/pocket.dart';
import 'dsa_exercise_dto.dart';
import 'dsa_problems_dto.dart';

class DsaProblemsAggregateDto extends IPocketModel {
  DsaProblemsAggregateDto({
    required this.dsaExerciseDto,
    required this.dsaProblemsDto,
  });

  factory DsaProblemsAggregateDto.def() => DsaProblemsAggregateDto(
        dsaExerciseDto: [],
        dsaProblemsDto: DsaProblemsDto.def(),
      );

  @override
  String get id => 'dsaProblemsAggregate';

  List<DsaExerciseDto> dsaExerciseDto;

  DsaProblemsDto dsaProblemsDto;

  @override
  Map<String, dynamic> toJson() => {
        'entries': dsaExerciseDto,
      }..addAll(dsaProblemsDto.toJson());

  factory DsaProblemsAggregateDto.fromJson(Map<String, dynamic> json) =>
      DsaProblemsAggregateDto(
        dsaExerciseDto: (json['entries'] as List<dynamic>)
            .map((e) => DsaExerciseDto.fromJson(e as Map<String, dynamic>))
            .toList(),
        dsaProblemsDto: DsaProblemsDto.fromJson(json),
      );
}

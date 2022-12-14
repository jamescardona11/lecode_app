import 'package:json_annotation/json_annotation.dart';
import 'package:pocket/pocket.dart';

import 'dsa_problem_dto.dart';
import 'dsa_routes_dto.dart';

part 'dsa_content_problems_aggregate_dto.g.dart';

@JsonSerializable()
class DsaContentProblemsAggregateDto extends IPocketModel {
  DsaContentProblemsAggregateDto({
    required this.dsaProblemDto,
    required this.routes,
  });

  factory DsaContentProblemsAggregateDto.def() =>
      DsaContentProblemsAggregateDto(
        dsaProblemDto: [],
        routes: [],
      );

  @override
  String get id => 'dsaProblemsAggregate';

  @JsonKey(name: 'entries')
  final List<DsaProblemDto> dsaProblemDto;

  final List<DsaRoutesDto> routes;

  @override
  Map<String, dynamic> toJson() => _$DsaContentProblemsAggregateDtoToJson(this);

  factory DsaContentProblemsAggregateDto.fromJson(Map<String, dynamic> json) =>
      _$DsaContentProblemsAggregateDtoFromJson(json);
}

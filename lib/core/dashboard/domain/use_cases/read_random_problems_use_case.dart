import 'dart:math';

import 'package:lepath_app/base/base.dart';
import 'package:lepath_app/core/core.dart';

class ReadRandomProblemsData extends CommandData {}

class ReadRandomProblemsUseCase
    implements StreamQueryUseCase<DsaProblemModel?, ReadRandomProblemsData> {
  const ReadRandomProblemsUseCase(
    this.crossDsaFacade,
    this.repository,
  );

  final DsaRepository repository;
  final CrossDsaFacade crossDsaFacade;

  @override
  Stream<DsaProblemModel?> call(ReadRandomProblemsData data) {
    return crossDsaFacade.readAllDsaProblems
        .call(const ReadAllDsaProblemsData())
        .map((all) {
      final noSolved = all.where((element) => element.solvedDate == null);
      if (noSolved.isEmpty) return null;

      final randomIndex = Random().nextInt(noSolved.length);
      return noSolved.elementAt(randomIndex);
    });
  }
}

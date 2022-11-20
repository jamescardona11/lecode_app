import 'dart:async';

import 'package:lepath_app/base/base.dart';
import 'package:lepath_app/core/core.dart';

class ReadAllSolvedDsaProblemsData implements CommandData {
  const ReadAllSolvedDsaProblemsData();
}

class ReadAllSolvedDsaProblems
    implements
        StreamQueryUseCase<Iterable<DsaProblemModel>,
            ReadAllSolvedDsaProblemsData> {
  ReadAllSolvedDsaProblems(
    this.readAllDsaProblems,
  );

  final StreamQueryUseCase<Iterable<DsaProblemModel>, ReadAllDsaProblemsData>
      readAllDsaProblems;

  // review this don't sent iterable
  @override
  Stream<Iterable<DsaProblemModel>> call(ReadAllSolvedDsaProblemsData data) {
    return readAllDsaProblems
        .call(const ReadAllDsaProblemsData())
        .map((items) => items.where((element) => element.isSolved));
  }
}

import 'package:lepath_app/base/base.dart';
import 'package:lepath_app/core/core.dart';

class CrossDsaFacade {
  CrossDsaFacade(
    this.readAllDsaProblems,
  );

  final StreamQueryUseCase<Iterable<DsaProblemModel>, ReadAllDsaProblemsData>
      readAllDsaProblems;
}

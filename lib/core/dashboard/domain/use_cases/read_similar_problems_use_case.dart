import 'package:lecode_app/base/base.dart';
import 'package:lecode_app/core/core.dart';
import 'package:lecode_app/utils/utils.dart';

class ReadSimilarProblemsData extends CommandData {}

class ReadSimilarProblemsUseCase
    implements
        StreamQueryUseCase<Iterable<DsaProblemModel>, ReadSimilarProblemsData> {
  ReadSimilarProblemsUseCase(
    this.readAllDsaProblems,
    this.repository,
  );

  final DsaRepository repository;
  final StreamQueryUseCase<Iterable<DsaProblemModel>, ReadAllDsaProblemsData>
      readAllDsaProblems;

  @override
  Stream<Iterable<DsaProblemModel>> call(ReadSimilarProblemsData data) =>
      readAllDsaProblems
          .call(const ReadAllDsaProblemsData())
          .map((items) => items.splitMatch(
                (element) => element.isSolved,
              ))
          .map(
        (listMatch) {
          if (listMatch.matched.isEmpty || listMatch.unmatched.isEmpty) {
            return <DsaProblemModel>[];
          }
          listMatch.matched
              .sort((a, b) => b.solvedDate!.compareTo(a.solvedDate!));

          Iterable<DsaProblemModel> newList = [];

          for (var element in listMatch.matched) {
            newList = _getSimilar(element, listMatch.unmatched);
            if (newList.length > 3) break;
          }

          return newList.take(10);
        },
      );

  Iterable<DsaProblemModel> _getSimilar(
    DsaProblemModel solved,
    Iterable<DsaProblemModel> list,
  ) {
    return list.where(
      (element) =>
          element.difficulty == solved.difficulty ||
          (element.acceptanceRate - solved.acceptanceRate).abs() < 10 ||
          element.topics.any((element) => solved.topics.contains(element)),
    );
  }
}

import 'dart:math';

import 'package:lepath_app/base/base.dart';
import 'package:lepath_app/core/core.dart';
import 'package:pocket/pocket.dart';

class DsaRepository with PocketMultiDataSourceMixin<IPocketAdapter> {
  DsaRepository(
    this.adapterDb,
  );

  @override
  final IPocketAdapter adapterDb;

  Stream<Iterable<DsaProblemModel>> get readAllDsaProblemsStream =>
      readWhere<DsaProblemModel>(
        tableDsaProblem,
        DsaProblemDto.toEntityByJson,
      );

  Future<void> markAsComplete(String id) async {
    final dto = await adapterDb.read(table: tableDsaProblem, id: id).first;
    if (dto == null) return;

    DsaProblemDto problem = DsaProblemDto.fromJson(dto.data);
    final r = randomDate();

    final dateFormat = DateTime(r.year, r.month, r.day);

    problem = problem.copyWith(
        solvedDate: problem.solvedDate == null ? dateFormat : null);

    await adapterDb.update(
        table: tableDsaProblem, item: AdapterDto(id, problem.toJson()));
  }

  DateTime randomDate() {
    final i = Random(DateTime.now().millisecondsSinceEpoch).nextInt(1000);
    final m = Random(DateTime.now().millisecondsSinceEpoch).nextInt(12) + 1;
    final d = Random(DateTime.now().millisecondsSinceEpoch).nextInt(30) + 1;

    if (i < 50) {
      return DateTime(2022, 11, 12);
    } else if (i < 150) {
      return DateTime(2022, 11, 11);
    } else if (i < 200) {
      return DateTime(2022, 11, 10);
    } else if (i < 250) {
      return DateTime(2022, 11, 9);
    } else if (i < 350) {
      return DateTime(2022, 11, 8);
    } else if (i < 450) {
      return DateTime(2022, 11, 7);
    } else if (i < 550) {
      return DateTime(2022, 11, 6);
    } else if (i < 650) {
      return DateTime(2022, 11, 1);
    } else if (i < 750) {
      return DateTime(2022, 10, 30);
    } else if (i < 900) {
      return DateTime(2022, 10, 16);
    }

    return DateTime(2022, m, d);
  }
}

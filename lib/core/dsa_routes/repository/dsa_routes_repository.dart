import 'package:lecode_app/base/base.dart';
import 'package:lecode_app/core/core.dart';
import 'package:pocket/pocket.dart';

class DsaRoutesRepository with PocketMultiDataSourceMixin<IPocketAdapter> {
  /// default constructor
  const DsaRoutesRepository(this.adapterDb);

  @override
  final IPocketAdapter adapterDb;

  Stream<Iterable<DsaRouteModel>> get readAllRoutesModelStream =>
      readWhere<DsaRouteModel>(
        tableDsaGroupProblems,
        DsaRoutesDto.toEntityByJson,
      );
}

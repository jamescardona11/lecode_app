import 'package:lepath_app/base/base.dart';
import 'package:lepath_app/core/core.dart';

import 'package:pocket/pocket.dart';

class DsaContentRepository with PocketMultiDataSourceMixin<IPocketAdapter> {
  /// default constructor
  const DsaContentRepository(this.adapterDb);

  @override
  final IPocketAdapter adapterDb;

  Stream<Iterable<DsaGroupsModel>> get readAllGroupsModelStream =>
      readWhere<DsaGroupsModel>(
        tableDsaProblems,
        DsaGroupsDto.toEntityByJson,
      );
}

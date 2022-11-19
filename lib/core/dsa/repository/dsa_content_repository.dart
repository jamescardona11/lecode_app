// import 'package:lepath_app/core/core.dart';
// import 'package:lepath_app/cross/dsa/domain/domain.dart';
// import 'package:lepath_app/cross/dsa/domain/entities/dsa_groups.dart';
// import 'package:pocket/pocket.dart';

// import 'dto/dsa_groups_dto.dart';

// class DsaContentRepository with PocketMultiDataSourceMixin<IPocketAdapter> {
//   /// default constructor
//   const DsaContentRepository(this.adapterDb);

//   @override
//   final IPocketAdapter adapterDb;

//   Stream<Iterable<DsaGroupsModel>> get readAllGroupsModelStream =>
//       readWhere<DsaGroupsModel>(
//         tableDsaProblems,
//         DsaGroupsDto.toEntityByJson,
//       );
// }

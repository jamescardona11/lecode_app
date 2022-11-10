import 'package:lepath_app/app/path_content/model/entities/path_content.dart';
import 'package:pocket/pocket.dart';

class PathContentDatabase
    with PocketDatabase<IPocketAdapter, PathContentModel> {
  PathContentDatabase(this.adapterDb);

  @override
  final IPocketAdapter adapterDb;

  @override
  PathContentModel fromJson(Map<String, dynamic> json) =>
      PathContentModel.fromJson(json);

  @override
  String get tableName => 'path_content_table';
}

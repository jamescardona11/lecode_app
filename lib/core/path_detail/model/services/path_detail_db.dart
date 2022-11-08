import 'package:lepath_app/core/path_detail/model/entities/path_detail.dart';
import 'package:pocket/pocket.dart';

class MoodDatabase with PocketDatabase<IPocketAdapter, PathDetailModel> {
  @override
  IPocketAdapter get adapterDb => SembastPocket.instance();

  @override
  PathDetailModel fromJson(Map<String, dynamic> json) =>
      PathDetailModel.fromJson(json);

  @override
  String get tableName => 'path_detail_table';
}

class UpdateInfoModel {
  UpdateInfoModel(
    this.lastUpdate,
    this.forceUpdate,
  );

  final DateTime lastUpdate;
  final bool forceUpdate;

  factory UpdateInfoModel.fromJson(Map<String, dynamic> map) {
    return UpdateInfoModel(
      DateTime.parse(map['last_update'] as String),
      map['force'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'last_update': lastUpdate.millisecondsSinceEpoch,
      'force': forceUpdate,
    };
  }
}

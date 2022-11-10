class UpdateInfoModel {
  UpdateInfoModel(
    this.lastUpdate,
    this.forceUpdate,
  );

  final DateTime lastUpdate;
  final bool forceUpdate;

  factory UpdateInfoModel.fromJson(Map<String, dynamic> map) {
    return UpdateInfoModel(
      DateTime.fromMillisecondsSinceEpoch(map['lastUpdate'] as int),
      map['forceUpdate'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'lastUpdate': lastUpdate.millisecondsSinceEpoch,
      'forceUpdate': forceUpdate,
    };
  }
}

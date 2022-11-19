class DsaGroupsModel {
  DsaGroupsModel({
    required this.id,
    this.setProblems = const [],
    this.description = '',
  });

  final String id;
  final String description;
  final List<int> setProblems;
}

class DsaExerciseModel {
  DsaExerciseModel({
    required this.id,
    required this.name,
    required this.url,
    required this.difficulty,
    required this.topics,
    required this.groups,
    required this.acceptanceRate,
    required this.myRate,
    required this.notes,
    required this.explanation,
    required this.solved,
    required this.mySolution,
    this.completedDate,
  });

  final String id;
  final String name;
  final String url;
  final String difficulty;
  final List<String> topics;
  final List<String> groups;
  final String notes;
  final List<String> explanation;
  final double acceptanceRate;
  final double myRate;
  final bool solved;
  final String mySolution;
  final DateTime? completedDate;
}

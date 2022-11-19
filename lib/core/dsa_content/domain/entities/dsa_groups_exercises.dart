import 'package:lepath_app/core/core.dart';

class DsaGroupsExercisesModel {
  DsaGroupsExercisesModel({
    required this.id,
    this.setProblems = const [],
    this.description = '',
    this.topics = const {},
    this.averageRate = 0.0,
    this.averageAcceptance = 0.0,
  });

  final String id;
  final String description;
  final Iterable<DsaExerciseModel> setProblems;
  final Set<String> topics;
  final double averageRate;
  final double averageAcceptance;
}

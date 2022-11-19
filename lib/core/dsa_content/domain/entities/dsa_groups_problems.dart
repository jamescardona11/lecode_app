import 'package:flutter/foundation.dart';
import 'package:lepath_app/core/core.dart';

class DsaGroupsProblemsModel {
  DsaGroupsProblemsModel({
    required this.id,
    this.setProblems = const [],
    this.description = '',
    this.topics = const {},
    this.averageRate = 0.0,
    this.averageAcceptance = 0.0,
  });

  final String id;
  final String description;
  final Iterable<DsaProblemModel> setProblems;
  final Set<String> topics;
  final double averageRate;
  final double averageAcceptance;

  int get total => setProblems.length;
  int get solved => setProblems.where((element) => element.isSolved).length;

  @override
  bool operator ==(covariant DsaGroupsProblemsModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.description == description &&
        other.setProblems == setProblems &&
        setEquals(other.topics, topics) &&
        other.averageRate == averageRate &&
        other.averageAcceptance == averageAcceptance;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        description.hashCode ^
        setProblems.hashCode ^
        topics.hashCode ^
        averageRate.hashCode ^
        averageAcceptance.hashCode;
  }

  @override
  String toString() {
    return 'DsaGroupsProblemsModel(id: $id, description: $description, setProblems: $setProblems, topics: $topics, averageRate: $averageRate, averageAcceptance: $averageAcceptance)';
  }
}

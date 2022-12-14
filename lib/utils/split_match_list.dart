class ListMatch<T> {
  List<T> matched = <T>[];
  List<T> unmatched = <T>[];

  List<T> get joinList => matched + unmatched;

  ListMatch();

  factory ListMatch.from(List<T> m, List<T> u) => ListMatch()
    ..matched = m
    ..unmatched = u;
}

extension SplitMatch<T> on Iterable<T> {
  ListMatch<T> splitMatch(bool Function(T element) matchFunction) {
    final listMatch = ListMatch<T>();

    for (final element in this) {
      if (matchFunction(element)) {
        listMatch.matched.add(element);
      } else {
        listMatch.unmatched.add(element);
      }
    }

    return listMatch;
  }
}

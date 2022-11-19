enum GroupType {
  blind75('Blind75'),
  grind75('Grind75'),
  topLiked('Top Liked'),
  leetCode60('LeetCode60'),
  topInterview('Top Interview'),
  algo('Curated Algo'),
  others('Others');

  final String value;

  const GroupType(this.value);

  static GroupType fromString(String value) =>
      {
        'Blind75': GroupType.blind75,
        'Grind75': GroupType.grind75,
        'Top Liked': GroupType.topLiked,
        'LeetCode60': GroupType.leetCode60,
        'Top Interview': GroupType.topInterview,
        'Curated Algo': GroupType.algo,
      }[value] ??
      GroupType.algo;

  @override
  String toString() => value;
}

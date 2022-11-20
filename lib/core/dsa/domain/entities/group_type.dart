enum GroupType {
  blind75('Blind 75'),
  grind75('Grind 75'),
  topLiked('Top Liked'),
  sixtyBasic('Sixty Basic'),
  topInterview('Top Interview'),
  algo('Curated Algo'),
  others('Others');

  final String value;

  const GroupType(this.value);

  static GroupType fromString(String value) =>
      {
        'Blind 75': GroupType.blind75,
        'Grind 75': GroupType.grind75,
        'Top Liked': GroupType.topLiked,
        'Sixty Basic': GroupType.sixtyBasic,
        'Top Interview': GroupType.topInterview,
        'Curated Algo': GroupType.algo,
      }[value] ??
      GroupType.others;

  @override
  String toString() => value;
}

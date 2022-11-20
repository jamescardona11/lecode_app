enum GroupType {
  blind75('Blind75'),
  grind75('Grind75'),
  topLiked('Top Liked'),
  sixtyBasic('Sixty Basic'),
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
        'Sixty Basic': GroupType.sixtyBasic,
        'Top Interview': GroupType.topInterview,
        'Curated Algo': GroupType.algo,
      }[value] ??
      GroupType.algo;

  @override
  String toString() => value;
}

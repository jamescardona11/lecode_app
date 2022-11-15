class AppFormatter {
  static String getPercent(double percent) {
    double decimalValue = percent - percent.toInt();

    return decimalValue < 0.09
        ? percent.toStringAsFixed(0)
        : percent.toStringAsFixed(2);
  }
}

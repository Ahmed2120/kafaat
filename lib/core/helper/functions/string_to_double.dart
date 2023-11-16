double doubleOf(String? text) {
  if (text == null || text.isEmpty) {
    return 0.0;
  }
  return double.parse(text);
}

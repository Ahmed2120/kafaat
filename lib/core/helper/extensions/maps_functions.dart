extension MapKeyAndVlaue on Map<String, String> {
  String? getKeyOfValue(String value) {
    String? key = keys.firstWhere((k) => this[k] == value, orElse: () => '');
    key = key.isNotEmpty ? key : null;
    return key;
  }
}

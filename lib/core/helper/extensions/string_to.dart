extension Convert on String? {
  double get toDoubleNum {
    if (this == null || this!.isEmpty) {
      return 0.0;
    }
    try {
      return double.parse(this!);
    } catch (e) {
      return 0.0;
    }
  }

  int get toIntNum {
    if (this == null || this!.isEmpty) {
      return 0;
    }
    try {
      return int.parse(this!);
    } catch (e) {
      return 0;
    }
  }
}

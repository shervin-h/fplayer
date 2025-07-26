extension ConvertToAlpha on int {
  int toAlpha() {
    return ((this / 100) * 255).round();
  }
}

extension StatusCode on int? {
  bool isSucceed() {
    if (this == null) return false;
    return this! >= 200 && this! < 300;
  }
}

extension AssetPath on String {
  String toLottiePath() => 'assets/lottie/$this.json';

  String toPngAssetPath() => 'assets/images/$this.png';

  String toJpgAssetPath() => 'assets/images/$this.jpg';

  String toSvgAssetPath() => 'assets/svg/$this.svg';
}

extension ImageUrl on String? {
  bool isValidImageUrl() {
    if (this == null) return false;
    if (this!.isEmpty) return false;

    // الگوی بررسی URL
    final RegExp urlPattern = RegExp(
      r'^(https?:\/\/)?' // پروتکل (اختیاری)
      r'(([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,6})' // دامنه (مثلاً google.com)
      r'(:\d+)?' // پورت (اختیاری)
      r'(\/[^\s]*)?$', // مسیر و query پارامترها
      caseSensitive: false,
      multiLine: false,
    );
    return urlPattern.hasMatch(this!);
  }

  bool isNotNullOrEmpty() {
    if (this == null) return false;
    if (this!.isEmpty) return false;
    return true;
  }

  bool isNullOrEmpty() {
    if (this == null) return true;
    if (this!.isEmpty) return true;
    return false;
  }
}

extension PersianNumbers on String {
  String toPersianNumbers() {
    final Map<String, String> numbersMap = {
      '0': '۰',
      '1': '۱',
      '2': '۲',
      '3': '۳',
      '4': '۴',
      '5': '۵',
      '6': '۶',
      '7': '۷',
      '8': '۸',
      '9': '۹',
    };

    return replaceAllMapped(RegExp(r'\d'), (match) {
      return numbersMap[match.group(0)] ?? match.group(0)!;
    });
  }
}

extension Path on String {
  String asPath() {
    final ins = trim();
    if (ins.isEmpty) return '/';
    if (ins == '/') return '/';
    return '/$this';
  }
}

extension HasPermission on String? {
  bool isGranted() => this == 'granted';

  bool isDenied() => this == 'denied';

  bool isPermanentlyDenied() => this == 'permanentlyDenied';
}

extension Audio on String {
  List<String> get audioExtensions => [
        '.mp3',
        '.wav',
        '.m4a',
        '.aac',
        '.ogg',
        '.flac',
        '.wma',
        '.opus',
        '.aiff',
        '.amr',
        '.alac',
        '.3gp',
        '.mka',
        '.caf',
        '.tta'
      ];

  bool isAudioFile() => audioExtensions.any((ext) => toLowerCase().endsWith(ext));
}

import 'package:flutter/material.dart';

class TextPallet extends ThemeExtension<TextPallet> {
  const TextPallet({
    required this.textWhite,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.text5,
    required this.text6,
    required this.text7,
    required this.text8,
    required this.text9,
    required this.text10,
    required this.text11,
    required this.text12,
    required this.text13,
  });

  final Color textWhite;
  final Color text1;
  final Color text2;
  final Color text3;
  final Color text4;
  final Color text5;
  final Color text6;
  final Color text7;
  final Color text8;
  final Color text9;
  final Color text10;
  final Color text11;
  final Color text12;
  final Color text13;

  @override
  ThemeExtension<TextPallet> copyWith({
    Color? textWhite,
    Color? text1,
    Color? text2,
    Color? text3,
    Color? text4,
    Color? text5,
    Color? text6,
    Color? text7,
    Color? text8,
    Color? text9,
    Color? text10,
    Color? text11,
    Color? text12,
    Color? text13,
  }) {
    return TextPallet(
      textWhite: textWhite ?? this.textWhite,
      text1: text1 ?? this.text1,
      text2: text2 ?? this.text2,
      text3: text3 ?? this.text3,
      text4: text4 ?? this.text4,
      text5: text5 ?? this.text5,
      text6: text6 ?? this.text6,
      text7: text7 ?? this.text7,
      text8: text7 ?? this.text8,
      text9: text7 ?? this.text9,
      text10: text7 ?? this.text10,
      text11: text7 ?? this.text11,
      text12: text7 ?? this.text12,
      text13: text7 ?? this.text13,
    );
  }

  // Controls how the properties change on theme changes
  @override
  ThemeExtension<TextPallet> lerp(covariant ThemeExtension<TextPallet>? other, double t) {
    if (other is! TextPallet) {
      return this;
    }
    return TextPallet(
      textWhite: Color.lerp(textWhite, other.textWhite, t)!,
      text1: Color.lerp(text1, other.text1, t)!,
      text2: Color.lerp(text2, other.text2, t)!,
      text3: Color.lerp(text3, other.text3, t)!,
      text4: Color.lerp(text4, other.text4, t)!,
      text5: Color.lerp(text5, other.text5, t)!,
      text6: Color.lerp(text6, other.text6, t)!,
      text7: Color.lerp(text7, other.text7, t)!,
      text8: Color.lerp(text8, other.text8, t)!,
      text9: Color.lerp(text9, other.text9, t)!,
      text10: Color.lerp(text10, other.text10, t)!,
      text11: Color.lerp(text11, other.text11, t)!,
      text12: Color.lerp(text12, other.text12, t)!,
      text13: Color.lerp(text13, other.text13, t)!,
    );
  }

  Color? getByName(String name) {
    return switch (name) {
      'white' => textWhite,
      '1' => text1,
      '2' => text2,
      '3' => text3,
      '4' => text4,
      '5' => text5,
      '6' => text6,
      '7' => text7,
      '8' => text8,
      '9' => text9,
      '10' => text10,
      '11' => text11,
      '12' => text12,
      '13' => text13,
      _ => throw Exception('Invalid TextPallet color `name`')
    };
  }

  // Controls how it displays when the instance is being passed
  // to the `print()` method.
  @override
  String toString() => 'PrimaryPallet('
      'textWhite: $textWhite, '
      'text1: $text1, '
      'text2: $text2, '
      'text3: $text3, '
      'text4: $text4, '
      'text5: $text5, '
      'text6: $text6, '
      'text7: $text7, '
      'text8: $text8, '
      'text9: $text9, '
      'text10: $text10, '
      'text11: $text11, '
      'text12: $text12, '
      'text13: $text13, '
      ')';

  static const light = TextPallet(
    textWhite: Color(0xFFFCFCFC),
    text1: Color(0xFF090A0C),
    text2: Color(0xFF121317),
    text3: Color(0xFF24262E),
    text4: Color(0xFF363945),
    text5: Color(0xFF484C5B),
    text6: Color(0xFF5A5F72),
    text7: Color(0xFF6C7289),
    text8: Color(0xFF81879C),
    text9: Color(0xFF989DAE),
    text10: Color(0xFFAFB3C0),
    text11: Color(0xFFC6C9D2),
    text12: Color(0xFFDDDFE4),
    text13: Color(0xFFF4F4F6),
  );

  static const dark = TextPallet(
    textWhite: Color(0xFFFCFCFC),
    text1: Color(0xFFF4F4F6),
    text2: Color(0xFFDDDFE4),
    text3: Color(0xFFC6C9D2),
    text4: Color(0xFFAFB3C0),
    text5: Color(0xFF989DAE),
    text6: Color(0xFF81879C),
    text7: Color(0xFF6C7289),
    text8: Color(0xFF5A5F72),
    text9: Color(0xFF484C5B),
    text10: Color(0xFF363945),
    text11: Color(0xFF24262E),
    text12: Color(0xFF121317),
    text13: Color(0xFF090A0C),
  );
}


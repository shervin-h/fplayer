import 'package:flutter/material.dart';

class StrokePallet extends ThemeExtension<StrokePallet> {
  const StrokePallet({
    required this.stroke1,
    required this.stroke2,
    required this.stroke3,
    required this.stroke4,
    required this.stroke5,
    required this.stroke6,
    required this.stroke7,
    required this.gold,
  });

  final Color stroke1;
  final Color stroke2;
  final Color stroke3;
  final Color stroke4;
  final Color stroke5;
  final Color stroke6;
  final Color stroke7;
  final Color gold;

  static const light = StrokePallet(
    stroke1: Color(0xFF81879C),
    stroke2: Color(0xFF5A5F72),
    stroke3: Color(0xFF5D9719),
    stroke4: Color(0xFF487318),
    stroke5: Color(0x1A3B5C18),
    stroke6: Color(0xFFF73E3C),
    stroke7: Color(0x1AF73E3C),
    gold: Color(0xFFFFD700),
  );

  static const dark = StrokePallet(
    stroke1: Color(0xFF989DAE),
    stroke2: Color(0xFFAFB3C0),
    stroke3: Color(0xFF99D843),
    stroke4: Color(0xFFB6E76F),
    stroke5: Color(0x1A86D028),
    stroke6: Color(0xFFFE6D6B),
    stroke7: Color(0x1AF73E3C),
    // gold: Color(0xFFD4AF37), // Metallic Gold
    gold: Color(0xFFEFBF04), // Bright Gold
    // gold: Color(0xFFB59410), // Dark Gold
  );

  @override
  ThemeExtension<StrokePallet> copyWith({
    Color? stroke1,
    Color? stroke2,
    Color? stroke3,
    Color? stroke4,
    Color? stroke5,
    Color? stroke6,
    Color? stroke7,
    Color? gold,
  }) {
    return StrokePallet(
      stroke1: stroke1 ?? this.stroke1,
      stroke2: stroke2 ?? this.stroke2,
      stroke3: stroke3 ?? this.stroke3,
      stroke4: stroke4 ?? this.stroke4,
      stroke5: stroke5 ?? this.stroke5,
      stroke6: stroke6 ?? this.stroke6,
      stroke7: stroke7 ?? this.stroke7,
      gold: gold ?? this.gold,
    );
  }

  // Controls how the properties change on theme changes
  @override
  ThemeExtension<StrokePallet> lerp(covariant ThemeExtension<StrokePallet>? other, double t) {
    if (other is! StrokePallet) {
      return this;
    }
    return StrokePallet(
      stroke1: Color.lerp(stroke1, other.stroke1, t)!,
      stroke2: Color.lerp(stroke2, other.stroke2, t)!,
      stroke3: Color.lerp(stroke3, other.stroke3, t)!,
      stroke4: Color.lerp(stroke4, other.stroke4, t)!,
      stroke5: Color.lerp(stroke5, other.stroke5, t)!,
      stroke6: Color.lerp(stroke6, other.stroke6, t)!,
      stroke7: Color.lerp(stroke7, other.stroke7, t)!,
      gold: Color.lerp(gold, other.gold, t)!,
    );
  }

  Color? getByName(String name) {
    return switch (name) {
      '1' => stroke1,
      '2' => stroke2,
      '3' => stroke3,
      '4' => stroke4,
      '5' => stroke5,
      '6' => stroke6,
      '7' => stroke7,
      'gold' => gold,
      _ => throw Exception('Invalid StrokePallet color `name`')
    };
  }

  // Controls how it displays when the instance is being passed
  // to the `print()` method.
  @override
  String toString() => 'StrokePallet('
      'stroke1: $stroke1, '
      'stroke2: $stroke2, '
      'stroke3: $stroke3, '
      'stroke4: $stroke4, '
      'stroke5: $stroke5, '
      'stroke6: $stroke6, '
      'stroke7: $stroke7, '
      'gold: $gold, '
      ')';
}

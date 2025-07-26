import 'package:flutter/material.dart';

class BackgroundPallet extends ThemeExtension<BackgroundPallet> {
  const BackgroundPallet({
    required this.background1,
    required this.background2,
    required this.background3,
    required this.background4,
    required this.background5,
    required this.background6,
  });

  final Color background1;
  final Color background2;
  final Color background3;
  final Color background4;
  final Color background5;
  final Color background6;

  @override
  ThemeExtension<BackgroundPallet> copyWith({
    Color? background1,
    Color? background2,
    Color? background3,
    Color? background4,
    Color? background5,
    Color? background6,
  }) {
    return BackgroundPallet(
      background1: background1 ?? this.background1,
      background2: background2 ?? this.background2,
      background3: background3 ?? this.background3,
      background4: background4 ?? this.background4,
      background5: background5 ?? this.background5,
      background6: background6 ?? this.background6,
    );
  }

  // Controls how the properties change on theme changes
  @override
  ThemeExtension<BackgroundPallet> lerp(covariant ThemeExtension<BackgroundPallet>? other, double t) {
    if (other is! BackgroundPallet) {
      return this;
    }
    return BackgroundPallet(
      background1: Color.lerp(background1, other.background1, t)!,
      background2: Color.lerp(background2, other.background2, t)!,
      background3: Color.lerp(background3, other.background3, t)!,
      background4: Color.lerp(background4, other.background4, t)!,
      background5: Color.lerp(background5, other.background5, t)!,
      background6: Color.lerp(background6, other.background6, t)!,
    );
  }

  Color? getByName(String name) {
    return switch (name) {
      '1' => background1,
      '2' => background2,
      '3' => background3,
      '4' => background4,
      '5' => background5,
      '6' => background6,
      _ => throw Exception('Invalid BackgroundPallet color `name`')
    };
  }

  // Controls how it displays when the instance is being passed
  // to the `print()` method.
  @override
  String toString() => 'BackgroundPallet('
      '1: $background1, '
      '2: $background2, '
      '3: $background3, '
      '4: $background4, '
      '5: $background5, '
      '6: $background6, '
      ')';

  static const light = BackgroundPallet(
    background1: Color(0xFFFCFCFC),
    background2: Color(0xFFF9F9F9),
    background3: Color(0xFFF7F7F7),
    background4: Color(0xFFF4F4F4),
    background5: Color(0xFFE3E3E3),
    background6: Color(0xFFEAEAEA),
  );

  static const dark = BackgroundPallet(
    background1: Color(0xFF121317),
    background2: Color(0xFF18191D),
    background3: Color(0xFF1E1F23),
    background4: Color(0xFF242528),
    background5: Color(0xFF2A2B2E),
    background6: Color(0xFF303134),
  );
}

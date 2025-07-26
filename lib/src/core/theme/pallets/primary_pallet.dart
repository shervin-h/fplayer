import 'package:flutter/material.dart';

class PrimaryPallet extends ThemeExtension<PrimaryPallet> {
  const PrimaryPallet({
    required this.primary1,
    required this.primary2,
    required this.primary3,
    required this.primary4,
    required this.primary5,
    required this.primary6,
    required this.primary7,
  });

  final Color primary1;
  final Color primary2;
  final Color primary3;
  final Color primary4;
  final Color primary5;
  final Color primary6;
  final Color primary7;

  @override
  ThemeExtension<PrimaryPallet> copyWith({
    Color? primary1,
    Color? primary2,
    Color? primary3,
    Color? primary4,
    Color? primary5,
    Color? primary6,
    Color? primary7,
  }) {
    return PrimaryPallet(
      primary1: primary1 ?? this.primary1,
      primary2: primary2 ?? this.primary2,
      primary3: primary3 ?? this.primary3,
      primary4: primary4 ?? this.primary4,
      primary5: primary5 ?? this.primary5,
      primary6: primary6 ?? this.primary6,
      primary7: primary7 ?? this.primary7,
    );
  }

  // Controls how the properties change on theme changes
  @override
  ThemeExtension<PrimaryPallet> lerp(covariant ThemeExtension<PrimaryPallet>? other, double t) {
    if (other is! PrimaryPallet) {
      return this;
    }
    return PrimaryPallet(
      primary1: Color.lerp(primary1, other.primary1, t)!,
      primary2: Color.lerp(primary2, other.primary2, t)!,
      primary3: Color.lerp(primary3, other.primary3, t)!,
      primary4: Color.lerp(primary4, other.primary4, t)!,
      primary5: Color.lerp(primary5, other.primary5, t)!,
      primary6: Color.lerp(primary6, other.primary6, t)!,
      primary7: Color.lerp(primary7, other.primary7, t)!,
    );
  }

  Color? getByName(String name) {
    return switch (name) {
      '1' => primary1,
      '2' => primary2,
      '3' => primary3,
      '4' => primary4,
      '5' => primary5,
      '6' => primary6,
      '7' => primary7,
      _ => throw Exception('Invalid PrimaryPallet color `name`')
    };
  }

  // Controls how it displays when the instance is being passed
  // to the `print()` method.
  @override
  String toString() => 'PrimaryPallet('
      'primary1: $primary1, '
      'primary2: $primary2, '
      'primary3: $primary3, '
      'primary4: $primary4, '
      'primary5: $primary5, '
      'primary6: $primary6, '
      'primary7: $primary7, '
      ')';

  static const light = PrimaryPallet(
    primary1: Color(0xFF86D028),
    primary2: Color(0xFF99D843),
    primary3: Color(0xFF487318),
    primary4: Color(0xFF5D9719),
    primary5: Color(0xFF5D9719),
    primary6: Color(0xFFFAFDF4),
    primary7: Color(0x1A86D028),
  );

  static const dark = PrimaryPallet(
    primary1: Color(0xFF86D028),
    primary2: Color(0xFF99D843),
    primary3: Color(0xFF487318),
    primary4: Color(0xFF5D9719),
    primary5: Color(0xFF3B5C18),
    primary6: Color(0xFFFAFDF4),
    primary7: Color(0x1A86D028),
  );
}

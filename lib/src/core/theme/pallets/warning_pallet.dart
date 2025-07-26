import 'package:flutter/material.dart';

class WarningPallet extends ThemeExtension<WarningPallet> {
  const WarningPallet({
    required this.warning1,
    required this.warning2,
    required this.warning3,
    required this.warning4,
    required this.warning5,
  });

  final Color warning1;
  final Color warning2;
  final Color warning3;
  final Color warning4;
  final Color warning5;

  @override
  ThemeExtension<WarningPallet> copyWith({
    Color? warning1,
    Color? warning2,
    Color? warning3,
    Color? warning4,
    Color? warning5,
  }) {
    return WarningPallet(
      warning1: warning1 ?? this.warning1,
      warning2: warning2 ?? this.warning2,
      warning3: warning3 ?? this.warning3,
      warning4: warning4 ?? this.warning4,
      warning5: warning5 ?? this.warning5,
    );
  }

  // Controls how the properties change on theme changes
  @override
  ThemeExtension<WarningPallet> lerp(covariant ThemeExtension<WarningPallet>? other, double t) {
    if (other is! WarningPallet) {
      return this;
    }
    return WarningPallet(
      warning1: Color.lerp(warning1, other.warning1, t)!,
      warning2: Color.lerp(warning2, other.warning2, t)!,
      warning3: Color.lerp(warning3, other.warning3, t)!,
      warning4: Color.lerp(warning4, other.warning4, t)!,
      warning5: Color.lerp(warning5, other.warning5, t)!,
    );
  }

  Color? getByName(String name) {
    return switch (name) {
      '1' => warning1,
      '2' => warning2,
      '3' => warning3,
      '4' => warning4,
      '5' => warning5,
      _ => throw Exception('Invalid WarningPallet color `name`')
    };
  }

  // Controls how it displays when the instance is being passed
  // to the `print()` method.
  @override
  String toString() => 'WarningPallet('
      'warning1: $warning1, '
      'warning2: $warning2, '
      'warning3: $warning3, '
      'warning4: $warning4, '
      'warning5: $warning5, '
      ')';

  static const light = WarningPallet(
    warning1: Color(0xFFF85E00),
    warning2: Color(0xFFFF9932),
    warning3: Color(0xFF822E0C),
    warning4: Color(0xFFCC4402),
    warning5: Color(0xFFF85E00),
  );

  static const dark = WarningPallet(
    warning1: Color(0xFFF85E00),
    warning2: Color(0xFFCC4402),
    warning3: Color(0xFFFF9932),
    warning4: Color(0xFFFFBF6D),
    warning5: Color(0xFFF85E00),
  );
}

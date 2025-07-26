import 'package:flutter/material.dart';

class ErrorPallet extends ThemeExtension<ErrorPallet> {
  const ErrorPallet({
    required this.error1,
    required this.error2,
    required this.error3,
    required this.error4,
    required this.error5,
    required this.error6,
  });

  final Color error1;
  final Color error2;
  final Color error3;
  final Color error4;
  final Color error5;
  final Color error6;

  @override
  ThemeExtension<ErrorPallet> copyWith({
    Color? error1,
    Color? error2,
    Color? error3,
    Color? error4,
    Color? error5,
    Color? error6,
  }) {
    return ErrorPallet(
      error1: error1 ?? this.error1,
      error2: error2 ?? this.error2,
      error3: error3 ?? this.error3,
      error4: error4 ?? this.error4,
      error5: error5 ?? this.error5,
      error6: error6 ?? this.error6,
    );
  }

  // Controls how the properties change on theme changes
  @override
  ThemeExtension<ErrorPallet> lerp(covariant ThemeExtension<ErrorPallet>? other, double t) {
    if (other is! ErrorPallet) {
      return this;
    }
    return ErrorPallet(
      error1: Color.lerp(error1, other.error1, t)!,
      error2: Color.lerp(error2, other.error2, t)!,
      error3: Color.lerp(error3, other.error3, t)!,
      error4: Color.lerp(error4, other.error4, t)!,
      error5: Color.lerp(error5, other.error5, t)!,
      error6: Color.lerp(error6, other.error6, t)!,
    );
  }

  Color? getByName(String name) {
    return switch (name) {
      '1' => error1,
      '2' => error2,
      '3' => error3,
      '4' => error4,
      '5' => error5,
      '6' => error6,
      _ => throw Exception('Invalid ErrorPallet color `name`')
    };
  }

  // Controls how it displays when the instance is being passed
  // to the `print()` method.
  @override
  String toString() => 'ErrorPallet('
      '1: $error1, '
      '2: $error2, '
      '3: $error3, '
      '4: $error4, '
      '5: $error5, '
      '6: $error6, '
      ')';

  static const light = ErrorPallet(
    error1: Color(0xFFDD1C1A),
    error2: Color(0xFFF73E3C),
    error3: Color(0xFF841918),
    error4: Color(0xFFC01715),
    error5: Color(0xFFF73E3C),
    error6: Color(0x1A9F1615),
  );

  static const dark = ErrorPallet(
    error1: Color(0xFFF73E3C),
    error2: Color(0xFFFE6D6B),
    error3: Color(0xFFFFA2A1),
    error4: Color(0xFFFE6D6B),
    error5: Color(0xFFDD1C1A),
    error6: Color(0x1AF73E3C),
  );
}

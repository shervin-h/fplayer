import 'package:flutter/material.dart';

class SuccessPallet extends ThemeExtension<SuccessPallet> {
  const SuccessPallet({
    required this.success1,
    required this.success2,
    required this.success3,
    required this.success4,
    required this.success5,
  });

  final Color success1;
  final Color success2;
  final Color success3;
  final Color success4;
  final Color success5;

  @override
  ThemeExtension<SuccessPallet> copyWith({
    Color? success1,
    Color? success2,
    Color? success3,
    Color? success4,
    Color? success5,
  }) {
    return SuccessPallet(
      success1: success1 ?? this.success1,
      success2: success2 ?? this.success2,
      success3: success3 ?? this.success3,
      success4: success4 ?? this.success4,
      success5: success5 ?? this.success5,
    );
  }

  // Controls how the properties change on theme changes
  @override
  ThemeExtension<SuccessPallet> lerp(covariant ThemeExtension<SuccessPallet>? other, double t) {
    if (other is! SuccessPallet) {
      return this;
    }
    return SuccessPallet(
      success1: Color.lerp(success1, other.success1, t)!,
      success2: Color.lerp(success2, other.success2, t)!,
      success3: Color.lerp(success3, other.success3, t)!,
      success4: Color.lerp(success4, other.success4, t)!,
      success5: Color.lerp(success5, other.success5, t)!,
    );
  }

  Color? getByName(String name) {
    return switch (name) {
      '1' => success1,
      '2' => success2,
      '3' => success3,
      '4' => success4,
      '5' => success5,
      _ => throw Exception('Invalid SuccessPallet color `name`')
    };
  }

  // Controls how it displays when the instance is being passed
  // to the `print()` method.
  @override
  String toString() => 'SuccessPallet('
      'success1: $success1, '
      'success2: $success2, '
      'success3: $success3, '
      'success4: $success4, '
      'success5: $success5, '
      ')';

  static const light = SuccessPallet(
    success1: Color(0xFF00B663),
    success2: Color(0xFF09DE7C),
    success3: Color(0xFF0A5D3A),
    success4: Color(0xFF049152),
    success5: Color(0xFF00B663),
  );

  static const dark = SuccessPallet(
    success1: Color(0xFF00B663),
    success2: Color(0xFF049152),
    success3: Color(0xFF76FFBF),
    success4: Color(0xFF33F59C),
    success5: Color(0xFF00B663),
  );
}

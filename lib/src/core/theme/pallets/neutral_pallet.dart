import 'package:flutter/material.dart';

class NeutralPallet extends ThemeExtension<NeutralPallet> {
  const NeutralPallet({
    required this.neutral1,
  });

  final Color neutral1;


  @override
  ThemeExtension<NeutralPallet> copyWith({
    Color? neutral1,
  }) {
    return NeutralPallet(
      neutral1: neutral1 ?? this.neutral1,
    );
  }

  // Controls how the properties change on theme changes
  @override
  ThemeExtension<NeutralPallet> lerp(covariant ThemeExtension<NeutralPallet>? other, double t) {
    if (other is! NeutralPallet) {
      return this;
    }
    return NeutralPallet(
      neutral1: Color.lerp(neutral1, other.neutral1, t)!,
    );
  }

  Color? getByName(String name) {
    return switch (name) {
      '1' => neutral1,
      _ => throw Exception('Invalid NeutralPallet color `name`')
    };
  }

  // Controls how it displays when the instance is being passed
  // to the `print()` method.
  @override
  String toString() => 'NeutralPallet('
      'neutral1: $neutral1, '
      ')';

  static const light = NeutralPallet(
    neutral1: Color(0x1A5A5F72),
  );

  static const dark = NeutralPallet(
    neutral1: Color(0x1A5A5F72),
  );
}

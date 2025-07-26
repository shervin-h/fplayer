import 'package:flutter/material.dart';

class InfoPallet extends ThemeExtension<InfoPallet> {
  const InfoPallet({
    required this.info1,
    required this.info2,
    required this.info3,
    required this.info4,
    required this.info5,
    required this.info6,
  });

  final Color info1;
  final Color info2;
  final Color info3;
  final Color info4;
  final Color info5;
  final Color info6;

  @override
  ThemeExtension<InfoPallet> copyWith({
    Color? info1,
    Color? info2,
    Color? info3,
    Color? info4,
    Color? info5,
    Color? info6,
  }) {
    return InfoPallet(
      info1: info1 ?? this.info1,
      info2: info2 ?? this.info2,
      info3: info3 ?? this.info3,
      info4: info4 ?? this.info4,
      info5: info5 ?? this.info5,
      info6: info6 ?? this.info6,
    );
  }

  // Controls how the properties change on theme changes
  @override
  ThemeExtension<InfoPallet> lerp(covariant ThemeExtension<InfoPallet>? other, double t) {
    if (other is! InfoPallet) {
      return this;
    }
    return InfoPallet(
      info1: Color.lerp(info1, other.info1, t)!,
      info2: Color.lerp(info2, other.info2, t)!,
      info3: Color.lerp(info3, other.info3, t)!,
      info4: Color.lerp(info4, other.info4, t)!,
      info5: Color.lerp(info5, other.info5, t)!,
      info6: Color.lerp(info6, other.info6, t)!,
    );
  }

  Color? getByName(String name) {
    return switch (name) {
      '1' => info1,
      '2' => info2,
      '3' => info3,
      '4' => info4,
      '5' => info5,
      '6' => info6,
      _ => throw Exception('Invalid InfoPallet color `name`')
    };
  }

  // Controls how it displays when the instance is being passed
  // to the `print()` method.
  @override
  String toString() => 'InfoPallet('
      'info1: $info1, '
      'info2: $info2, '
      'info3: $info3, '
      'info4: $info4, '
      'info5: $info5, '
      'info6: $info6, '
      ')';

  static const light = InfoPallet(
    info1: Color(0xFF01BAEF),
    info2: Color(0xFF2DD3FF),
    info3: Color(0xFF00678C),
    info4: Color(0xFF007BAA),
    info5: Color(0xFF01BAEF),
    info6: Color(0x4D01BAEF),
  );

  static const dark = InfoPallet(
    info1: Color(0xFF01BAEF),
    info2: Color(0xFF009BD3),
    info3: Color(0xFF75E2FF),
    info4: Color(0xFF2DD3FF),
    info5: Color(0xFF01BAEF),
    info6: Color(0x4D01BAEF),
  );
}

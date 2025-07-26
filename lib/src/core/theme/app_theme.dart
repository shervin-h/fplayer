import 'package:flutter/material.dart';
import 'package:fplayer/src/core/config/constants/app_constants.dart';
import 'package:fplayer/src/core/theme/pallets/background_pallet.dart';
import 'package:fplayer/src/core/theme/pallets/error_pallet.dart';
import 'package:fplayer/src/core/theme/pallets/neutral_pallet.dart';
import 'package:fplayer/src/core/theme/pallets/stroke_pallet.dart';
import 'package:fplayer/src/core/theme/pallets/info_pallet.dart';
import 'package:fplayer/src/core/theme/pallets/primary_pallet.dart';
import 'package:fplayer/src/core/theme/pallets/success_pallet.dart';
import 'package:fplayer/src/core/theme/pallets/text_pallet.dart';
import 'package:fplayer/src/core/theme/pallets/warning_pallet.dart';
import 'package:fplayer/src/core/theme/typography/custom_text_theme.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: AppConstants.fontFamily,
    extensions: <ThemeExtension<dynamic>>[
      BackgroundPallet.light,
      PrimaryPallet.light,
      TextPallet.light,
      ErrorPallet.light,
      WarningPallet.light,
      InfoPallet.light,
      SuccessPallet.light,
      StrokePallet.light,
      NeutralPallet.light,

      // typography
      CustomTextTheme.light,
    ],
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: AppConstants.fontFamily,
    extensions: <ThemeExtension<dynamic>>[
      BackgroundPallet.dark,
      PrimaryPallet.dark,
      TextPallet.dark,
      ErrorPallet.dark,
      WarningPallet.dark,
      InfoPallet.dark,
      SuccessPallet.dark,
      StrokePallet.dark,
      NeutralPallet.dark,

      // typography
      CustomTextTheme.dark,
    ],
  );
}

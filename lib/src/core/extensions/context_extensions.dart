import 'package:flutter/material.dart';
import 'package:fplayer/src/core/theme/pallets/background_pallet.dart';
import 'package:fplayer/src/core/theme/pallets/error_pallet.dart';
import 'package:fplayer/src/core/theme/pallets/info_pallet.dart';
import 'package:fplayer/src/core/theme/pallets/neutral_pallet.dart';
import 'package:fplayer/src/core/theme/pallets/primary_pallet.dart';
import 'package:fplayer/src/core/theme/pallets/stroke_pallet.dart';
import 'package:fplayer/src/core/theme/pallets/success_pallet.dart';
import 'package:fplayer/src/core/theme/pallets/text_pallet.dart';
import 'package:fplayer/src/core/theme/pallets/warning_pallet.dart';
import 'package:fplayer/src/core/theme/typography/custom_text_theme.dart';

extension Typography on BuildContext {
  CustomTextTheme? typography() => Theme.of(this).extension<CustomTextTheme>();

  TextStyle? h1Bold() => typography()?.h2Bold;

  TextStyle? h1Medium() => typography()?.h1Medium;

  TextStyle? h2Bold() => typography()?.h2Bold;

  TextStyle? h2Medium() => typography()?.h2Medium;

  TextStyle? h3Bold() => typography()?.h3Bold;

  TextStyle? h3Medium() => typography()?.h3Medium;

  TextStyle? h3Regular() => typography()?.h3Regular;

  TextStyle? h4Bold() => typography()?.h4Bold;

  TextStyle? h4Medium() => typography()?.h4Medium;

  TextStyle? h4Regular() => typography()?.h4Regular;

  TextStyle? h5Bold() => typography()?.h5Bold;

  TextStyle? h5Medium() => typography()?.h5Medium;

  TextStyle? h5Regular() => typography()?.h5Regular;

  TextStyle? h6Bold() => typography()?.h6Bold;

  TextStyle? h6Medium() => typography()?.h6Medium;

  TextStyle? h6Regular() => typography()?.h6Regular;

  TextStyle? body1Bold() => typography()?.body1Bold;

  TextStyle? body1Medium() => typography()?.body1Medium;

  TextStyle? body1Regular() => typography()?.body1Regular;

  TextStyle? body2Bold() => typography()?.body2Bold;

  TextStyle? body2Medium() => typography()?.body2Medium;

  TextStyle? body2Regular() => typography()?.body2Regular;

  TextStyle? captionBold() => typography()?.captionBold;

  TextStyle? captionMedium() => typography()?.captionMedium;

  TextStyle? captionRegular() => typography()?.captionRegular;
}

extension ColorPallets on BuildContext {
  BackgroundPallet? backgroundPallet() => Theme.of(this).extension<BackgroundPallet>();

  Color? background1() => backgroundPallet()?.background1;

  Color? background2() => backgroundPallet()?.background2;

  Color? background3() => backgroundPallet()?.background3;

  Color? background4() => backgroundPallet()?.background4;

  Color? background5() => backgroundPallet()?.background5;

  Color? background6() => backgroundPallet()?.background6;

  PrimaryPallet? primaryPallet() => Theme.of(this).extension<PrimaryPallet>();

  Color? primary1() => primaryPallet()?.primary1;

  Color? primary2() => primaryPallet()?.primary2;

  Color? primary3() => primaryPallet()?.primary3;

  Color? primary4() => primaryPallet()?.primary4;

  Color? primary5() => primaryPallet()?.primary5;

  Color? primary6() => primaryPallet()?.primary6;

  Color? primary7() => primaryPallet()?.primary7;

  ErrorPallet? errorPallet() => Theme.of(this).extension<ErrorPallet>();

  Color? error1() => errorPallet()?.error1;

  Color? error2() => errorPallet()?.error2;

  Color? error3() => errorPallet()?.error2;

  Color? error4() => errorPallet()?.error4;

  Color? error5() => errorPallet()?.error5;

  Color? error6() => errorPallet()?.error6;

  WarningPallet? warningPallet() => Theme.of(this).extension<WarningPallet>();

  Color? warning1() => warningPallet()?.warning1;

  Color? warning2() => warningPallet()?.warning2;

  Color? warning3() => warningPallet()?.warning3;

  Color? warning4() => warningPallet()?.warning4;

  Color? warning5() => warningPallet()?.warning5;

  InfoPallet? infoPallet() => Theme.of(this).extension<InfoPallet>();

  Color? info1() => infoPallet()?.info1;

  Color? info2() => infoPallet()?.info2;

  Color? info3() => infoPallet()?.info3;

  Color? info4() => infoPallet()?.info4;

  Color? info5() => infoPallet()?.info5;

  Color? info6() => infoPallet()?.info6;

  SuccessPallet? successPallet() => Theme.of(this).extension<SuccessPallet>();

  Color? success1() => successPallet()?.success1;

  Color? success2() => successPallet()?.success2;

  Color? success3() => successPallet()?.success3;

  Color? success4() => successPallet()?.success4;

  Color? success5() => successPallet()?.success5;

  StrokePallet? strokePallet() => Theme.of(this).extension<StrokePallet>();

  Color? stroke1() => strokePallet()?.stroke1;

  Color? stroke2() => strokePallet()?.stroke2;

  Color? stroke3() => strokePallet()?.stroke3;

  Color? stroke4() => strokePallet()?.stroke4;

  Color? stroke5() => strokePallet()?.stroke5;

  Color? stroke6() => strokePallet()?.stroke6;

  Color? stroke7() => strokePallet()?.stroke7;

  Color? gold() => strokePallet()?.gold;

  TextPallet? textPallet() => Theme.of(this).extension<TextPallet>();

  Color? textWhite() => textPallet()?.textWhite;

  Color? text1() => textPallet()?.text1;

  Color? text2() => textPallet()?.text2;

  Color? text3() => textPallet()?.text3;

  Color? text4() => textPallet()?.text4;

  Color? text5() => textPallet()?.text5;

  Color? text6() => textPallet()?.text6;

  Color? text7() => textPallet()?.text7;

  Color? text8() => textPallet()?.text8;

  Color? text9() => textPallet()?.text9;

  Color? text10() => textPallet()?.text10;

  Color? text11() => textPallet()?.text11;

  Color? text12() => textPallet()?.text12;

  Color? text13() => textPallet()?.text13;

  NeutralPallet? neutralPallet() => Theme.of(this).extension<NeutralPallet>();

  Color? neutral1() => neutralPallet()?.neutral1;
}

extension BrightnessMode on BuildContext {
  Brightness getBrightness() => Theme.of(this).brightness;

  bool isDark() => getBrightness() == Brightness.dark;

  bool isLight() => getBrightness() == Brightness.light;
}

extension AppDirectionality on BuildContext {
  bool isRtl() => Directionality.of(this) == TextDirection.rtl;

  bool isLtr() => Directionality.of(this) == TextDirection.ltr;

  List<String> get getRtlLanguages => ['fa', 'ar', 'he', 'ur'];

  Locale get local => Localizations.localeOf(this);

  bool isRtlLanguage() => getRtlLanguages.contains(local.languageCode);

  bool get isFa => local.languageCode == 'fa';

  bool isRtlText(String text) {
    if (text.trim().isEmpty) return false;

    final rtlCharRegExp = RegExp(
      r'^[\u0600-\u06FF\u0750-\u077F\u08A0-\u08FF\uFB50-\uFDFF\uFE70-\uFEFF]',
    );

    for (int i = 0; i < text.length; i++) {
      final char = text[i];
      if (char.trim().isEmpty) continue;

      if (rtlCharRegExp.hasMatch(char)) {
        return true;
      } else {
        return false;
      }
    }

    return false;
  }
}

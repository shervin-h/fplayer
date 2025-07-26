import 'package:flutter/material.dart';
import 'package:fplayer/src/core/config/constants/app_constants.dart';
import 'package:fplayer/src/core/theme/pallets/text_pallet.dart';

class CustomTextTheme extends ThemeExtension<CustomTextTheme> {
  final TextStyle h1Bold;
  final TextStyle h1Medium;
  final TextStyle h2Bold;
  final TextStyle h2Medium;
  final TextStyle h3Bold;
  final TextStyle h3Medium;
  final TextStyle h3Regular;
  final TextStyle h4Bold;
  final TextStyle h4Medium;
  final TextStyle h4Regular;
  final TextStyle h5Bold;
  final TextStyle h5Medium;
  final TextStyle h5Regular;
  final TextStyle h6Bold;
  final TextStyle h6Medium;
  final TextStyle h6Regular;
  final TextStyle body1Bold;
  final TextStyle body1Medium;
  final TextStyle body1Regular;
  final TextStyle body2Bold;
  final TextStyle body2Medium;
  final TextStyle body2Regular;
  final TextStyle captionBold;
  final TextStyle captionMedium;
  final TextStyle captionRegular;

  const CustomTextTheme({
    required this.h1Bold,
    required this.h1Medium,
    required this.h2Bold,
    required this.h2Medium,
    required this.h3Bold,
    required this.h3Medium,
    required this.h3Regular,
    required this.h4Bold,
    required this.h4Medium,
    required this.h4Regular,
    required this.h5Bold,
    required this.h5Medium,
    required this.h5Regular,
    required this.h6Bold,
    required this.h6Medium,
    required this.h6Regular,
    required this.body1Bold,
    required this.body1Medium,
    required this.body1Regular,
    required this.body2Bold,
    required this.body2Medium,
    required this.body2Regular,
    required this.captionBold,
    required this.captionMedium,
    required this.captionRegular,
  });

  @override
  CustomTextTheme copyWith({
    TextStyle? h1Bold,
    TextStyle? h1Medium,
    TextStyle? h2Bold,
    TextStyle? h2Medium,
    TextStyle? h3Bold,
    TextStyle? h3Medium,
    TextStyle? h3Regular,
    TextStyle? h4Bold,
    TextStyle? h4Medium,
    TextStyle? h4Regular,
    TextStyle? h5Bold,
    TextStyle? h5Medium,
    TextStyle? h5Regular,
    TextStyle? h6Bold,
    TextStyle? h6Medium,
    TextStyle? h6Regular,
    TextStyle? body1Bold,
    TextStyle? body1Medium,
    TextStyle? body1Regular,
    TextStyle? body2Bold,
    TextStyle? body2Medium,
    TextStyle? body2Regular,
    TextStyle? captionBold,
    TextStyle? captionMedium,
    TextStyle? captionRegular,
  }) {
    return CustomTextTheme(
      h1Bold: h1Bold ?? this.h1Bold,
      h1Medium: h1Medium ?? this.h1Medium,
      h2Bold: h2Bold ?? this.h2Bold,
      h2Medium: h2Medium ?? this.h2Medium,
      h3Bold: h3Bold ?? this.h3Bold,
      h3Medium: h3Medium ?? this.h3Medium,
      h3Regular: h3Regular ?? this.h3Regular,
      h4Bold: h4Bold ?? this.h4Bold,
      h4Medium: h4Medium ?? this.h4Medium,
      h4Regular: h4Regular ?? this.h4Regular,
      h5Bold: h5Bold ?? this.h5Bold,
      h5Medium: h5Medium ?? this.h5Medium,
      h5Regular: h5Regular ?? this.h5Regular,
      h6Bold: h6Bold ?? this.h6Bold,
      h6Medium: h6Medium ?? this.h6Medium,
      h6Regular: h6Regular ?? this.h6Regular,
      body1Bold: body1Bold ?? this.body1Bold,
      body1Medium: body1Medium ?? this.body1Medium,
      body1Regular: body1Regular ?? this.body1Regular,
      body2Bold: body2Bold ?? this.body2Bold,
      body2Medium: body2Medium ?? this.body2Medium,
      body2Regular: body2Regular ?? this.body2Regular,
      captionBold: captionBold ?? this.captionBold,
      captionMedium: captionMedium ?? this.captionMedium,
      captionRegular: captionRegular ?? this.captionRegular,
    );
  }

  @override
  CustomTextTheme lerp(covariant CustomTextTheme? other, double t) {
    if (other == null) return this;
    return CustomTextTheme(
      h1Bold: TextStyle.lerp(h1Bold, other.h1Bold, t)!,
      h1Medium: TextStyle.lerp(h1Medium, other.h1Medium, t)!,
      h2Bold: TextStyle.lerp(h2Bold, other.h2Bold, t)!,
      h2Medium: TextStyle.lerp(h2Medium, other.h2Medium, t)!,
      h3Bold: TextStyle.lerp(h3Bold, other.h3Bold, t)!,
      h3Medium: TextStyle.lerp(h3Medium, other.h3Medium, t)!,
      h3Regular: TextStyle.lerp(h3Regular, other.h3Regular, t)!,
      h4Bold: TextStyle.lerp(h4Bold, other.h4Bold, t)!,
      h4Medium: TextStyle.lerp(h4Medium, other.h4Medium, t)!,
      h4Regular: TextStyle.lerp(h4Regular, other.h4Regular, t)!,
      h5Bold: TextStyle.lerp(h5Bold, other.h5Bold, t)!,
      h5Medium: TextStyle.lerp(h5Medium, other.h5Medium, t)!,
      h5Regular: TextStyle.lerp(h5Regular, other.h5Regular, t)!,
      h6Bold: TextStyle.lerp(h6Bold, other.h6Bold, t)!,
      h6Medium: TextStyle.lerp(h6Medium, other.h6Medium, t)!,
      h6Regular: TextStyle.lerp(h6Regular, other.h6Regular, t)!,
      body1Bold: TextStyle.lerp(body1Bold, other.body1Bold, t)!,
      body1Medium: TextStyle.lerp(body1Medium, other.body1Medium, t)!,
      body1Regular: TextStyle.lerp(body1Regular, other.body1Regular, t)!,
      body2Bold: TextStyle.lerp(body2Bold, other.body2Bold, t)!,
      body2Medium: TextStyle.lerp(body2Medium, other.body2Medium, t)!,
      body2Regular: TextStyle.lerp(body2Regular, other.body2Regular, t)!,
      captionBold: TextStyle.lerp(captionBold, other.captionBold, t)!,
      captionMedium: TextStyle.lerp(captionMedium, other.captionMedium, t)!,
      captionRegular: TextStyle.lerp(captionRegular, other.captionRegular, t)!,
    );
  }

  static CustomTextTheme light = CustomTextTheme(
    h1Bold: TextStyle(
      fontFamily: AppConstants.fontFamily,
      fontSize: 32,
      fontWeight: FontWeight.w700,
      color: TextPallet.light.text1,
    ),
    h1Medium: TextStyle(
      fontFamily: AppConstants.fontFamily,
      fontSize: 32,
      fontWeight: FontWeight.w500,
      color: TextPallet.light.text1,
    ),
    h2Bold: TextStyle(
      fontFamily: AppConstants.fontFamily,
      fontSize: 30,
      fontWeight: FontWeight.w700,
      color: TextPallet.light.text1,
    ),
    h2Medium: TextStyle(
      fontFamily: AppConstants.fontFamily,
      fontSize: 30,
      fontWeight: FontWeight.w500,
      color: TextPallet.light.text1,
    ),
    h3Bold: TextStyle(
      fontFamily: AppConstants.fontFamily,
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: TextPallet.light.text1,
    ),
    h3Medium: TextStyle(
      fontFamily: AppConstants.fontFamily,
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: TextPallet.light.text1,
    ),
    h3Regular: TextStyle(
      fontFamily: AppConstants.fontFamily,
      fontSize: 24,
      fontWeight: FontWeight.w400,
      color: TextPallet.light.text1,
    ),
    h4Bold: TextStyle(
      fontFamily: AppConstants.fontFamily,
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: TextPallet.light.text1,
    ),
    h4Medium: TextStyle(
      fontFamily: AppConstants.fontFamily,
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: TextPallet.light.text1,
    ),
    h4Regular: TextStyle(
      fontFamily: AppConstants.fontFamily,
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: TextPallet.light.text1,
    ),
    h5Bold: TextStyle(
      fontFamily: AppConstants.fontFamily,
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: TextPallet.light.text1,
    ),
    h5Medium: TextStyle(
      fontFamily: AppConstants.fontFamily,
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: TextPallet.light.text1,
    ),
    h5Regular: TextStyle(
      fontFamily: AppConstants.fontFamily,
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: TextPallet.light.text1,
    ),
    h6Bold: TextStyle(
      fontFamily: AppConstants.fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: TextPallet.light.text1,
    ),
    h6Medium: TextStyle(
      fontFamily: AppConstants.fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: TextPallet.light.text1,
    ),
    h6Regular: TextStyle(
      fontFamily: AppConstants.fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: TextPallet.light.text1,
    ),
    body1Bold: TextStyle(
      fontFamily: AppConstants.fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: TextPallet.light.text1,
    ),
    body1Medium: TextStyle(
      fontFamily: AppConstants.fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: TextPallet.light.text1,
    ),
    body1Regular: TextStyle(
      fontFamily: AppConstants.fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: TextPallet.light.text1,
    ),
    body2Bold: TextStyle(
      fontFamily: AppConstants.fontFamily,
      fontSize: 12,
      fontWeight: FontWeight.w700,
      color: TextPallet.light.text1,
    ),
    body2Medium: TextStyle(
      fontFamily: AppConstants.fontFamily,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: TextPallet.light.text1,
    ),
    body2Regular: TextStyle(
      fontFamily: AppConstants.fontFamily,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: TextPallet.light.text1,
    ),
    captionBold: TextStyle(
      fontFamily: AppConstants.fontFamily,
      fontSize: 11,
      fontWeight: FontWeight.w700,
      color: TextPallet.light.text1,
    ),
    captionMedium: TextStyle(
      fontFamily: AppConstants.fontFamily,
      fontSize: 11,
      fontWeight: FontWeight.w500,
      color: TextPallet.light.text1,
    ),
    captionRegular: TextStyle(
      fontFamily: AppConstants.fontFamily,
      fontSize: 11,
      fontWeight: FontWeight.w400,
      color: TextPallet.light.text1,
    ),
  );

  static CustomTextTheme dark = CustomTextTheme(
    h1Bold: TextStyle(
      fontFamily: AppConstants.fontFamily,
      fontSize: 32,
      fontWeight: FontWeight.w700,
      color: TextPallet.dark.textWhite,
    ),
    h1Medium: TextStyle(
      fontFamily: AppConstants.fontFamily,
      fontSize: 32,
      fontWeight: FontWeight.w500,
      color: TextPallet.dark.textWhite,
    ),
    h2Bold: TextStyle(
      fontFamily: AppConstants.fontFamily,
      fontSize: 30,
      fontWeight: FontWeight.w700,
      color: TextPallet.dark.textWhite,
    ),
    h2Medium: TextStyle(
      fontFamily: AppConstants.fontFamily,
      fontSize: 30,
      fontWeight: FontWeight.w500,
      color: TextPallet.dark.textWhite,
    ),
    h3Bold: TextStyle(
      fontFamily: AppConstants.fontFamily,
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: TextPallet.dark.textWhite,
    ),
    h3Medium: TextStyle(
      fontFamily: AppConstants.fontFamily,
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: TextPallet.dark.textWhite,
    ),
    h3Regular: TextStyle(
      fontFamily: AppConstants.fontFamily,
      fontSize: 24,
      fontWeight: FontWeight.w400,
      color: TextPallet.dark.textWhite,
    ),
    h4Bold: TextStyle(
      fontFamily: AppConstants.fontFamily,
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: TextPallet.dark.textWhite,
    ),
    h4Medium: TextStyle(
      fontFamily: AppConstants.fontFamily,
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: TextPallet.dark.textWhite,
    ),
    h4Regular: TextStyle(
      fontFamily: AppConstants.fontFamily,
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: TextPallet.dark.textWhite,
    ),
    h5Bold: TextStyle(
      fontFamily: AppConstants.fontFamily,
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: TextPallet.dark.textWhite,
    ),
    h5Medium: TextStyle(
      fontFamily: AppConstants.fontFamily,
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: TextPallet.dark.textWhite,
    ),
    h5Regular: TextStyle(
      fontFamily: AppConstants.fontFamily,
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: TextPallet.dark.textWhite,
    ),
    h6Bold: TextStyle(
      fontFamily: AppConstants.fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: TextPallet.dark.textWhite,
    ),
    h6Medium: TextStyle(
      fontFamily: AppConstants.fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: TextPallet.dark.textWhite,
    ),
    h6Regular: TextStyle(
      fontFamily: AppConstants.fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: TextPallet.dark.textWhite,
    ),
    body1Bold: TextStyle(
      fontFamily: AppConstants.fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: TextPallet.dark.textWhite,
    ),
    body1Medium: TextStyle(
      fontFamily: AppConstants.fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: TextPallet.dark.textWhite,
    ),
    body1Regular: TextStyle(
      fontFamily: AppConstants.fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: TextPallet.dark.textWhite,
    ),
    body2Bold: TextStyle(
      fontFamily: AppConstants.fontFamily,
      fontSize: 12,
      fontWeight: FontWeight.w700,
      color: TextPallet.dark.textWhite,
    ),
    body2Medium: TextStyle(
      fontFamily: AppConstants.fontFamily,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: TextPallet.dark.textWhite,
    ),
    body2Regular: TextStyle(
      fontFamily: AppConstants.fontFamily,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: TextPallet.dark.textWhite,
    ),
    captionBold: TextStyle(
      fontFamily: AppConstants.fontFamily,
      fontSize: 11,
      fontWeight: FontWeight.w700,
      color: TextPallet.dark.textWhite,
    ),
    captionMedium: TextStyle(
      fontFamily: AppConstants.fontFamily,
      fontSize: 11,
      fontWeight: FontWeight.w500,
      color: TextPallet.dark.textWhite,
    ),
    captionRegular: TextStyle(
      fontFamily: AppConstants.fontFamily,
      fontSize: 11,
      fontWeight: FontWeight.w400,
      color: TextPallet.dark.textWhite,
    ),
  );
}

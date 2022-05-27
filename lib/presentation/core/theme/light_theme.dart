import 'package:course_camp/presentation/core/utils/screen_util.dart';
import 'package:course_camp/presentation/core/values/colors.dart';
import 'package:flutter/material.dart';

ThemeData get lightTheme {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    scaffoldBackgroundColor: Colors.white,
    // backgroundColor: CustomColors.backgroundLightGrey,
    textTheme: _textTheme,
    primaryColor: Colors.blue,
    // appBarTheme: _appBarTheme,
  );
}

// AppBarTheme get _appBarTheme => AppBarTheme(
//       backgroundColor: CustomColors.backgroundLightGrey,
//       foregroundColor: CustomColors.black,
//       elevation: 0,
//       centerTitle: false,
//     );

TextTheme get _textTheme {
  const baseTextStyle = TextStyle();
  return TextTheme(
    headline1: baseTextStyle.copyWith(
      fontSize: 30.toFont,
      fontWeight: FontWeight.bold,
    ),
    headline2: baseTextStyle.copyWith(
      fontSize: 25.toFont,
      fontWeight: FontWeight.bold,
      color: CustomColors.darkerText,
    ),
    headline3: baseTextStyle.copyWith(
      fontSize: 22.toFont,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.27,
      color: CustomColors.darkerText,
    ),
    headline4: baseTextStyle.copyWith(
      fontSize: 22.toFont,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.27,
      color: CustomColors.darkerText,
    ),
    headline5: baseTextStyle.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: 18.toFont,
      letterSpacing: 0.27,
      color: Colors.blueGrey,
    ),
    headline6: baseTextStyle.copyWith(
      fontSize: 16.toFont,
      fontWeight: FontWeight.bold,
      color: CustomColors.lightGrey,
    ),
    subtitle1: baseTextStyle.copyWith(
      fontSize: 16.toFont,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.2,
      color: CustomColors.lightGrey,
    ),
    subtitle2: baseTextStyle.copyWith(
      fontSize: 16.toFont,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.27,
      color: CustomColors.darkerText,
    ),
    bodyText1: baseTextStyle.copyWith(
      fontSize: 14.toFont,
      fontWeight: FontWeight.normal,
      letterSpacing: 0.2,
    ),
    bodyText2: baseTextStyle.copyWith(
      fontSize: 12.toFont,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.27,
    ),
  );
}

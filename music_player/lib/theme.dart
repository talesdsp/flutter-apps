import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

// Our light/Primary Theme
ThemeData themeData(BuildContext context) {
  return ThemeData(
    appBarTheme: appBarTheme,
    primaryColor: kPrimaryColor,
    accentColor: kAccentLightColor,
    scaffoldBackgroundColor: kBackgroundColor,
    colorScheme: ColorScheme.light(
      secondary: kSecondaryLightColor, primary: Colors.red,
      // on light theme surface = Colors.white by default
    ),
    backgroundColor: kBackgroundColor,
    iconTheme: IconThemeData(color: kPrimaryColor),
    accentIconTheme: IconThemeData(color: kAccentIconLightColor),
    primaryIconTheme: IconThemeData(color: kPrimaryIconLightColor),
    primaryTextTheme: textTheme,
    textTheme: textTheme,
  );
}

// Dark Them
ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    primaryColor: kPrimaryColor,
    accentColor: kAccentDarkColor,
    scaffoldBackgroundColor: Color(0xFF0D0C0E),
    appBarTheme: appBarTheme,
    colorScheme: ColorScheme.light(
      secondary: kSecondaryDarkColor,
      surface: kSurfaceDarkColor,
    ),
    backgroundColor: kBackgroundDarkColor,
    iconTheme: IconThemeData(color: kBodyTextColorDark),
    accentIconTheme: IconThemeData(color: kAccentIconDarkColor),
    primaryIconTheme: IconThemeData(color: kPrimaryIconDarkColor),
    textTheme: GoogleFonts.latoTextTheme().copyWith(
      bodyText1: TextStyle(color: kBodyTextColorDark),
      bodyText2: TextStyle(color: kBodyTextColorDark),
      headline4: TextStyle(color: kTitleTextDarkColor, fontSize: 32),
      headline1: TextStyle(color: kTitleTextDarkColor, fontSize: 80),
    ),
  );
}

AppBarTheme appBarTheme = AppBarTheme(
  color: Colors.transparent,
  elevation: 0,
  centerTitle: true,
);

TextTheme textTheme = GoogleFonts.latoTextTheme().copyWith(
  bodyText1: TextStyle(color: kBodyTextColorLight),
  bodyText2: TextStyle(color: kBodyTextColorLight),
  headline1: TextStyle(color: kTitleTextLightColor, fontSize: 80),
  headline2: TextStyle(color: kTitleTextLightColor, fontSize: 56),
  headline3: TextStyle(color: kTitleTextLightColor, fontSize: 44),
  headline4: TextStyle(color: kTitleTextLightColor, fontSize: 32),
  headline5: TextStyle(color: kTitleTextLightColor, fontSize: 25),
  headline6: TextStyle(color: kPrimaryColor, fontSize: 18),
);

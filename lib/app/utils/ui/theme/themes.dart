import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'light_color.dart';

class Themes {
  final lightTheme = ThemeData.light().copyWith(
    primaryColor: LightColor.primary,
    cardColor: LightColor.card,
    scaffoldBackgroundColor: LightColor.background,
    shadowColor: LightColor.shadow,
    textTheme: GoogleFonts.poppinsTextTheme(),
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(primary: LightColor.primary, secondary: LightColor.primary),
  );
  final darkTheme = ThemeData.dark().copyWith(
    primaryColor: LightColor.primaryDark,
    cardColor: LightColor.cardDark,
    scaffoldBackgroundColor: LightColor.backgroundDark,
    shadowColor: LightColor.shadowDark,
    textTheme: GoogleFonts.poppinsTextTheme(),
    colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: LightColor.primary, secondary: LightColor.primaryDark),
  );

  static globalFont({TextStyle? style}) {
    if (style == null) {
      return GoogleFonts.poppins();
    }
    return GoogleFonts.montserrat(textStyle: style);
  }
}

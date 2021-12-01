import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeConfig {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    backgroundColor: Colors.white,
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: GoogleFonts.poppins().fontFamily,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: Colors.black,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.black,
    fontFamily: GoogleFonts.poppins().fontFamily,
  );
}

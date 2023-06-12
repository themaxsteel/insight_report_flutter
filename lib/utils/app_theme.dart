import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF40b58e);

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey[100],
    useMaterial3: true,
    colorSchemeSeed: const Color(0xFF40b58e),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(1000),
      ),
    ),
    appBarTheme: AppBarTheme(
      surfaceTintColor: Colors.grey[100],
      centerTitle: true,
      titleTextStyle: const TextStyle(fontSize: 18, color: Colors.black),
      backgroundColor: Colors.grey[100],
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
    ),
    fontFamily: GoogleFonts.poppins().fontFamily,
  );

  static final darkTheme = ThemeData(
    useMaterial3: false,
    colorSchemeSeed: const Color(0xFF000000),
    fontFamily: GoogleFonts.poppins().fontFamily,
  );
}

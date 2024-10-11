import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData theme = ThemeData(
  colorScheme: const ColorScheme.dark(
    brightness: Brightness.dark,
    surface: Color.fromARGB(255, 26, 25, 25),
    primary: Color.fromARGB(255, 240, 79, 5),
    secondary: Color.fromARGB(255, 48, 48, 48),
    tertiary: Color.fromARGB(255, 88, 88, 88),
  ),
  textTheme: TextTheme(
    displayLarge:
        GoogleFonts.caveat(fontSize: 96.0, fontWeight: FontWeight.bold),
    displayMedium:
        GoogleFonts.caveat(fontSize: 60.0, fontWeight: FontWeight.bold),
    displaySmall:
        GoogleFonts.caveat(fontSize: 48.0, fontWeight: FontWeight.bold),
    headlineLarge:
        GoogleFonts.caveat(fontSize: 34.0, fontWeight: FontWeight.bold),
    headlineMedium:
        GoogleFonts.caveat(fontSize: 24.0, fontWeight: FontWeight.bold),
    headlineSmall:
        GoogleFonts.caveat(fontSize: 20.0, fontWeight: FontWeight.bold),
    bodyLarge: GoogleFonts.caveat(fontSize: 16.0),
    bodyMedium: GoogleFonts.caveat(fontSize: 14.0),
    titleMedium: GoogleFonts.caveat(fontSize: 16.0),
    titleSmall: GoogleFonts.caveat(fontSize: 14.0),
    labelLarge: GoogleFonts.caveat(fontSize: 16.0, fontWeight: FontWeight.bold),
    bodySmall: GoogleFonts.caveat(fontSize: 12.0),
    labelSmall: GoogleFonts.caveat(fontSize: 10.0),
  ),
);

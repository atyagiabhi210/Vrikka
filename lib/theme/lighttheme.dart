import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

ThemeData lightMode = ThemeData(
  colorScheme: const ColorScheme.light(
    background: Colors.white,
    primary: Color.fromARGB(255, 23, 107, 135),
    secondary: Color.fromARGB(255, 134, 183, 246),
    tertiary: Color.fromARGB(255, 180, 213, 255),
    inversePrimary: Colors.black,
  ),
  fontFamily: 'Poppins',
  textTheme: TextTheme(
      headlineMedium: GoogleFonts.aBeeZee(
          fontSize: 28.sp,
          fontWeight: FontWeight.w700,
          color: Color.fromARGB(255, 134, 183, 246)),
      titleSmall: GoogleFonts.poppins(
        fontSize: 12.sp,
      ),
      titleLarge: GoogleFonts.aBeeZee(
          fontSize: 30.sp,
          fontWeight: FontWeight.w800,
          color: Colors.amber.shade900)),
);

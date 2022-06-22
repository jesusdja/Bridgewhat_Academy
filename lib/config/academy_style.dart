import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AcademyStyles {
  TextStyle styleLato({
    double size = 10,
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.normal,
    double? heightText,
    TextDecoration? textDecoration,
  }) {
    return GoogleFonts.lato(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
        height: heightText,
        decoration: textDecoration
    );
  }

  TextStyle stylePoppins({
    double size = 10,
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.normal,
    double? heightText,
    TextDecoration? textDecoration,
  }) {
    return GoogleFonts.poppins(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
        height: heightText,
        decoration: textDecoration
    );
  }
}

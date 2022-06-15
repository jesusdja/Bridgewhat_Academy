
import 'package:academybw/config/academy_colors.dart';
import 'package:flutter/material.dart';

Widget circularProgressColors({
  double widthContainer1 = 30,
  double widthContainer2 = 20,
  Color colorCircular = AcademyColors.primary,
  double strokeWidth = 3
}){
  return SizedBox(
    width: widthContainer1,
    child: Center(
      child: SizedBox(
        height: widthContainer2, width: widthContainer2,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(colorCircular),
          strokeWidth: strokeWidth,
        ),
      ),
    ),
  );
}
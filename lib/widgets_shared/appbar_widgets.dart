import 'package:academybw/config/academy_colors.dart';
import 'package:academybw/config/academy_style.dart';
import 'package:flutter/material.dart';

AppBar appBarWidget({
  double sizeH = 10,
  void Function()? onTap,
  String title = '',
  Color colorIcon = Colors.white,
  TextStyle? styleTitle,
  TextAlign alignTitle = TextAlign.center,
  Color backgroundColor = AcademyColors.primary,
  double elevation = 5,
  IconData icon = Icons.arrow_back_outlined,
  bool centerTitle = true,
  List<Widget> actions = const [],
  }){

  styleTitle = styleTitle ?? AcademyStyles().styleLato(size: sizeH * 0.023,color: Colors.white,fontWeight: FontWeight.bold);

  return AppBar(
    backgroundColor: backgroundColor,
    elevation: elevation,
    leading: InkWell(
      child: Icon(icon,size: sizeH * 0.03,color: colorIcon,),
      onTap: onTap,
    ),
    centerTitle: centerTitle,
    title: Text(title,style: styleTitle,textAlign: alignTitle,),
    actions: actions,
  );
}
import 'package:academybw/config/academy_colors.dart';
import 'package:academybw/config/academy_style.dart';
import 'package:academybw/main.dart';
import 'package:flutter/material.dart';


Widget bannerTitle({required int type, String? descrip, String? titleSt}){


  Widget avatar = CircleAvatar(
    backgroundColor: AcademyColors.primary,
    radius: sizeH * 0.028,
    child: Center(
      child: Container(
        width: sizeH * 0.03,
        height: sizeH * 0.03,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: Image.asset('assets/image/Exclude_$type.png').image,
              fit: BoxFit.fitWidth
          ),
        ),
      ),
    ),
  );

  String title = 'NEWS';
  double marginL = sizeW * 0.03;
  String description = descrip ?? 'Positioning & Targeting';
  if(type == 1){title = '20 LOG'; }
  if(type == 2){title = 'CARTOONS';}
  if(type == 3){title = 'DEMO';description = 'Bridewhat demos';}
  if(type == 4){title = 'QUIZ LEVELS OF GROWTH';}
  if(type == 5){description = 'Advisors';}
  if(type == 6){
    title = 'LEVERS';
    description = '20 LEVERS OF GROWTH (20 LOG)';
    avatar = Container(); marginL = 0;
  }

  title = titleSt ?? title;

  return SizedBox(
    width: sizeW,
    child: Row(
      children: [
        avatar,
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: marginL),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,style: AcademyStyles().stylePoppins(fontWeight: FontWeight.bold,color: AcademyColors.colors_787878,size: sizeH * 0.022)),
                Text(description,style: AcademyStyles().styleLato(size: sizeH * 0.018,color: AcademyColors.primary)),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
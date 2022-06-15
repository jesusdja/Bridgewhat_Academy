import 'package:academybw/config/academy_colors.dart';
import 'package:academybw/config/academy_style.dart';
import 'package:flutter/material.dart';

class ButtonGeneral extends StatelessWidget {
  final String? title;
  final VoidCallback? onPressed;
  final double? radius;
  final double height;
  final double width;
  final double textSize;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final bool bold;
  final EdgeInsets margin;
  final EdgeInsets titlePadding;
  final IconData? icon;
  final TextStyle? textStyle;
  final int? maxLines;
  final bool isBoxShadow;
  final Color colorBoxShadow;
  final double spreadRadiusBoxShadow;
  final double blurRadiusBoxShadow;
  final Offset offsetBoxShadow;
  final bool loadButton;
  final Color colorCircular;
  final Widget? widgetLatIzq;
  final Widget? widgetLatDer;

  const ButtonGeneral({
    Key? key,
    required this.title,
    required this.onPressed,
    this.radius = 10,
    this.bold = false,
    this.icon,
    this.height = 10,
    this.width = 30,
    this.textSize = 16.0,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.transparent,
    this.textColor = Colors.black,
    this.margin = const EdgeInsets.all(0.0),
    this.titlePadding = const EdgeInsets.all(0.0),
    this.textStyle,
    this.maxLines,
    this.isBoxShadow = false,
    this.colorBoxShadow = Colors.grey,
    this.spreadRadiusBoxShadow = 1,
    this.blurRadiusBoxShadow = 15,
    this.offsetBoxShadow = const Offset(0,0),
    this.loadButton = false,
    this.colorCircular = AcademyColors.primary,
    this.widgetLatIzq,
    this.widgetLatDer,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {

    TextStyle textStyleLocal = textStyle ?? AcademyStyles().stylePrimary();

    return Container(
      margin: margin,
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 0),
        color: backgroundColor,
        border: Border.all(
          color: borderColor,
          width: 1.5,
          style: BorderStyle.solid,
        ),
        boxShadow:  [
          isBoxShadow ? BoxShadow(
            color: colorBoxShadow,
            spreadRadius: spreadRadiusBoxShadow,
            blurRadius: blurRadiusBoxShadow,
            offset: offsetBoxShadow,
          ) : const BoxShadow(),
        ]
      ),
      child:
      loadButton ?
      Center(
        child: SizedBox(
          height: height * 0.6,width: height * 0.6,
          child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(colorCircular))
        ),
      )
          :
      Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: AcademyColors.primary.withOpacity(0.5),
          borderRadius: BorderRadius.circular(radius ?? 0),
          onTap: onPressed,
          child: Center(
            child: Padding(
              padding: titlePadding,
              child: icon != null ? Icon(icon,color: textColor,) :
              Row(
                children: [
                  widgetLatDer ?? Container(),
                  Expanded(
                    child: Text(
                      title ?? '',
                      maxLines: maxLines,
                      style: textStyleLocal,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  widgetLatIzq ?? Container()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

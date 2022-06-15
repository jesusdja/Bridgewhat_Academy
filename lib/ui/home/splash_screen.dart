import 'package:academybw/config/academy_colors.dart';
import 'package:academybw/widgets_shared/circular_progress_colors.dart';
import 'package:flutter/material.dart';

class BasicSplash extends StatelessWidget {
  const BasicSplash({Key? key}) : super(key: key);

  Future<bool> exit() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {

    double sizeH = MediaQuery.of(context).size.height;
    double sizeW = MediaQuery.of(context).size.width;

    return WillPopScope(
        child: Scaffold(
          backgroundColor: AcademyColors.primary,
          body: Center(
            child: SizedBox(
              width: sizeW,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: sizeH * 0.25,
                    margin: EdgeInsets.symmetric(horizontal: sizeW * 0.2),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: Image.asset('assets/image/logo_fondo_transparente.png').image,
                            fit: BoxFit.fitWidth
                        )
                    ),
                  ),
                  circularProgressColors(widthContainer1: sizeW,widthContainer2: sizeH * 0.03,colorCircular: Colors.white)
                ],
              ),
            ),
          ),
        ),
        onWillPop: exit
    );
  }
}
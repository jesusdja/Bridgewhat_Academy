import 'package:academybw/config/academy_colors.dart';
import 'package:academybw/config/academy_style.dart';
import 'package:academybw/main.dart';
import 'package:academybw/ui/home/home_page.dart';
import 'package:academybw/ui/home/send_email.dart';
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

Widget headerShared({required BuildContext context, Color color = AcademyColors.primary, required GlobalKey<ScaffoldState> scaffoldKey, bool viewSca = true}){
  return Container(
    width: sizeW,
    margin: EdgeInsets.only(left: sizeW * 0.02, right: sizeW * 0.03,top: sizeH * 0.02, bottom: sizeH * 0.02),
    child: Row(
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back_ios,size: sizeH * 0.035,color: color),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
        Container(
          height: sizeH * 0.1,
          width: sizeW * 0.25,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: Image.asset('assets/image/logo_colores_fondo_transparente.png').image,
                fit: BoxFit.fitWidth
            ),
          ),
        ),
        if(viewSca)...[
          Expanded(child: Container()),
          IconButton(
            icon: Icon(Icons.email,size: sizeH * 0.03,color: AcademyColors.primary),
            onPressed: (){
              Navigator.push(context,MaterialPageRoute<void>(
                  builder: (context) => const SendEmail()),);
            },
          ),
          IconButton(
            icon: Icon(Icons.menu,size: sizeH * 0.04,color: AcademyColors.primary),
            onPressed: (){
              scaffoldKey.currentState!.openEndDrawer();
            },
          ),
        ],
      ],
    ),
  );
}
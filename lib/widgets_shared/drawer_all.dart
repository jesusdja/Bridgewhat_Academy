import 'package:academybw/config/academy_colors.dart';
import 'package:academybw/config/academy_style.dart';
import 'package:academybw/main.dart';
import 'package:academybw/services/finish_app.dart';
import 'package:academybw/ui/menu/levers/levers_page.dart';
import 'package:flutter/material.dart';


class AppDrawerAll extends StatelessWidget {
  const AppDrawerAll({Key? key, required this.contextAll}) : super(key: key);
  final BuildContext contextAll;

  @override
  Widget build(BuildContext context) {
    Widget divide = const Divider();
    return Container(
      width: sizeW * 0.6,
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(height: sizeH * 0.02,),
          Container(
            height: sizeH * 0.2,
            width: sizeH * 0.2,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: Image.asset('assets/image/icon_app.png').image,
                  fit: BoxFit.fitWidth
              ),
            ),
          ),
          Expanded(child: Container()),
          titleDrawer(type: 1),
          divide,
          titleDrawer(type: 2),
          titleDrawer(type: 0),
          divide,
          SizedBox(height: sizeH * 0.02,),
        ],
      ),
    );
  }

  Widget titleDrawer({required int type}){
    String title = 'SignOut';
    if(type == 1){title = '20 Levers of growth (20 LOG)'; }
    if(type == 2){title = 'Settings'; }

    return InkWell(
      onTap: (){
        if(type == 0){ signOut(); }
        if(type == 1){
          Navigator.of(contextAll).pop();
          Navigator.push(contextAll,MaterialPageRoute<void>(
              builder: (context) => const LeversPage()),);

        }
      },
      child: Container(
        width: sizeW,
        margin: EdgeInsets.only(left: sizeW * 0.03,bottom: sizeH * 0.01, top: sizeH * 0.01),
        child: Text(title,textAlign: TextAlign.left,
            style: AcademyStyles().stylePoppins(size: sizeH * 0.018,color: AcademyColors.primary,fontWeight: FontWeight.bold)),
      ),
    );
  }

  Future signOut() async{
    await finishApp();
    Navigator.pushReplacement(contextAll, MaterialPageRoute(builder:
        (BuildContext context) => const AppState()));
  }
}



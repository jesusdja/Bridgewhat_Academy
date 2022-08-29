import 'package:academybw/config/academy_colors.dart';
import 'package:academybw/config/academy_style.dart';
import 'package:academybw/main.dart';
import 'package:academybw/providers/menu_provider.dart';
import 'package:academybw/providers/post_provider.dart';
import 'package:academybw/services/finish_app.dart';
import 'package:academybw/ui/menu/cartoons/cartoons_page.dart';
import 'package:academybw/ui/menu/demo/demo_page.dart';
import 'package:academybw/ui/menu/levers/levers_page.dart';
import 'package:academybw/ui/menu/post/post_page.dart';
import 'package:academybw/ui/menu/videos/videos_page.dart';
import 'package:academybw/widgets_shared/circular_progress_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late MenuProvider menuProvider;
  bool loadSignOut = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: AcademyColors.primary,
    ));
  }

  @override
  Widget build(BuildContext context) {

    menuProvider = Provider.of<MenuProvider>(context);

    return SafeArea(
      child: GestureDetector(
        onTap: (){
          Provider.of<PostProvider>(context).viewContainerLikePost(idPost: 0);
        },
        child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.white,
          endDrawer: appDrawer(),
          body: Column(
            children: [
              SizedBox(height: sizeH * 0.01,),
              headerContainer(),
              SizedBox(height: sizeH * 0.02,),
              Expanded(
                child: optionMenu(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget headerContainer(){
    return Container(
      width: sizeW,
      margin: EdgeInsets.only(left: sizeW * 0.06, right: sizeW * 0.03),
      child: Row(
        children: [
          iconApp(),
          Expanded(child: Container()),
          IconButton(
            icon: Icon(Icons.info,size: sizeH * 0.035,color: AcademyColors.primary),
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.menu,size: sizeH * 0.04,color: AcademyColors.primary),
            onPressed: (){
              _scaffoldKey.currentState!.openEndDrawer();
              //menuProvider.changeMenu(MenuStatus.home);
            },
          ),
        ],
      ),
    );
  }

  Widget iconApp(){
    return Container(
      height: sizeH * 0.1,
      width: sizeW * 0.25,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: Image.asset('assets/image/logo_colores_fondo_transparente.png').image,
            fit: BoxFit.fitWidth
        ),
      ),
    );
  }

  Widget appDrawer(){

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
                  image: Image.asset('assets/image/icon_app_new.jpg').image,
                  fit: BoxFit.fitWidth
              ),
            ),
          ),
          Expanded(child: Container()),
          titleDrawer(type: 1),
          divide,
          titleDrawer(type: 2),
          loadSignOut ?
          Container(
            padding: EdgeInsets.symmetric(vertical: sizeH * 0.06),
            child: Center(
              child: circularProgressColors(),
            ),
          ) : titleDrawer(type: 0),
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
          Navigator.of(context).pop();
          Navigator.push(context,MaterialPageRoute<void>(
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
    loadSignOut = true;
    setState(() {});

    await finishApp();
    Navigator.pushReplacement(context, MaterialPageRoute(builder:
        (BuildContext context) => const AppState()));

    loadSignOut = false;
    setState(() {});
  }

  Widget optionMenu(){
    return SizedBox(
      width: sizeW,
      child: Column(
        children: [
          Expanded(
            child: cardMenu(type: 0),
          ),
          Expanded(
            child: cardMenu(type: 1),
          ),
          Expanded(
            child: cardMenu(type: 2),
          ),
          Expanded(
            child: cardMenu(type: 3),
          ),
          // cardMenu(type: 0),
          // cardMenu(type: 1),
          // cardMenu(type: 2),
          // cardMenu(type: 3),
        ],
      ),
    );
  }

  Widget cardMenu({required int type}){
    String title = 'NEWS';
    String description = 'View Bridgewhat\nparticipant´s posts';
    if(type == 1){title = '20 LOG'; description = 'Learn about the Bridgewhat\n20 Levers of Growth';}
    if(type == 2){title = 'CARTOONS';description = 'Have fun with\nBridgewhat Cartoons';}
    if(type == 3){title = 'DEMO';description = 'Bridgewhat features\nat a glance';}


    return InkWell(
      onTap: (){

        Widget push = Container();

        if(type == 0){ push = const PostPage(); }
        if(type == 1){ push = const VideosPage(); }
        if(type == 2){ push = const CartoonsPage(); }
        if(type == 3){ push = const DemoPage(); }


        Navigator.push(context,MaterialPageRoute<void>(
            builder: (context) => push),);
      },
      child: Container(
        width: sizeW,
        margin: EdgeInsets.only(left: sizeW * 0.07,right: sizeW * 0.07,bottom: sizeH * 0.02),
        //padding: EdgeInsets.symmetric(vertical: sizeH * 0.035),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: AcademyColors.primary
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: sizeW * 0.1),
              child: Center(
                child: Container(
                  width: sizeW * 0.11,
                  height: sizeH * 0.08,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: Image.asset('assets/image/Exclude_$type.png').image,
                        fit: BoxFit.fitWidth
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: sizeW * 0.035),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(title,textAlign: TextAlign.center,
                        style: AcademyStyles().stylePoppins(size: sizeH * 0.022,color: Colors.white,fontWeight: FontWeight.bold)),
                    FittedBox(
                      fit:BoxFit.contain,
                      child: Text(description,textAlign: TextAlign.center,
                          style: AcademyStyles().stylePoppins(size: sizeH * 0.016,color: Colors.white)),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


}

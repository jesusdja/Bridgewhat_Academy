import 'package:academybw/config/academy_colors.dart';
import 'package:academybw/config/academy_style.dart';
import 'package:academybw/main.dart';
import 'package:academybw/services/shared_preferences.dart';
import 'package:academybw/ui/home/provider/menu_provider.dart';
import 'package:academybw/ui/login/forgot_password.dart';
import 'package:academybw/ui/menu/demo/demo_page_3.dart';
import 'package:academybw/ui/menu/post/provider/post_provider.dart';
import 'package:academybw/services/finish_app.dart';
import 'package:academybw/ui/home/send_email.dart';
import 'package:academybw/ui/menu/cartoons/cartoons_page.dart';
import 'package:academybw/ui/menu/levers/levers_page.dart';
import 'package:academybw/ui/menu/post/post_page.dart';
import 'package:academybw/ui/menu/videos/videos_page.dart';
import 'package:academybw/widgets_shared/circular_progress_colors.dart';
import 'package:academybw/widgets_shared/dialog_alert.dart';
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
  bool loadDelete = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: AcademyColors.primary,
    ));
  }

  Future<bool> exit() async {

    if(menuProvider.status != MenuStatus.home){
      menuProvider.changeMenu(MenuStatus.home);
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {

    menuProvider = Provider.of<MenuProvider>(context);

    Widget childBody = optionMenu();
    if(menuProvider.status == MenuStatus.news){ childBody = const PostPage(); }
    if(menuProvider.status == MenuStatus.log){ childBody = const VideosPage(); }
    if(menuProvider.status == MenuStatus.cartoons){ childBody = const CartoonsPage(); }
    if(menuProvider.status == MenuStatus.demo){ childBody = const DemoPage3(); }

    return WillPopScope(
      onWillPop: exit,
      child: SafeArea(
        child: GestureDetector(
          onTap: (){
            Provider.of<PostProvider>(context).viewContainerLikePost(idPost: 0);
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            endDrawer: appDrawer(),
            body: Column(
              children: [
                SizedBox(height: sizeH * 0.01,),
                headerContainer(),
                SizedBox(height: sizeH * 0.01,),
                Expanded(
                  child: childBody,
                ),
                SizedBox(height: sizeH * 0.01,),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget headerContainer(){
    return Container(
      width: sizeW,
      margin: EdgeInsets.only(left: sizeW * 0.08, right: sizeW * 0.05),
      child: Row(
        children: [
          menuProvider.status != MenuStatus.home ? SizedBox(
            width: sizeW * 0.07,
            child:  InkWell(
              child: Icon(Icons.arrow_back_ios,size: sizeH * 0.035,color: AcademyColors.primary),
              onTap: (){
                menuProvider.changeMenu(MenuStatus.home);
              },
            ) ,
          ): Container(),
          iconApp(),
          Expanded(child: Container()),
          IconButton(
            icon: const Icon(Icons.email,size: 28,color: AcademyColors.primary),
            onPressed: (){
              Navigator.push(context,MaterialPageRoute<void>(
                  builder: (context) => const SendEmail()),);
            },
          ),
          IconButton(
            icon: const Icon(Icons.menu,size: 30,color: AcademyColors.primary),
            onPressed: (){
              scaffoldKey.currentState!.openEndDrawer();
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
                  image: Image.asset('assets/image/icon_app.png').image,
                  fit: BoxFit.fitWidth
              ),
            ),
          ),
          Expanded(child: Container()),
          titleDrawer(type: 1),
          divide,
          titleDrawer(type: 3),
          titleDrawer(type: 5),
          loadDelete ?
          SizedBox(
            height: sizeH * 0.02,
            child: Center(
              child: circularProgressColors(widthContainer2: sizeH * 0.02,widthContainer1: sizeW),
            ),
          ) : titleDrawer(type: 4),
          loadSignOut ?
          SizedBox(
            height: sizeH * 0.02,
            child: Center(
              child: circularProgressColors(widthContainer2: sizeH * 0.02,widthContainer1: sizeW),
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
    if(type == 3){title = 'Contact'; }
    if(type == 4){title = 'Delete account'; }
    if(type == 5){title = 'Change password'; }

    return InkWell(
      onTap: (){
        if(type == 0){ signOut(); }
        if(type == 4){ deleteAccount(); }
        if(type == 1){
          Navigator.of(context).pop();
          Navigator.push(context,MaterialPageRoute<void>(
              builder: (context) => const LeversPage()),);
        }
        if(type == 3){
          Navigator.of(context).pop();
          Navigator.push(context,MaterialPageRoute<void>(
              builder: (context) => const SendEmail()),);
        }
        if(type == 5){
          Navigator.of(context).pop();
          Navigator.push(context, MaterialPageRoute(builder:
            (BuildContext context) => ForgotPass(
            email: SharedPreferencesLocal.prefs.getString('AcademyEmail') ?? '',isLogin: false),));
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

  Future deleteAccount() async{
    loadDelete = true;
    setState(() {});

    if(await alertDeleteAccount(context)){
      await finishApp();
      Navigator.pushReplacement(context, MaterialPageRoute(builder:
          (BuildContext context) => const AppState()));
    }

    loadDelete = false;
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
        if(type == 0){ menuProvider.changeMenu(MenuStatus.news); }
        if(type == 1){ menuProvider.changeMenu(MenuStatus.log); }
        if(type == 2){ menuProvider.changeMenu(MenuStatus.cartoons); }
        if(type == 3){ menuProvider.changeMenu(MenuStatus.demo); }
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

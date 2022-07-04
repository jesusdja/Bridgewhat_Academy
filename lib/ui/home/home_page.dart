import 'package:academybw/config/academy_colors.dart';
import 'package:academybw/config/academy_style.dart';
import 'package:academybw/main.dart';
import 'package:academybw/providers/menu_provider.dart';
import 'package:academybw/providers/post_provider.dart';
import 'package:academybw/ui/menu/cartoons/cartoons_page.dart';
import 'package:academybw/ui/menu/demo/demo_page.dart';
import 'package:academybw/ui/menu/post/post_page.dart';
import 'package:academybw/ui/menu/videos/videos_page.dart';
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

    Widget option = optionMenu();

    if(menuProvider.status == MenuStatus.post){
      option = const PostPage();
    }
    if(menuProvider.status == MenuStatus.videos){
      option = const VideosPage();
    }
    if(menuProvider.status == MenuStatus.cartoons){
      option = const CartoonsPage();
    }
    if(menuProvider.status == MenuStatus.demo){
      option = const DemoPage();
    }

    return SafeArea(
      child: GestureDetector(
        onTap: (){
          Provider.of<PostProvider>(context).viewContainerLikePost(idPost: 0);
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              SizedBox(height: sizeH * 0.01,),
              headerContainer(),
              SizedBox(height: sizeH * 0.02,),
              Expanded(
                child: option,
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
            icon: Icon(Icons.menu,size: sizeH * 0.04,color: menuProvider.status == MenuStatus.home ? Colors.grey[300] : AcademyColors.primary),
            onPressed: (){
              menuProvider.changeMenu(MenuStatus.home);
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

  Widget optionMenu(){
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: SizedBox(
        width: sizeW,
        child: Column(
          children: [
            cardMenu(type: 0),
            cardMenu(type: 1),
            cardMenu(type: 2),
            cardMenu(type: 3),
          ],
        ),
      ),
    );
  }

  Widget cardMenu({required int type}){
    String title = 'POST';
    String description = 'View Bridgewhat participant´s posts';
    if(type == 1){title = 'VIDEOS'; description = 'Learn about the Bridgewhat 20 Levers of Growth';}
    if(type == 2){title = 'CARTOONS';description = 'Have fun with Bridgewhat Cartoons';}
    if(type == 3){title = 'DEMO';description = 'Bridgewhat features at a glance';}


    return InkWell(
      onTap: (){
        if(type == 0){ menuProvider.changeMenu(MenuStatus.post); }
        if(type == 1){ menuProvider.changeMenu(MenuStatus.videos); }
        if(type == 2){ menuProvider.changeMenu(MenuStatus.cartoons); }
        if(type == 3){ menuProvider.changeMenu(MenuStatus.demo); }
      },
      child: Container(
        width: sizeW,
        margin: EdgeInsets.only(left: sizeW * 0.07,right: sizeW * 0.07,bottom: sizeH * 0.02),
        padding: EdgeInsets.symmetric(vertical: sizeH * 0.04),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: AcademyColors.primary
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: sizeW * 0.15),
              child: Center(
                child: Container(
                  width: sizeW * 0.12,
                  height: sizeH * 0.1,
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
                    style: AcademyStyles().stylePoppins(size: sizeH * 0.023,color: Colors.white,fontWeight: FontWeight.bold)),
                    Text(description,textAlign: TextAlign.center,
                        style: AcademyStyles().stylePoppins(size: sizeH * 0.018,color: Colors.white)),
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

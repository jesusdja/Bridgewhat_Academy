import 'dart:math' as math;
import 'package:academybw/config/academy_colors.dart';
import 'package:academybw/config/academy_style.dart';
import 'package:academybw/main.dart';
import 'package:academybw/utils/get_data.dart';
import 'package:academybw/widgets_shared/widgets_shared.dart';
import 'package:flutter/material.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {

  List<Map<String,dynamic>> listPost = [];

  @override
  void initState() {
    super.initState();
    var rng = math.Random();
    for(int x = 0; x < 10; x++){
      Map<String,dynamic> post = {
        'id' : x,
        'user' : 'Acenture',
        'title' : 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        'description' : 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut amet, volutpat risus aliquam malesuada quis. Eu, adipiscing egestas volutpat quis platea tempus vitae, fermentum tincidunt...',
        'like' : rng.nextInt(100),
        'shared' : rng.nextInt(100),
        'followers' : rng.nextInt(10000),
        'lecture' : '${rng.nextInt(30).round()}',
        'date' : 'March 30 2022, 13:21',
      };
      listPost.add(post);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        width: sizeW,
        margin: EdgeInsets.symmetric(horizontal: sizeW * 0.06),
        child: Column(
          children: [
            bannerTitle(type: 0),
            SizedBox(height: sizeH * 0.04),
            cardContainer(),
          ],
        ),
      ),
    );
  }

  Widget cardContainer(){

    List<Widget> listW = [];
    for (var element in listPost) {
      listW.add(CardPostContainer(post: element));
    }

    return SizedBox(
      width: sizeW,
      child: Column(
        children: listW,
      ),
    );
  }
}

class CardPostContainer extends StatefulWidget {
  const CardPostContainer({Key? key, required this.post}) : super(key: key);

  final Map<String,dynamic> post;

  @override
  State<CardPostContainer> createState() => _CardPostContainerState();
}

class _CardPostContainerState extends State<CardPostContainer> {

  Map<String,dynamic> post = {};

  @override
  void initState() {
    super.initState();
    post = widget.post;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: sizeW,
      child: Column(
        children: [
          cardPostTop(),
          cardPostImg(),
          cardBottom(),
        ],
      ),
    );
  }

  Widget cardPostTop(){

    String nameUser = post['user'];
    String cantFollowers = '${numberFormat(double.parse('${post['followers']}')).split(',')[0]} followers';
    String lecture = '${post['lecture']} min lecture';
    String dateSt = post['date'];

    return Container(
      width: sizeW,
      margin: EdgeInsets.only(bottom: sizeH * 0.02),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: sizeH * 0.07,
            width: sizeH * 0.07,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: Image.asset('assets/image/img_acenture.png').image,
                    fit: BoxFit.fitWidth
                )
            ),
          ),
          SizedBox(width: sizeW * 0.02,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(nameUser,style: AcademyStyles().styleLato(
                  size: sizeH * 0.02,
                  color: AcademyColors.colors_787878
              )),
              Text(cantFollowers,style: AcademyStyles().styleLato(
                  size: sizeH * 0.015,
                  color: AcademyColors.colors_737373
              )),
            ],
          ),
          Expanded(child: Container()),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(lecture,style: AcademyStyles().styleLato(
                  size: sizeH * 0.015,
                  color: AcademyColors.colors_737373
              )),
              Text(dateSt,style: AcademyStyles().styleLato(
                  size: sizeH * 0.015,
                  color: AcademyColors.colors_737373
              )),
            ],
          )
        ],
      ),
    );
  }

  Widget cardPostImg(){
    return Container(
      width: sizeW,
      height: sizeH * 0.22,
      margin: EdgeInsets.only(bottom: sizeH * 0.02),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        image: DecorationImage(
            image: Image.asset('assets/image/img_example.png').image,
            fit: BoxFit.fill
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: EdgeInsets.only(bottom: sizeH * 0.015,right: sizeW * 0.1),
              height: sizeH * 0.03,
              width: sizeH * 0.03,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: Image.asset('assets/image/button_like.png').image,
                      fit: BoxFit.fitWidth
                  )
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: EdgeInsets.only(bottom: sizeH * 0.015,right: sizeW * 0.025),
              height: sizeH * 0.03,
              width: sizeH * 0.03,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: Image.asset('assets/image/button_shared.png').image,
                      fit: BoxFit.fitWidth
                  )
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget cardBottom(){

    String title = post['title'];
    String likeSt = '${numberFormat(double.parse('${post['like']}')).split(',')[0]} likes';
    String sharedSt = '${numberFormat(double.parse('${post['shared']}')).split(',')[0]} times shared';

    TextStyle style = AcademyStyles().styleLato(size: 12,color: Colors.black);
    TextStyle style2 = AcademyStyles().styleLato(size: 10,color: Colors.white);

    return Container(
      width: sizeW,
      margin: EdgeInsets.only(bottom: sizeH * 0.02),
      child: Column(
        children: [
          SizedBox(
            width: sizeW,
            child: Row(
              children: [
                Expanded(
                  child: Text(title,style: style),
                ),
                SizedBox(width: sizeW * 0.1,),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: sizeW * 0.015,vertical: sizeH * 0.01),
                    decoration: const BoxDecoration(
                      color: AcademyColors.colors_787878,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Row(
                      children: [
                        Expanded(child: Text(likeSt,style: style2),),
                        Container(width: 5),
                        Expanded(child: Text(sharedSt,style: style2)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}


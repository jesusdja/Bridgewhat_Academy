import 'package:academybw/config/academy_colors.dart';
import 'package:academybw/config/academy_style.dart';
import 'package:academybw/main.dart';
import 'package:academybw/providers/cartoons_provider.dart';
import 'package:academybw/utils/get_data.dart';
import 'package:academybw/widgets_shared/appbar_widgets.dart';
import 'package:academybw/widgets_shared/widgets_shared.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartoonsPage extends StatefulWidget {
  const CartoonsPage({Key? key}) : super(key: key);

  @override
  State<CartoonsPage> createState() => _CartoonsPageState();
}

class _CartoonsPageState extends State<CartoonsPage> {

  late CartoonsProvider cartoonsProvider;

  @override
  void initState() {
    super.initState();
    initialData();
  }

  initialData(){
    Future.delayed(const Duration(milliseconds: 100)).then((value){
      cartoonsProvider.viewContainerLikePost(idPost: 0);
      cartoonsProvider.viewContainerSharedPost(idPost: 0);
    });
  }

  @override
  Widget build(BuildContext context) {

    cartoonsProvider = Provider.of<CartoonsProvider>(context);

    return GestureDetector(
      onTap: (){
        cartoonsProvider.viewContainerLikePost(idPost: 0);
        cartoonsProvider.viewContainerSharedPost(idPost: 0);
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              headerShared(context: context),
              Container(
                width: sizeW,
                margin: EdgeInsets.symmetric(horizontal: sizeW * 0.06),
                child: bannerTitle(type: 2)
              ),
              SizedBox(height: sizeH * 0.04),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Container(
                    width: sizeW,
                    margin: EdgeInsets.symmetric(horizontal: sizeW * 0.06),
                    child: Column(
                      children: [
                        cardContainer(),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
      ),
    );
  }

  Widget cardContainer(){

    List<Widget> listW = [];
    for (var element in cartoonsProvider.listCartoons) {
      listW.add(CardCartoonsContainer(cartoon: element));
    }

    return SizedBox(
      width: sizeW,
      child: Column(
        children: listW,
      ),
    );
  }
}

class CardCartoonsContainer extends StatefulWidget {
  const CardCartoonsContainer({Key? key, required this.cartoon}) : super(key: key);

  final Map<String,dynamic> cartoon;

  @override
  State<CardCartoonsContainer> createState() => _CardCartoonsContainerState();
}

class _CardCartoonsContainerState extends State<CardCartoonsContainer> {

  Map<String,dynamic> cartoon = {};
  late CartoonsProvider cartoonsProvider;
  List<String> listTitleLikes = ['','Like','Love','Wow','Clap','Curious','Insightful'];
  List<String> listTitleShared = ['','Linkedin','Instagram','Twitter','Facebook'];

  @override
  void initState() {
    super.initState();
    cartoon = widget.cartoon;
  }

  @override
  Widget build(BuildContext context) {

    cartoonsProvider = Provider.of<CartoonsProvider>(context);

    return SizedBox(
      width: sizeW,
      child: Column(
        children: [
          cardPostImg(),
          textDescription(),
          SizedBox(height: sizeH * 0.05),
        ],
      ),
    );
  }

  Widget cardPostImg(){
    return Column(
      children: [
        Container(
          width: sizeW,
          height: sizeH * 0.4,
          margin: EdgeInsets.only(bottom: sizeH * 0.02),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            image: DecorationImage(
                image: Image.asset('assets/image/${cartoon['image']}').image,
                fit: BoxFit.fill
            ),
          ),
        ),
      ],
    );
  }

  Widget textDescription(){

    String description = cartoon['description'];

    Widget textMore = Container();

    if(description.length > 150){
      bool isMoreActive = cartoonsProvider.cartoonsViewMoreDescription[cartoon['id']!]!;
      if(isMoreActive){
        textMore = Text(description,style: AcademyStyles().styleLato(size: 12,color: AcademyColors.colors_787878),);
      }else{
        textMore =  InkWell(
          onTap: (){
            cartoonsProvider.viewContainerMoreDescriptionPost(idPost: cartoon['id']);
          },
          child: SizedBox(
            child: RichText(
              text: TextSpan(
                text: description.substring(0,150), // _snapshot.data['username']
                style: AcademyStyles().styleLato(size: 12,color: AcademyColors.colors_787878),
                children: <TextSpan>[
                  TextSpan(
                    text: '. . .  More',
                    style: AcademyStyles().styleLato(size: 12,color: AcademyColors.primary),
                  )
                ],
              ),
            ),
          ),
        );
      }
    }else{
      textMore = Text(description,style: AcademyStyles().styleLato(size: 12,color: AcademyColors.colors_787878),);
    }
    return textMore;
  }
}

class CardCartoonsContainer2 extends StatefulWidget {
  const CardCartoonsContainer2({Key? key, required this.cartoon}) : super(key: key);

  final Map<String,dynamic> cartoon;

  @override
  State<CardCartoonsContainer2> createState() => _CardCartoonsContainerState2();
}

class _CardCartoonsContainerState2 extends State<CardCartoonsContainer2> {

  Map<String,dynamic> cartoon = {};
  late CartoonsProvider cartoonsProvider;
  List<String> listTitleLikes = ['','Like','Love','Wow','Clap','Curious','Insightful'];
  List<String> listTitleShared = ['','Linkedin','Instagram','Twitter','Facebook'];

  @override
  void initState() {
    super.initState();
    cartoon = widget.cartoon;
  }

  @override
  Widget build(BuildContext context) {

    cartoonsProvider = Provider.of<CartoonsProvider>(context);

    bool postSelectLike = cartoonsProvider.cartoonsLikes[cartoon['id']] ?? false;
    bool postSelectShared = cartoonsProvider.cartoonsShared[cartoon['id']] ?? false;

    return Stack(
      children: [
        SizedBox(
          width: sizeW,
          child: Column(
            children: [
              cardPostTop(),
              SizedBox(
                width: sizeW,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: cardPostImg(),
                    ),
                    SizedBox(width: sizeW * 0.05),
                    Expanded(
                      child: cardIzq(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: sizeH * 0.02),
            ],
          ),
        ),
        if(postSelectLike)...[
          Container(
            margin: EdgeInsets.only(top: sizeH * 0.3,right: sizeW * 0.05,left: sizeW * 0.25),
            child: selectLike(),
          )
        ],

        if(postSelectShared)...[
          Container(
            margin: EdgeInsets.only(top: sizeH * 0.3),
            child: Row(
              children: [
                Expanded(
                  child: Container(),
                ),
                selectShared()
              ],
            ),
          )
        ],

      ],
    );
  }

  Widget cardPostTop(){

    String nameUser = cartoon['user'];
    String cantFollowers = '${numberFormat(double.parse('${cartoon['followers']}')).split(',')[0]} followers';
    String lecture = '${cartoon['lecture']} min lecture';
    String dateSt = cartoon['date'];

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

    String likeSt = '${numberFormat(double.parse('${cartoon['like']}')).split(',')[0]} likes';
    String sharedSt = '${numberFormat(double.parse('${cartoon['shared']}')).split(',')[0]} times shared';
    TextStyle style2 = AcademyStyles().styleLato(size: 10,color: Colors.white);

    return Column(
      children: [
        Container(
          width: sizeW,
          height: sizeH * 0.2,
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
                child: InkWell(
                  onTap: (){
                    cartoonsProvider.viewContainerLikePost(idPost: cartoon['id']);
                  },
                  child: Container(
                    height: sizeH * 0.03,
                    width: sizeH * 0.03,
                    margin: EdgeInsets.only(bottom: sizeH * 0.015,right: sizeW * 0.1),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: Image.asset('assets/image/button_like.png').image,
                            fit: BoxFit.fitWidth
                        )
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  onTap: (){
                    cartoonsProvider.viewContainerSharedPost(idPost: cartoon['id']);
                  },
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
                ),
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: sizeW * 0.03,vertical: sizeH * 0.005),
          decoration: const BoxDecoration(
            color: AcademyColors.colors_787878,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: FittedBox(
            fit:BoxFit.contain,
            child: Row(
              children: [
                Text(likeSt,style: style2),
                Container(width: 10),
                Text(sharedSt,style: style2),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget cardIzq(){

    String title = cartoon['title'];
    TextStyle style = AcademyStyles().styleLato(size: 12,color: Colors.black);

    return Container(
      width: sizeW,
      margin: EdgeInsets.only(bottom: sizeH * 0.02),
      child: Column(
        children: [
          SizedBox(
            width: sizeW,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(title,style: style),
                ),
              ],
            ),
          ),
          SizedBox(height:sizeH * 0.02,),
          textDescription(),
        ],
      ),
    );
  }

  Widget selectLike(){

    List<Widget> listW = [];
    for(int x = 1; x < 7; x++){
      listW.add(
        Container(
          margin: EdgeInsets.symmetric(horizontal: sizeW * 0.02),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: sizeH * 0.03,
                width: sizeH * 0.03,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: Image.asset('assets/image/like$x.png').image,
                        fit: BoxFit.fitHeight
                    )
                ),
              ),
              Text(listTitleLikes[x],style: AcademyStyles().styleLato(size: 12,color: AcademyColors.primary),)
            ],
          ),
        ),
      );
    }


    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        border: Border.all(
          width: 1.0,
          color: AcademyColors.primary,
        ),
      ),
      child: FittedBox(
        fit:BoxFit.contain,
        child: Row(
          children: listW,
        ),
      ),
    );
  }

  Widget selectShared(){

    List<Widget> listW = [];
    for(int x = 1; x < 5; x++){
      listW.add(
        Container(
          width: sizeW * 0.2,
          margin: EdgeInsets.symmetric(horizontal: sizeW * 0.02),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: sizeH * 0.03,
                width: sizeH * 0.03,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: Image.asset('assets/image/shared$x.png').image,
                        fit: BoxFit.fitWidth
                    )
                ),
              ),
              SizedBox(width: sizeW * 0.02,),
              Expanded(
                child: Text(listTitleShared[x],style: AcademyStyles().styleLato(size: 10,color: AcademyColors.primary)),
              ),
            ],
          ),
        ),
      );
      if(x < 4) {
        listW.add(
          Container(
            margin: EdgeInsets.symmetric(vertical: sizeH * 0.01),
            height: 0.5,
            width: sizeW * 0.2,
            color: AcademyColors.colorsC4C4C4,
          ),
        );
      }
    }


    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(0),
          topLeft: Radius.circular(10),
          bottomRight: Radius.circular(0),
          bottomLeft: Radius.circular(10),
        ),
        border: Border.all(
          width: 0.0,
          color: AcademyColors.primary,
        ),
      ),
      child: FittedBox(
        fit:BoxFit.contain,
        child: Column(
          children: listW,
        ),
      ),
    );
  }

  Widget textDescription(){

    String description = cartoon['description'];

    Widget textMore = Container();

    if(description.length > 150){
      bool isMoreActive = cartoonsProvider.cartoonsViewMoreDescription[cartoon['id']!]!;
      if(isMoreActive){
        textMore = Text(description,style: AcademyStyles().styleLato(size: 12,color: AcademyColors.colors_787878),);
      }else{
        textMore =  InkWell(
          onTap: (){
            cartoonsProvider.viewContainerMoreDescriptionPost(idPost: cartoon['id']);
          },
          child: SizedBox(
            child: RichText(
              text: TextSpan(
                text: description.substring(0,150), // _snapshot.data['username']
                style: AcademyStyles().styleLato(size: 12,color: AcademyColors.colors_787878),
                children: <TextSpan>[
                  TextSpan(
                    text: '. . .  More',
                    style: AcademyStyles().styleLato(size: 12,color: AcademyColors.primary),
                  )
                ],
              ),
            ),
          ),
        );
      }
    }else{
      textMore = Text(description,style: AcademyStyles().styleLato(size: 12,color: AcademyColors.colors_787878),);
    }




    return textMore;
  }
}

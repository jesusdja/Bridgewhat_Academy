import 'package:academybw/config/academy_colors.dart';
import 'package:academybw/config/academy_style.dart';
import 'package:academybw/main.dart';
import 'package:academybw/ui/menu/cartoons/provider/cartoons_provider.dart';
import 'package:academybw/utils/get_data.dart';
import 'package:academybw/widgets_shared/circular_progress_colors.dart';
import 'package:academybw/widgets_shared/image_cache.dart';
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
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    initialData();
    scrollController.addListener((){
      getDataPost();
    });
  }

  Future getDataPost() async {
    if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
      if(!cartoonsProvider.isLoadData){
        bool result = await cartoonsProvider.getPosts(isInit: false);
        if(result){
          if(scrollController.position.pixels >= (scrollController.position.maxScrollExtent - 300)){
            scrollController.animateTo(
                scrollController.position.pixels + 120,
                duration: const Duration(milliseconds: 300),
                curve: Curves.fastOutSlowIn
            );
          }
        }
      }
    }
  }

  initialData(){
    Future.delayed(const Duration(milliseconds: 100)).then((value){
      cartoonsProvider.getPosts(isInit: true);
    });
  }

  @override
  Widget build(BuildContext context) {

    cartoonsProvider = Provider.of<CartoonsProvider>(context);

    return GestureDetector(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Container(
                width: sizeW,
                margin: EdgeInsets.symmetric(horizontal: sizeW * 0.06),
                child: bannerTitle(type: 2)
              ),
              SizedBox(height: sizeH * 0.04),
              Expanded(
                child: Container(
                  width: sizeW,
                  margin: EdgeInsets.symmetric(horizontal: sizeW * 0.06),
                  child: cardContainer(),
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

    return Stack(
      children: [
        SizedBox(
          width: sizeW,
          child: ListView.builder(
            controller: scrollController,
            physics: const BouncingScrollPhysics(),
            itemCount: listW.length,
            itemBuilder: (context,index){
              return listW[index];
            },
          ),
        ),
        if(cartoonsProvider.isLoadData)...[
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(bottom: 20),
              height: 50,width: 50,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  shape: BoxShape.circle
              ),
              child: const CircularProgressIndicator(color: AcademyColors.primary),
            ),
          ),
        ]
      ],
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
          titleText(),
          cardPostImg(),
          SizedBox(height: sizeH * 0.03),
        ],
      ),
    );
  }

  Widget cardPostImg(){
    return SizedBox(
      width: sizeW,
      child: Center(
        child: Container(
          width: sizeW,
          height: sizeH * 0.4,
          margin: EdgeInsets.only(bottom: sizeH * 0.02,left: sizeW * 0.06, right: sizeW * 0.06),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            // image: DecorationImage(
            //     image: Image.network('$urlImgCartoons${cartoon['image'].toString().split('/').last}').image,
            //     fit: BoxFit.fill
            // ),
          ),
          child: ImageView().imageNetWork(url: '$urlImgCartoons${cartoon['image'].toString().split('/').last}'),
        ),
      ),
    );
  }

  Widget titleText(){

    String title = cartoon['title'];

    return Container(
      width: sizeW,
      margin: EdgeInsets.only(bottom: sizeH * 0.01,left: sizeW * 0.1),
      child: Text(title,
        style: AcademyStyles().styleLato(size: 18,color: AcademyColors.colorsLeversObscure, fontWeight: FontWeight.bold),
      textAlign: TextAlign.left),
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

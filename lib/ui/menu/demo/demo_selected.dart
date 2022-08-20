import 'package:academybw/config/academy_colors.dart';
import 'package:academybw/config/academy_style.dart';
import 'package:academybw/main.dart';
import 'package:academybw/ui/menu/demo/demo_selected_calendar.dart';
import 'package:academybw/ui/menu/demo/demo_selected_email.dart';
import 'package:academybw/ui/menu/demo/demo_selected_video.dart';
import 'package:academybw/widgets_shared/button_general.dart';
import 'package:academybw/widgets_shared/widgets_shared.dart';
import 'package:flutter/material.dart';

class DemoSelected extends StatefulWidget {
  const DemoSelected({Key? key, required this.type}) : super(key: key);
  final int type;
  @override
  State<DemoSelected> createState() => _DemoSelectedState();
}

class _DemoSelectedState extends State<DemoSelected> {

  List<String> title = ['CRYSTAL','SILVER','GOLD','PLATINUM'];
  int cardSelectedType = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: GestureDetector(
        onTap: (){},
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              SizedBox(height: sizeH * 0.01,),
              headerContainer(),
              SizedBox(height: sizeH * 0.02,),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: SizedBox(
                    width: sizeW,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: sizeW * 0.06),
                          child: bannerTitle(type: 3),
                        ),
                        titleCard(),
                        title2Card(),
                        descriptionCard(),
                        cardPostImg(),
                        selectedAccessPublish(),
                        contentsCardSelected(),
                        buttonBottom(),
                      ],
                    ),
                  ),
                ),
              ),
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
            icon: Icon(Icons.cancel_outlined,size: sizeH * 0.04,color: AcademyColors.primary),
            onPressed: (){
              Navigator.of(context).pop();
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

  Widget titleCard(){
    return InkWell(
      onTap: (){
        Navigator.push(context,MaterialPageRoute<void>( builder: (context) => DemoSelectedVideo(type: widget.type,)),);
      },
      child: Container(
        width: sizeW,
        margin: EdgeInsets.symmetric(horizontal: sizeW * 0.05, vertical: sizeH * 0.02),
        padding: EdgeInsets.all(sizeH * 0.005),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(
            width: 2.0,
            color: AcademyColors.colors_95C4E9,
          ),
        ),
        child: Center(
          child: Text('Demo ${title[widget.type]} Bridgewhat',style: AcademyStyles().stylePoppins(
            size: sizeH * 0.025,color: AcademyColors.colors_95C4E9,fontWeight: FontWeight.bold
          )),
        ),
      ),
    );
  }

  Widget title2Card(){
    return Container(
      width: sizeW,
      margin: EdgeInsets.symmetric(horizontal: sizeW * 0.05),
      child: Row(
        children: [
          Expanded(
            child: title2CardText(type: 0),
          ),
          SizedBox(width: sizeW * 0.02),
          Expanded(
            child: title2CardText(type: 1),
          )
        ],
      ),
    );
  }

  Widget title2CardText({required int type}){
    String title = type == 0 ? 'Monthly' : 'Annual';
    String subTitle = type == 0 ? '€ 199' : '€ 1.999';
    TextStyle style = AcademyStyles().styleLato(size: 14,color: Colors.white);

    return Container(
      padding: EdgeInsets.all(sizeH * 0.015),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: AcademyColors.colors_95C4E9,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(title,style: style),
          ),
          Container(
            margin: EdgeInsets.only(right: sizeW * 0.02),
            child: Text(subTitle,style: style),
          )
        ],
      ),
    );
  }

  Widget descriptionCard(){
    return Container(
      width: sizeW,
      margin: EdgeInsets.symmetric(horizontal: sizeW * 0.05, vertical: sizeH * 0.025),
      child: Text('The Bridgewhat 20 Levers of Growth (20LOG) is a proprietary framework that was developed to create a language of growth between Buyers and Sellers.\nBuyers are the companies that need to grow.\nSellers are the business services companies that may help buyers to grow.\nWhile buyers use the 20LOG to gain perspective on how to grow, sellers are ranged around these 20LOG in the Bridgewhat Platform.\nBut what are these 20LOG and how are they organized?',
      style: AcademyStyles().styleLato(size: 12,color: AcademyColors.colors_787878,heightText: sizeH * 0.0022)),
    );
  }

  Widget cardPostImg(){
    return Container(
      width: sizeW,
      height: sizeH * 0.22,
      margin: EdgeInsets.symmetric(vertical: sizeH * 0.02, horizontal: sizeW * 0.05),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        image: DecorationImage(
            image: Image.asset('assets/image/img_example.png').image,
            fit: BoxFit.fill
        ),
      ),
    );
  }

  Widget selectedAccessPublish(){
    return Container(
      width: sizeW,
      margin: EdgeInsets.symmetric(horizontal: sizeW * 0.05, vertical: sizeH * 0.02),
      child: Row(
        children: [
          Expanded(
            child: cardSelectedAccessPublish(type: 0),
          ),
          SizedBox(width: sizeW * 0.03),
          Expanded(
            child: cardSelectedAccessPublish(type: 1),
          ),
        ],
      ),
    );
  }

  Widget cardSelectedAccessPublish({required int type}){

    String title = type == 0 ? 'Access' : 'Publish';

    return InkWell(
      onTap: (){
        setState(() {
          cardSelectedType = type;
        });
      },
      child: Container(
        width: sizeW,
        padding: EdgeInsets.all(sizeH * 0.01),
        decoration:  BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          color: cardSelectedType == type ? AcademyColors.primary : Colors.white,
          border: Border.all(
            color: AcademyColors.primary,
            width: 1,
            style: BorderStyle.solid,
          ),
        ),
        child: Center(
          child: Text(title,
          style: AcademyStyles().styleLato(size: 14,color: cardSelectedType != type ? AcademyColors.primary : Colors.white,fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  Widget contentsCardSelected(){

    List<Widget> listW = [];
    if(cardSelectedType == 0){
      listW.add(
          SizedBox(
            width: sizeW,
            child: Row(
              children: [
                Expanded(
                  child: contentsCardSelectedContainer(type: 0),
                ),
                SizedBox(width: sizeW * 0.05),
                Expanded(
                  child: contentsCardSelectedContainer(type: 1),
                ),
              ],
            ),
          )
      );
      listW.add(SizedBox(height: sizeH * 0.02,));
    }

    listW.add(
        SizedBox(
          width: sizeW,
          child: Row(
            children: [
              Expanded(
                child: contentsCardSelectedContainer(type: 2),
              ),
              SizedBox(width: sizeW * 0.05),
              Expanded(
                child: contentsCardSelectedContainer(type: 3),
              ),
            ],
          ),
        )
    );
    listW.add(SizedBox(height: sizeH * 0.02,));

    if(cardSelectedType == 0){
      listW.add(
          SizedBox(
            width: sizeW,
            child: Row(
              children: [
                Expanded(
                  child: contentsCardSelectedContainer(type: 4),
                ),
                SizedBox(width: sizeW * 0.05),
                Expanded(
                  child: contentsCardSelectedContainer(type: 5),
                ),
              ],
            ),
          )
      );
      listW.add(SizedBox(height: sizeH * 0.02,));
    }

    if(cardSelectedType == 0){
      listW.add(
          SizedBox(
            width: sizeW,
            child: Row(
              children: [
                Expanded(
                  child: contentsCardSelectedContainer(type: 6),
                ),
                SizedBox(width: sizeW * 0.05),
                Expanded(
                  child: Container(width: sizeW),
                ),
              ],
            ),
          )
      );
      listW.add(SizedBox(height: sizeH * 0.02,));
    }


    return Container(
      width: sizeW,
      margin: EdgeInsets.symmetric(horizontal: sizeW * 0.05,vertical: sizeH * 0.02),
      child: Column(
        children: listW,
      ),
    );

  }

  Widget contentsCardSelectedContainer({required int type}){

    String title = 'Advisors';
    if(type == 1){ title = 'Companies'; }
    if(type == 2){ title = 'Posts'; }
    if(type == 3){ title = 'Samplings'; }
    if(type == 4){ title = 'Protocols'; }
    if(type == 5){ title = 'I want to sell'; }
    if(type == 6){ title = 'Campaings'; }

    return Container(
      width: sizeW,
      padding: EdgeInsets.all(sizeH * 0.05),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: AcademyColors.colorsA40000.withOpacity(0.5)
      ),
      child: Center(
        child: Text(title,style: AcademyStyles().styleLato(
          color: Colors.white,
          size: 14
        )),
      ),
    );
  }

  Widget buttonBottom(){
    return Container(
      width: sizeW,
      margin: EdgeInsets.symmetric(horizontal: sizeW * 0.05,vertical: sizeW * 0.02),
      child: Column(
        children: [
          ButtonGeneral(
            title: 'Request info via e-mail',
            backgroundColor: AcademyColors.primary,
            textStyle: AcademyStyles().stylePoppins(size: 16,color: Colors.white),
            width: sizeW,
            height: sizeH * 0.05,
            radius: 5,
            onPressed: (){
              Navigator.push(context,MaterialPageRoute<void>( builder: (context) => DemoSelectedEmail(type: widget.type,)),);
            },
          ),
          SizedBox(height: sizeH * 0.02,),
          ButtonGeneral(
            title: 'Make an appointment',
            backgroundColor: AcademyColors.primary,
            textStyle: AcademyStyles().stylePoppins(size: 16,color: Colors.white),
            width: sizeW,
            height: sizeH * 0.05,
            radius: 5,
            onPressed: (){
              Navigator.push(context,MaterialPageRoute<void>( builder: (context) => DemoSelectedCalendar(type: widget.type,)),);
            },
          ),
          SizedBox(height: sizeH * 0.02,),
        ],
      ),
    );
  }
}

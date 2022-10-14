import 'package:academybw/config/academy_colors.dart';
import 'package:academybw/config/academy_style.dart';
import 'package:academybw/main.dart';
import 'package:academybw/ui/menu/demo/demo_selected.dart';
import 'package:academybw/ui/menu/demo/widgets/demo_page_more_info.dart';
import 'package:academybw/widgets_shared/widgets_shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DemoPage3 extends StatefulWidget {
  const DemoPage3({Key? key}) : super(key: key);

  @override
  State<DemoPage3> createState() => _DemoPage3State();
}

class _DemoPage3State extends State<DemoPage3> {

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              width: sizeW,
              margin: EdgeInsets.symmetric(horizontal: sizeW * 0.06),
              child: bannerTitle(type: 3),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: SizedBox(
                  width: sizeW,
                  child: Column(
                    children: [
                      SizedBox(height: sizeH * 0.02),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: sizeW * 0.1),
                        width: sizeW,
                        child: Text('To see what are the benefits you can get from each of the packages, please click in Crystal, Silver, Gold and Platinum.',
                            textAlign: TextAlign.center,style: AcademyStyles().stylePoppins(
                            size: sizeH * 0.015
                        )),
                      ),
                      const CardDemo(type: 0),
                      const CardDemo(type: 1),
                      const CardDemo(type: 2),
                      const CardDemo(type: 3),
                    ],
                  ),
                ),
              ),
            )
          ],
        )
    );
  }
}

class CardDemo extends StatefulWidget {
  const CardDemo({Key? key, required this.type, this.isButtonInfo = true}) : super(key: key);
  final int type;
  final bool isButtonInfo;

  @override
  State<CardDemo> createState() => _CardDemoState();
}

class _CardDemoState extends State<CardDemo> {
  late int type;

  @override
  void initState() {
    super.initState();
    type = widget.type;
  }


  @override
  Widget build(BuildContext context) {

    String title = 'CRYSTAL';
    List<String> listTitle = ['Registration','View and create posts','Sampling','Reviews','Access to opportunities','Advisor marketplace(Ad hoc days)'];
    Color color = AcademyColors.colors_95C4E9;
    if(type == 1){
      title = 'SILVER';
      color = AcademyColors.colors_85939D;
      listTitle = ['Everything in Crystal +','Credentials board','Protocols','Campaigns','20 LOG marketplace',];
    }
    if(type == 2){
      title = 'GOLD';
      color = AcademyColors.colors_958E6F;
      listTitle = ['Everything in Silver +','20 LOG survey','Partnerships',];
    }
    if(type == 3){
      title = 'PLATINUM';
      color = AcademyColors.colorsB2BEC6;
      listTitle = ['Everything in Gold +','Advisory Services(12 days package)',];
    }


    List<Widget> listW = [];
    for (var element in listTitle) {
      listW.add(
        Container(
          width: sizeW,
          margin: EdgeInsets.only(bottom: sizeH * 0.01),
          child: Row(
            children: [
              Icon(Icons.circle,color: Colors.black,size: sizeH * 0.01,),
              SizedBox(width: sizeW * 0.02),
              Expanded(
                child: Text(element,style: AcademyStyles().styleLato(size: 12,color: Colors.black,),),
              ),
            ],
          ),
        ),
      );
    }

    if(widget.isButtonInfo){
      listW.add(
        SizedBox(
          width: sizeW,
          child: Row(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      color: color,
                    ),
                    child: Text('+ INFO',style: AcademyStyles().styleLato(size: 12,color: Colors.white,),),
                  ),
                  onTap: (){
                    showCupertinoModalPopup(
                      context: context,
                      builder: (BuildContext context) {
                        return DemoPageMoreInfo(type: type,);
                      },
                    );
                  },
                ),
              ),
              SizedBox(width: sizeW * 0.02,),
              Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      color: color,
                    ),
                    child: Text('GET STARTED',style: AcademyStyles().styleLato(size: 12,color: Colors.white,),),
                  ),
                  onTap: () async{
                    //Navigator.push(context,MaterialPageRoute<void>( builder: (context) => DemoSelectedCalendar(type: type,menu: true,)),);
                    DateTime dateTime = DateTime.now();

                    String _url = 'https://calendly.com/mafalda-sottomayor/contact-bridgewhat?month=${dateTime.year}-${dateTime.month.toString().padLeft(2,'0')}';
                    if (!await launchUrl(Uri.parse(_url))) {
                      throw 'Could not launch $_url';
                    }
                  },
                ),
              )
            ],
          ),
        ),
      );
    }


    return InkWell(
      onTap: (){
        Navigator.push(context,MaterialPageRoute<void>( builder: (context) => DemoSelected(type: type,)),);
      },
      child: Container(
        width: sizeW,
        margin: EdgeInsets.only(top: sizeH * 0.02),
        padding: EdgeInsets.symmetric(vertical: sizeH * 0.015),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: AcademyColors.colorsE8E8E8,
        ),
        child: Row(
          children: [
            Container(
              width: sizeW * 0.3,
              height: sizeH * 0.05,
              margin: EdgeInsets.symmetric(horizontal: sizeW * 0.05),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                color: color,
              ),
              child: Center(
                child: Text(title,style: AcademyStyles().stylePoppins(
                    size: sizeH * 0.02,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                )),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: listW,
              ),
            )
          ],
        ),
      ),
    );
  }
}

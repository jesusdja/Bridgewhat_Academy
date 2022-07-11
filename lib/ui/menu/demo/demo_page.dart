import 'package:academybw/config/academy_colors.dart';
import 'package:academybw/config/academy_style.dart';
import 'package:academybw/main.dart';
import 'package:academybw/ui/menu/demo/demo_selected.dart';
import 'package:academybw/widgets_shared/widgets_shared.dart';
import 'package:flutter/material.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({Key? key}) : super(key: key);

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: SizedBox(
        width: sizeW,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: sizeW * 0.06),
              child: bannerTitle(type: 3),
            ),
            Container(
              width: sizeW,
              margin: EdgeInsets.symmetric(horizontal: sizeW * 0.06),
              child: Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      card(type: 0),
                      card(type: 1),
                      card(type: 2),
                      card(type: 3),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget card({required int type}){

    String title = 'CRYSTAL';
    List<String> listTitle = ['Registration','Reviews','Sampling Marketing','Full content consumption',];
    Color color = AcademyColors.colors_95C4E9;
    if(type == 1){
      title = 'SILVER';
      color = AcademyColors.colors_85939D;
      listTitle = ['All Crystal features +','Scoring Board','Protocols','Silver content package',];
    }
    if(type == 2){
      title = 'GOLD';
      color = AcademyColors.colors_958E6F;
      listTitle = ['All Silver features +','“Need & Leeds”','Campaigns','Gold content package',];
    }
    if(type == 3){
      title = 'PLATINUM';
      color = AcademyColors.colors_B2BEC6;
      listTitle = ['All Gold features +','Advisory Services','Platinum content package',];
    }

    List<Widget> listW = [];
    for (var element in listTitle) {
      listW.add(
        Container(
          width: sizeW,
          margin: EdgeInsets.only(bottom: sizeH * 0.01),
          child: Row(
            children: [
              Icon(Icons.circle,color: AcademyColors.primary,size: sizeH * 0.01,),
              SizedBox(width: sizeW * 0.02),
              Expanded(
                child: Text(element,style: AcademyStyles().styleLato(size: 12,color: Colors.black,),),
              ),
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
        height: sizeH * 0.16,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: AcademyColors.colors_E8E8E8,
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

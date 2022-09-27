import 'package:academybw/config/academy_colors.dart';
import 'package:academybw/config/academy_style.dart';
import 'package:academybw/main.dart';
import 'package:flutter/material.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({Key? key}) : super(key: key);

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {

  int selectOption = 4;

  Map<int,String> dataSelected = {
    0 : 'PROTOCOLS|I WANT TO SELL I WANT TO BUY|CAMPAIGNS|PARTNERSHIPS|',
    1 : 'PARTNERSHIPS',
    2 : '',
    3 : '',
  };

  Map<String,String> dataPageAccess = {
    'ADVISORS' : 'Ad hoc days.\n\nHere is a group of selected advisors willing to share with you their experience and knowledge built throughout their C-Suite level careers. Why increase your risk and waste your resources, when someone can show you the way?',
    'COMPANIES' : 'Here is a group of selected companies that share with you the willingness for ambitious growth. Once you start to explore each of the companies’ cards you can access key metrics that help you to find opportunities to do business. You can click company profile for basics, credentials board for trust, and channel for opportunities. Sellers of services or software linked to the Bridgewhat 20 Levers of Growth will be tagged with the correspondent levers of specialization.',
    'POSTS' : 'Here you can learn more on how to grow by accessing content around the Bridgewhat 20 Levers of Growth published by other participants that want to share their experiences and know-how.',
    'SAMPLINGS' : 'Here you will get for free products or services from other participants that want you to try them and give feedback on your experience.',
    'PROTOCOLS' : 'Here you can access promotions on products and services offered by other Bridgewhat participants.',
    'I WANT TO SELL I WANT YO BUY' : 'I want to Sell: Here you can look for specific offers published by sellers of services and software linked to the Bridgewhat 20 Levers of Growth that can help you to accelerate your growth.\n\nI want to Buy: As a seller of services and software linked to the Bridgewhat 20 Levers of Growth, here you have several opportunities to do business.',
    'CAMPAIGNS' : 'Here you can look for, and take advantage of, campaigns published by all of the Silver, Gold and Platinum Bridgewhat participants.',
    'PARTNERSHIPS' : 'Here you can look for, and take advantage of, partnerships published by all of the Gold and Platinum partnering Bridgewhat participants.',
  };
  Map<String,String> dataPageCreate = {
    'POSTS' : 'Multimedia posts are an undisputable way of showing your company’s competences. Organized around the Bridgewhat 20 Levers of Growth, these publications will allow you to position your company as an expert in your correspondent fields of action.',
    'SAMPLING' : 'There is no better way to create a first-hand customer experience than let your target audience get access to a sample of your products or services for free. Not only you are building brand awareness but also grasping feedback that help you to improve your offer.',
    'PROTOCOLS' : 'Start selling in Bridgewhat by offering special conditions to your peer participants. These special conditions can be translated in better prices, better service levels or other features that are capable of hooking new clients.',
    'I WANT TO SELL I WANT TO BUY' : 'I want to sell: As a Bridgewhat seller, you can publish as many specific offers as you wish, highlighting your differentiators and why your company is able to deliver a high standard of services/software related to the Bridgewhat 20 Levers of Growth. It is expected that via your, “best in class catalogue”, potential clients will find a good partner to successfully help them on their growth journeys.\n\nI want to buy: If, after researching among sellers of services/software related to the Bridgewhat 20 Levers of Growth (in general) and their “I want to sell” (in particular), you still haven’t found the best solution to help you to accelerate your company’s growth, as a gold and up participant you can publish a specific need and we guarantee you that we will find at least a suitable seller.',
    'CAMPAIGNS' : 'Apart from the Marketplace for services/software organized around the Bridgewhat 20 Levers of Growth, all Gold and Platinum participants can use the platform as a distribution channel, via Campaigns. A campaign must define an advantage that leads to an indisputable business case to the correspondent buyer. Participants can publish as many campaigns as they want.',
    'PARTNERSHIPS' : 'Partnerships allow you to offer your products or services to other participants’ clients, via joint I want to sell, campaigns or protocols. Participants can initiate as many partnerships as they want. Bridgewhat guarantees that, following participants initiative, at least, two partnerships per year will be set among the three parties involved: two channel and/or product partners (among participants) and Bridgewhat.',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AcademyColors.colorsLeversObscure,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            width: sizeW,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: sizeW * 0.05,vertical: sizeH * 0.01),
                  margin: EdgeInsets.all(sizeH * 0.02),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white
                  ),
                  child: Text('DO YOU NEED FUTHER HELP TO SELECT THE RIGHT PACKAGE?',style: AcademyStyles().stylePoppins(
                    size: sizeH * 0.018,color: AcademyColors.colorsLeversObscure,fontWeight: FontWeight.bold
                  ),textAlign: TextAlign.center),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: sizeW * 0.03,vertical: sizeH * 0.02),
                  margin: EdgeInsets.all(sizeH * 0.02),
                  child: Text('Use this scale to find your level of growth ambition',style: AcademyStyles().stylePoppins(
                      size: sizeH * 0.014,color: Colors.white
                  ),textAlign: TextAlign.center),
                ),
                linearOption(),
                SizedBox(height: sizeH * 0.02,),
                columnCards(type: 0),
                SizedBox(height: sizeH * 0.02,),
                columnCards(type: 1),
              ],
            ),
          ),
        ),
    );
  }

  Widget linearOption(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: sizeW * 0.05),
      width: sizeW,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded( child: cardLinearOption(type: 0),),
          Expanded( child: cardLinearOption(type: 1),),
          Expanded( child: cardLinearOption(type: 2),),
          Expanded( child: cardLinearOption(type: 3),),
        ],
      ),
    );
  }

  Widget cardLinearOption({required int type}){

    String title = 'CRYSTAL';
    if(type == 1){ title = 'SILVER'; }
    if(type == 2){ title = 'GOLD'; }
    if(type == 3){ title = 'PLATINUM'; }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: sizeH * 0.01),
              width: sizeW,
              height: sizeH * 0.01,
              color: Colors.white,
            ),
            Center(
              child: InkWell(
                child: Icon(Icons.circle,size: sizeH * 0.03,color: selectOption == type ? AcademyColors.colorsTabbar2 : Colors.white),
                onTap: (){
                  setState(() {
                    selectOption = type;
                  });
                },
              ),
            )
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: sizeH * 0.02,right: sizeW * 0.005,left: sizeW * 0.005),
          width: sizeW,
          child: Text(title,style: AcademyStyles().styleLato(size: sizeH * 0.016,color: Colors.white,fontWeight: FontWeight.bold),
          textAlign: TextAlign.center),
        ),
      ],
    );
  }

  Widget columnCards({required int type}){

    Map<String,String> items = dataPageAccess;
    String title = 'ACCESS';
    if(type == 1){
      items = dataPageCreate;
      title = 'CREATE';
    }


    return Container(
      width: sizeW,
      margin: EdgeInsets.symmetric(horizontal: sizeW * 0.05),
      child: Column(
        children: [
          textColumn(title: title),
          SizedBox(height: sizeH * 0.01,),
          listCardsColumn(type: type, items: items),
        ],
      ),
    );
  }

  Widget textColumn({required String title}){
    return SizedBox(
      width: sizeW,
      child: Text(title,style: AcademyStyles().stylePoppins(
        size: sizeH * 0.025,color: AcademyColors.colorsTabbar2,fontWeight: FontWeight.bold
      ),textAlign: TextAlign.center),
    );
  }

  Widget listCardsColumn({required int type, required Map<String,String> items}){

    List<Widget> listW = [];
    items.forEach((key, value) {

      bool isSelected = dataSelected.containsKey(selectOption);
      if(type == 1 && dataSelected.containsKey(selectOption)){
        isSelected = !dataSelected[selectOption].toString().contains(key);
      }

      listW.add(containerWrap(title: key,isSelected: isSelected,type: type));
    });

    return Wrap(
      children: listW,
    );
  }

  Widget containerWrap({required String title, required bool isSelected, required int type}){

    Color colorSelect = AcademyColors.colorsLeversCeleste.withOpacity(0.9);
    if(selectOption == 1){ colorSelect = AcademyColors.colors_737373.withOpacity(0.9); }
    if(selectOption == 2){ colorSelect = Colors.yellow.withOpacity(0.3); }
    if(selectOption == 3){ colorSelect = Colors.grey.withOpacity(0.8); }

    return InkWell(
      child: Container(
        width: sizeH * 0.12,
        height: sizeH * 0.12,
        margin: EdgeInsets.all(sizeH * 0.01),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: isSelected ? colorSelect : Colors.white
        ),
        child: Center(
          child: Text(title,style: AcademyStyles().styleLato(
            size: sizeH * 0.015,color: AcademyColors.colorsLeversObscure
          ),textAlign: TextAlign.center),
        ),
      ),
      onTap: (){
        openShowBottom(title: title,subTitle: type == 0 ? dataPageAccess[title]! : dataPageCreate[title]!);
      },
    );
  }

  void openShowBottom({required String title, required String subTitle}){
    showModalBottomSheet<void>(
        context: context,
        isDismissible: false,
        isScrollControlled: true,
        enableDrag: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50.0),topRight: Radius.circular(50.0),
            bottomLeft: Radius.circular(0.0),bottomRight: Radius.circular(0.0),
          ),
        ),
        builder: (context){
          return Container(
            width: sizeW,
            padding: EdgeInsets.symmetric(horizontal: sizeW * 0.1),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.0),topRight: Radius.circular(50.0),
                bottomLeft: Radius.circular(0.0),bottomRight: Radius.circular(0.0),
              ),
            ),
            child: ClipRRect(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: sizeH * 0.02,),
                  SizedBox(
                    width: sizeW,
                    child: Text(title,style: AcademyStyles().styleLato(
                      size: sizeH * 0.03,color: AcademyColors.colorsLeversObscure,fontWeight: FontWeight.bold
                    ),textAlign: TextAlign.left),
                  ),
                  SizedBox(height: sizeH * 0.02,),
                  SizedBox(
                    width: sizeW,
                    child: Text(subTitle,style: AcademyStyles().styleLato(
                      size: sizeH * 0.02,color: AcademyColors.colorsLeversObscure,
                    ),textAlign: TextAlign.justify),
                  ),
                  SizedBox(height: sizeH * 0.1,),
                ],
              ),
            ),
          );
        }
    );
  }
}

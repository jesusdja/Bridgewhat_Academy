import 'package:academybw/config/academy_style.dart';
import 'package:academybw/main.dart';
import 'package:flutter/material.dart';

class DemoPageMoreInfo extends StatefulWidget {
  const DemoPageMoreInfo({Key? key, required this.type}) : super(key: key);
  final int type;
  @override
  _DemoPageMoreInfoState createState() => _DemoPageMoreInfoState();
}

class _DemoPageMoreInfoState extends State<DemoPageMoreInfo> {

  List<String> dataInfo = [
    'Be part of the companies\' directory',
    'View and create posts',
    'Sample products and services to all Bridgewhat participants',
    'Benefit samplings',
    'Access the Credentials Board of all participants',
    'Access Financial rating from participants (only Iberia)',
    'Get reviews from projects developed within Bridgewhat context',
    'See reviews from projects developed within Bridgewhat context',
    'Benefit from the published protocols',
    'Search and accept 20 LOG offers',
    'Search and intermediate 20 LOG offers',
    'Get leads by replying to the published 20 LOG needs',
    'Search and intermediate 20 LOG needs',
    'Benefit from the published campaigns',
    'Buy ad hoc days of advisory services',
    'Access to aditional features/discounts based on credentials scoring',
    'Publish certifications, referrals, awards, stakeholders',
    'Create protocols',
    'Publish 20 LOG Offers (sellers only)',
    '20 LOG Survey assessment',
    'Publish 20 LOG customized needs (IWB) and find a potential seller',
    'Publish direct campaigns',
    'Set Campaigns with a specific partner to get clients',
    'Buy advisory services pack',
    'Extension by exchange with gold (3 days)',
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            width: sizeW * 0.9,
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: sizeH * 0.02,vertical: sizeH * 0.025),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  width: sizeW,
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.cancel_outlined, size: sizeH * 0.035, color: Colors.black),
                        onPressed: ()=> Navigator.of(context).pop(),
                      ),
                      Expanded(
                        child: Text('WHAT IS INCLUDED?',style: AcademyStyles().stylePoppins(
                          size: sizeH * 0.025,color: Colors.black,
                        )),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: sizeH * 0.02),
                listContainer(),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget listContainer(){
    List<Widget> listW = [];

    int cant = 15;
    switch(widget.type){
      case 2: cant = 19; break;
      case 3: cant = 23; break;
      case 4: cant = 25; break;
    }

    for(int x = 0; x < cant; x++){
      listW.add(
        Container(
          width: sizeW,
          margin: EdgeInsets.only(bottom: sizeH * 0.01),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.circle,color: Colors.black,size: sizeH * 0.01,),
              SizedBox(width: sizeW * 0.02),
              Expanded(
                child: Text(dataInfo[x],style: AcademyStyles().styleLato(size: 12,color: Colors.black,),),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      width: sizeW,
      margin: EdgeInsets.symmetric(horizontal: sizeW * 0.03),
      child: SingleChildScrollView(
        child: Column(
          children: listW,
        ),
      ),
    );
  }
}
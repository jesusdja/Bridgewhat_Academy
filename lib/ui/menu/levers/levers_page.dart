
import 'package:academybw/config/academy_colors.dart';
import 'package:academybw/config/academy_style.dart';
import 'package:academybw/main.dart';
import 'package:academybw/providers/post_provider.dart';
import 'package:academybw/utils/get_data.dart';
import 'package:academybw/widgets_shared/circular_progress_colors.dart';
import 'package:academybw/widgets_shared/widgets_shared.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LeversPage extends StatefulWidget {
  const LeversPage({Key? key}) : super(key: key);

  @override
  State<LeversPage> createState() => _LeversPageState();
}

class _LeversPageState extends State<LeversPage> {

  String title1 = 'To create a common language on how to grow, Bridgewhat developed a proprietary framework that includes 20 Levers of Growth (20 LOG) organised around five stages of client engagement - Attraction, Acquisition, ARPU, Retention, Referrals.\n\nTo see the BridgeWhat 20 LOG and their connection to the 5 stages of client engagement, please click the animated loop.';
  Map<int,Map<String,String>> structure1 = {
    1 : {
      'PT' : 'Positioning & Targeting|What market segments should I target? What are my Unique Selling Propositions by segment?…',
      'DM' : 'Digital Marketing|What should be my digital positioning? How do I track my digital traffic & conversation?…',
      'TG' : 'Traffic generation|How do I drive desirable customers to my “stores”? What traffic metrics & tools should I use?…',
      'CM' : 'CRM Marketing|How do I establish long term positive interactions with my clients? What IT tools should I use?…',
    },
    2 : {
      'IC' : 'Innovative Co-creation|What products and other marketing-mix elements can I develop with my suppliers and partners?',
      'PP' : 'Pricing & Promotion|What pricing policy should I build? What sales promotions to develop? How to deal with “Free”?…',
      'CS' : 'Cross-selling & Revenue Sharing|How do I maximize my client’s share of wallet or average order with other product families?…',
      'SC' : 'Sales Conversion|How do I maximize the conversion of traffic in sales? What specific tactics & tools should I use?…',
    },
    3 : {
      'CD' : 'Competences Development|What should I do to secure repeated business? How to find and develop my core competences?…',
      'PM' : 'Platform Membership|How can I build my “community” via subscription models that maximize my lifetime value (LTV)?…',
      'RR' : 'Reputation & Referrals|How can I maximize my reputation via certifications, positive reviews, publishing… and referrals?…',
      'BD' : 'Brand Development|How do I replace “common” by “valuable and meaningful”, while forging strong ties with clients?…',
    },
  };

  Map<int,Map<String,String>> structure2 = {
    1 : {
      'MD' : 'Multichannel Development|How do I go digital? How can I create a seamless customer experience despite the channels?…',
      'SE' : 'Salesforce Effectiveness|How do I maximize client-facing time? How to drive and measure sales team conversion rates?…',
      'ME' : 'Market Entry|What new countries, segments, or channels should I pick? How to enter in these new “markets”?…',
      'MP' : 'M&A & Partnerships|What companies can I buy to conquer new markets? How do I strengthen my value network?…',
    },
    2 : {
      'CC' : 'Client Centricity|How do I increase client engagement? How do I extend and customize products around clients?…',
      'LI' : 'Loyalty Increase|How do I satisfy my clients forever? What are the most effective loyalty programs and incentives?…',
      'CR' : 'Churn Reduction|How do I avoid decreasing my share of wallet in a customer or losing it? What signs should I read?…',
      'BM' : 'Building a Moat|What can I build – quality, client’s performance, convenience – that my competitors cannot copy?…',
    },
  };

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        width: sizeW,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: sizeW * 0.06),
              child: bannerTitle(type: 6)
            ),
            SizedBox(height: sizeH * 0.04),
            Expanded(
              child: cardContainer(),
            ),
          ],
        ),
      ),
    );
  }

  Widget cardContainer(){
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          BounceInUp(
            duration: const Duration(milliseconds: 1200),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: sizeW * 0.06),
              width: sizeH * 0.35,
              height: sizeH * 0.35,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: Image.asset('assets/image/levers.png').image,
                    fit: BoxFit.fitWidth
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: sizeW * 0.06, vertical: sizeH * 0.02),
            child: Text(title1,style: AcademyStyles().styleLato(size: sizeH * 0.02,color: AcademyColors.colors_1B4570)),
          ),
          container1(num: '1',title: 'ATRACTION', data: structure1[1]!),
          container2(num: '2',title: 'ACQUISITION', data: structure2[1]!),
          container1(num: '3',title: 'ARPU', data: structure1[2]!),
          container2(num: '4',title: 'RETENTION', data: structure2[2]!),
          container1(num: '5',title: 'REFERRALS', data: structure1[3]!),
        ],
      ),
    );
  }


  Widget container1({required String num, required title , required Map<String,String> data}){

    List<Widget> listW = [];
    bool isPar = false;
    data.forEach((key, value) {
      listW.add(cardDataST(
        title: key,
        title2: value.split('|')[0],
        subTitle: value.split('|')[1],
        color: isPar ? AcademyColors.primary : AcademyColors.primary_d00821,
      ));
      isPar = !isPar;
    });


    return Container(
      width: sizeW,
      padding: const EdgeInsets.all(20),
      color: AcademyColors.primary,
      child: Column(
        children: [
          SizedBox(
            width: sizeW,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: sizeH * 0.025,
                  backgroundColor: Colors.white,
                  child: Center(
                    child: Text(num,style: AcademyStyles().styleLato(
                        color: AcademyColors.primary,size: sizeH * 0.025
                    )),
                  ),
                ),
                FittedBox(
                  fit:BoxFit.contain,
                  child: Container(
                    constraints: BoxConstraints(minWidth: sizeW * 0.3, maxWidth: sizeW * 0.5),
                    child: Text(title,textAlign: TextAlign.center,style: AcademyStyles().stylePoppins(
                        size: sizeH * 0.022,color: Colors.white,fontWeight: FontWeight.bold
                    )),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: sizeH * 0.02,),
          SizedBox(
            width: sizeW,
            child: Column(
              children: listW,
            ),
          ),
        ],
      ),
    );
  }

  Widget container2({required String num, required title , required Map<String,String> data}){

    List<Widget> listW = [];
    bool isPar = false;
    data.forEach((key, value) {
      listW.add(cardDataST(
        title: key,
        title2: value.split('|')[0],
        subTitle: value.split('|')[1],
        color: isPar ? AcademyColors.primary : AcademyColors.primary_d00821,
      ));
      isPar = !isPar;
    });


    return Container(
      width: sizeW,
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            width: sizeW,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: AcademyColors.primary,
                  radius: sizeH * 0.025,
                  child: CircleAvatar(
                    radius: sizeH * 0.02,
                    backgroundColor: Colors.white,
                    child: Center(
                      child: Text(num,style: AcademyStyles().styleLato(
                          color: AcademyColors.primary,size: sizeH * 0.025
                      )),
                    ),
                  ),
                ),
                SizedBox(width: sizeW * 0.01,),
                FittedBox(
                  fit:BoxFit.contain,
                  child: Container(
                    constraints: BoxConstraints(minWidth: sizeW * 0.3, maxWidth: sizeW * 0.5),
                    child: Text(title,textAlign: TextAlign.center,style: AcademyStyles().stylePoppins(
                        size: sizeH * 0.022,color: AcademyColors.primary,fontWeight: FontWeight.bold
                    )),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: sizeH * 0.02,),
          SizedBox(
            width: sizeW,
            child: Column(
              children: listW,
            ),
          ),
        ],
      ),
    );
  }

  Widget cardDataST({required String title, required String title2, required String subTitle, required Color color}){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: sizeW * 0.02),
      padding: EdgeInsets.symmetric(vertical: sizeH * 0.015),
      color: color,
      child: Row(
        children: [
          SizedBox(
            width: sizeW * 0.25,
            child: Center(
              child: Text(title,style: AcademyStyles().stylePoppins(
                size: sizeH * 0.025,color: Colors.white
              )),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title2,style: AcademyStyles().stylePoppins(
                    size: sizeH * 0.018,color: Colors.white
                )),
                Text(subTitle,style: AcademyStyles().stylePoppins(
                    size: sizeH * 0.015,color: Colors.white
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}


import 'package:academybw/config/academy_colors.dart';
import 'package:academybw/config/academy_style.dart';
import 'package:academybw/main.dart';
import 'package:academybw/providers/quiz_provider.dart';
import 'package:academybw/ui/menu/quiz/widgets/card_question.dart';
import 'package:academybw/ui/menu/quiz/widgets/roulette_widget.dart';
import 'package:academybw/widgets_shared/button_general.dart';
import 'package:academybw/widgets_shared/circular_progress_colors.dart';
import 'package:academybw/widgets_shared/widgets_shared.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  late QuizProvider quizProvider;
  bool isPageFinish = false;

  @override
  void initState() {
    super.initState();
    initialData();
  }

  Future initialData() async{
    Future.delayed(const Duration(milliseconds: 100))
        .then((value) => quizProvider.loadDataQuiz());
  }

  @override
  Widget build(BuildContext context) {
    quizProvider = Provider.of<QuizProvider>(context);

    bool isFinish = quizProvider.posQuestion == (quizProvider.listQuestion.length - 1);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            if(isPageFinish)...[
              pageFinish(),
            ]else...[
              SizedBox(height: sizeH * 0.01,),
              headerContainer(),
              SizedBox(height: sizeH * 0.02,),
              if(quizProvider.loadData)...[
                Expanded(
                  child:
                  circularProgressColors(widthContainer1: sizeW,widthContainer2: sizeW * 0.05) ,
                ),
              ]else...[
                bodyQuiz(),
                Expanded(child: cardContainer(),)
              ],
              if(isFinish)...[
                buttonFinish()
              ],
            ],
          ],
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

  Widget bodyQuiz(){
    return Container(
      width: sizeW,
      margin: EdgeInsets.symmetric(horizontal: sizeW * 0.06),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          cardHeaderPagePosition(),
          SizedBox(height: sizeH * 0.02),
          const Roulette(),
          SizedBox(height: sizeH * 0.04,),
        ],
      ),
    );
  }

  Widget cardHeaderPagePosition(){

    String pageSt = '${quizProvider.posQuestion + 1}/${quizProvider.listQuestion.length}';
    String header = '';
    if(quizProvider.listQuestion.isNotEmpty){
      header = quizProvider.listQuestion[quizProvider.posQuestion]['header'] ?? '';
    }

    return SizedBox(
      width: sizeW,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(child: bannerTitle(type: 4,descrip: header)),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Chapter',style: AcademyStyles().styleLato(size: 8,color: AcademyColors.colors_737373),),
              Text(pageSt,style: AcademyStyles().styleLato(size: 12,color: AcademyColors.primary,fontWeight: FontWeight.bold),)
            ],
          )
        ],
      ),
    );
  }

  Widget cardContainer(){

    List<Widget> listW = [];

    for(int x = 0; x < quizProvider.listQuestion.length; x++){
      listW.add(
          CardQuestion(question: quizProvider.listQuestion[x],)
      );
    }

    return PageView(
      controller: quizProvider.controllerPageView,
      scrollDirection: Axis.horizontal,
      children: listW,
      onPageChanged: (page){
        if(page > quizProvider.posQuestion){
          quizProvider.changePosCarruselNext();
        }else{
          quizProvider.changePosCarruselPreviu();
        }
      },
    );
  }

  Widget buttonFinish(){
    return Container(
      width: sizeW,
      margin: EdgeInsets.only(bottom: sizeH * 0.02,top: sizeH * 0.02),
      child: ButtonGeneral(
        title: 'Continuar',
        margin: EdgeInsets.symmetric(horizontal: sizeW * 0.3),
        height: sizeH * 0.05,
        backgroundColor: AcademyColors.primary,
        textStyle: AcademyStyles().styleLato(size: sizeH * 0.02,color: Colors.white, fontWeight: FontWeight.bold),
        onPressed: (){
          isPageFinish = true;
          setState(() {});
        },
      ),
    );
  }

  Widget pageFinish(){

    TextStyle style = AcademyStyles().styleLato(size: 14,color: AcademyColors.colors_787878);

    return SizedBox(
      width: sizeW,
      child: Column(
        children: [
          Container(
            width: sizeW,
            margin: EdgeInsets.only(right: sizeW * 0.1,top: sizeH * 0.02),
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: Icon(Icons.cancel_outlined,size: sizeH * 0.04,color: AcademyColors.primary),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
          ),
          Container(
            width: sizeW,
            margin: EdgeInsets.symmetric(horizontal: sizeW * 0.2),
            child: Text('Thank you for taking the Bridgewhat Acquisition quiz',
            style: AcademyStyles().stylePoppins(
              size: 20,
              color: AcademyColors.colors_787878,
              fontWeight: FontWeight.bold
            ),textAlign: TextAlign.center),
          ),
          SizedBox(height: sizeH * 0.03,),
          Container(
            width: sizeW,
            margin: EdgeInsets.symmetric(horizontal: sizeW * 0.15),
            child: Card(
              elevation: 10,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: sizeH * 0.02,),
                  Text('80%',style: AcademyStyles().stylePoppins(size: sizeH * 0.05,color: AcademyColors.primary,fontWeight: FontWeight.bold),),
                  Text('HIGH',style: AcademyStyles().stylePoppins(size: sizeH * 0.025,color: AcademyColors.primary),),
                  SizedBox(height: sizeH * 0.02,),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: sizeW * 0.05),
                    height: 10,
                    decoration: BoxDecoration(
                      color: AcademyColors.primary,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                        width: 1.0,
                        color: AcademyColors.primary,
                      ),
                    ),
                    child: const ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: LinearProgressIndicator(
                        value: 0.8,
                        valueColor: AlwaysStoppedAnimation<Color>(AcademyColors.primary),
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: sizeH * 0.025,),

                ],
              ),
            ),
          ),
          SizedBox(height: sizeH * 0.025,),
          SizedBox(
            width: sizeW,
            child: Text("There's work to do!",textAlign: TextAlign.center,
                style: AcademyStyles().styleLato(size: 14,color: AcademyColors.primary)),
          ),
          SizedBox(height: sizeH * 0.02,),
          SizedBox(
            height: sizeH * 0.35,
            width: sizeW,
            child: Expanded(
              child: Container(
                width: sizeW,
                margin: EdgeInsets.symmetric(horizontal: sizeW * 0.05),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text('Bridgewhat’s mission is to help other companies grow their businesses in a B2B digital transformation context. We have developed 20 Levers of Growth organised around 5 stages of client engagement in a bid to help companies understand how they can grow.',style: style,),
                      SizedBox(height: sizeH * 0.02,),
                      Text('The acquisition phase is the second stage, and it is a key part of developing a successful business. Being knowleagable about how to acquire your clients is vital if you want to succeed. In this phase, companies should concentrate efforts on going after clients and converting potential customers into their effective customers.',style: style,),
                      SizedBox(height: sizeH * 0.02,),
                      Text('If you wish you learn more about the Acqusition phase and how to implement the 20 LOG, use the buttons below to watch our YouTube videos, follow us in LinkedIn or email us.',style: style,),
                      SizedBox(height: sizeH * 0.02,),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: sizeH * 0.02,),
          Container(
            width: sizeW,
            margin: EdgeInsets.symmetric(horizontal: sizeW * 0.1),
            child: ButtonGeneral(
              title: 'Share on Linkedin',
              textStyle: AcademyStyles().styleLato(size: 16,color: Colors.white,fontWeight: FontWeight.bold),

              onPressed: (){},
              backgroundColor: AcademyColors.primary,
              height: sizeH * 0.05,
              widgetLatDer: Container(
                height: sizeH * 0.03,
                width: sizeH * 0.03,
                margin: EdgeInsets.only(left: sizeW * 0.18,right: sizeW * 0.01),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: Image.asset('assets/image/shared1_white.png').image,
                        fit: BoxFit.fitWidth
                    )
                ),
              ),
              widgetLatIzq: Container(margin: EdgeInsets.only(right: sizeW * 0.15)),
            ),
          )
        ],
      ),
    );
  }
}

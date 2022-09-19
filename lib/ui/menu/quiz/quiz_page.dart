import 'package:academybw/config/academy_colors.dart';
import 'package:academybw/config/academy_style.dart';
import 'package:academybw/main.dart';
import 'package:academybw/ui/menu/quiz/provider/quiz_provider.dart';
import 'package:academybw/ui/menu/quiz/widgets/card_question.dart';
import 'package:academybw/ui/menu/quiz/widgets/order_question.dart';
import 'package:academybw/ui/menu/quiz/widgets/roulette_widget.dart';
import 'package:academybw/ui/menu/quiz/widgets/union_dragdrop_question.dart';
import 'package:academybw/ui/menu/videos/widgets/tabbar_widget.dart';
import 'package:academybw/utils/get_data.dart';
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
  double successQuestions = 0;

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
    TypeQuestion typeQuestion = quizProvider.listQuestion[quizProvider.posQuestion]['type'];


    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            if(isPageFinish)...[
              Expanded(
                child: pageFinish(),
              )
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
              if(isFinish && answeredRefresh())...[
                buttonFinish()
              ]else...[
                if(typeQuestion == TypeQuestion.multi)...[
                  Container(
                    width: sizeW,
                    padding: EdgeInsets.symmetric(vertical: sizeH * 0.015),
                    child: Text('"Select all answers that apply."',textAlign: TextAlign.center,
                        style: AcademyStyles().stylePoppins(size: sizeH * 0.02,color: AcademyColors.primary)),
                  )
                ],
                if(typeQuestion == TypeQuestion.union)...[
                  Container(
                    width: sizeW,
                    padding: EdgeInsets.symmetric(vertical: sizeH * 0.015,horizontal: sizeW * 0.02),
                    child: Text('Note: Drag each of the rectangles from the left and drop it on the corresponding correct  option on the right',textAlign: TextAlign.center,
                        style: AcademyStyles().stylePoppins(size: sizeH * 0.016,color: AcademyColors.primary)),
                  )
                ],
              ],
              const Tabbar(),
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

      if(quizProvider.listQuestion[x]['type'] == TypeQuestion.simple){
        listW.add(CardQuestion(question: quizProvider.listQuestion[x],));
      }
      if(quizProvider.listQuestion[x]['type'] == TypeQuestion.multi){
        listW.add(CardQuestion(question: quizProvider.listQuestion[x],));
      }
      if(quizProvider.listQuestion[x]['type'] == TypeQuestion.union){
        listW.add(UnionDragQuestion(question: quizProvider.listQuestion[x],));
      }
      if(quizProvider.listQuestion[x]['type'] == TypeQuestion.order){
        listW.add(OrderQuestion(question: quizProvider.listQuestion[x],));
      }
    }

    debugPrint('page : ${quizProvider.posQuestion}');

    return PageView(
      controller: quizProvider.controllerPageView,
      physics: answeredRefresh() ? const BouncingScrollPhysics() : const NeverScrollableScrollPhysics(),
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

  bool answeredRefresh(){
    bool result = false;
    Map<String,dynamic> question = quizProvider.listQuestion[quizProvider.posQuestion];

    if(question['type'] == TypeQuestion.simple){
      result = question['answered'].toString().isNotEmpty;
    }
    if(question['type'] == TypeQuestion.multi){
      result = question['answered'].toString().isNotEmpty;
    }
    if(question['type'] == TypeQuestion.union){
      int cant = 0;
      for (var element in (question['answered'] as List)) {
        if((element as List).isNotEmpty){ cant++; }
      }
      result = cant == 1;
    }
    if(question['type'] == TypeQuestion.order){
      List listCant = question['answered'];
      bool equals = true;
      for(int x = 0; x < listCant.length; x++){
        if(question['answered'][x] != question['questions'][x]){
          equals = false;
        }
      }
      result = !equals;
    }

    return result;
  }

  Widget buttonFinish(){
    return Container(
      width: sizeW,
      margin: EdgeInsets.only(bottom: sizeH * 0.02,top: sizeH * 0.02),
      child: ButtonGeneral(
        title: 'Finish',
        margin: EdgeInsets.symmetric(horizontal: sizeW * 0.3),
        height: sizeH * 0.05,
        backgroundColor: AcademyColors.primary,
        textStyle: AcademyStyles().styleLato(size: sizeH * 0.02,color: Colors.white, fontWeight: FontWeight.bold),
        onPressed: () async {
          await answeredFinish();
          isPageFinish = true;
          setState(() {});
        },
      ),
    );
  }

  Future answeredFinish() async{
    int questionSuccess = 0;
    List<Map<String,dynamic>> questions = quizProvider.listQuestion;

    for (var question in questions) {
      if(question['type'] == TypeQuestion.simple){
        if(question['answered'] == question['result']){
          questionSuccess++;
        }
      }
      if(question['type'] == TypeQuestion.multi){
        List data = question['answered'].toString().split('|');
        bool allExists = true;
        for (var element in data) {
          if(!question['result'].toString().contains(element)){
            allExists = false;
          }
        }
        if(allExists && question['answered'].toString().split('|').length == question['result'].toString().split('|').length){
          questionSuccess++;
        }
      }
      if(question['type'] == TypeQuestion.union){
        List<List<String>> listAnswered = question['answered'];
        List<String> listResult = question['result'];

        List<String> lastAnswered = listAnswered.last;
        int cantTrue = 0;
        for (var last in lastAnswered) {
          for (var element in listResult) {
            if(element.contains(last)){ cantTrue++; }
          }
        }
        if(cantTrue == listResult.length){
          questionSuccess++;
        }
      }
      if(question['type'] == TypeQuestion.order){
        List listCant = question['answered'];
        bool equals = true;
        for(int x = 0; x < listCant.length; x++){
          if(question['answered'][x] != question['result'][x]){
            equals = false;
          }
        }
        if(equals){
          questionSuccess++;
        }
      }
    }

    successQuestions = (questionSuccess * 100) / 50;
    setState(() {});
  }

  Widget pageFinish(){

    TextStyle style = AcademyStyles().styleLato(size: 14,color: AcademyColors.colors_787878);

    String urlImage = 'podium_0';
    if(successQuestions >= 41 && successQuestions <= 50){ urlImage = 'podium_1'; }
    if(successQuestions >= 51 && successQuestions <= 75){ urlImage = 'podium_2'; }
    if(successQuestions >= 76 && successQuestions <= 90){ urlImage = 'podium_3'; }
    if(successQuestions >= 91 && successQuestions <= 99){ urlImage = 'podium_4'; }
    if(successQuestions >= 100){ urlImage = 'podium_5'; }

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
            margin: EdgeInsets.symmetric(horizontal: sizeW * 0.15),
            child: Text('Thank you for taking the Bridgewhat Acquisition quiz',
                style: AcademyStyles().stylePoppins(
                    size: sizeH * 0.02,
                    color: AcademyColors.colors_787878,
                    fontWeight: FontWeight.bold
                ),textAlign: TextAlign.center),
          ),
          SizedBox(height: sizeH * 0.01,),
          Container(
            width: sizeW,
            margin: EdgeInsets.symmetric(horizontal: sizeW * 0.05),
            child: Text('A minimum of 50% score is needed to be able to share',
                style: AcademyStyles().stylePoppins(
                    size: sizeH * 0.014,
                    color: AcademyColors.primary,
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
                  Text('${successQuestions.toStringAsFixed(0)}%',style: AcademyStyles().stylePoppins(size: sizeH * 0.05,color: AcademyColors.primary,fontWeight: FontWeight.bold),),
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
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: LinearProgressIndicator(
                        value: (successQuestions / 100),
                        valueColor: const AlwaysStoppedAnimation<Color>(AcademyColors.primary),
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: sizeH * 0.025,),

                ],
              ),
            ),
          ),
          Stack(
            children: [
              SizedBox(
                width: sizeW,
                child: Center(
                  child: Container(
                    height: sizeH * 0.2,
                    width: sizeH * 0.2,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: Image.asset('assets/image/$urlImage.png').image,
                          fit: BoxFit.fitWidth
                      ),
                    ),
                  ),
                ),
              ),
              // if(successQuestions >= 50.0)...[
              //   SizedBox(
              //     height: sizeH * 0.2,
              //     width: sizeH,
              //     child: Align(
              //       alignment: Alignment.topLeft,
              //       child: Container(
              //         margin: EdgeInsets.only(left: sizeW * 0.13,top: sizeH * 0.02),
              //         padding: EdgeInsets.all(sizeH * 0.005),
              //         decoration: const BoxDecoration(
              //           color: Colors.white,
              //           borderRadius: BorderRadius.all(Radius.circular(10)),
              //         ),
              //         child: Column(
              //           mainAxisSize: MainAxisSize.min,
              //           children: [
              //             SizedBox(
              //               width: sizeW * 0.2,
              //               child: Text('Share on',style: AcademyStyles().styleLato(
              //                   size: sizeH * 0.02,color: AcademyColors.primary,fontWeight: FontWeight.bold),
              //                 textAlign: TextAlign.center,
              //               ),
              //             ),
              //             Container(
              //               height: sizeH * 0.028,
              //               width: sizeH * 0.028,
              //               decoration: BoxDecoration(
              //                 image: DecorationImage(
              //                     image: Image.asset('assets/image/shared1.png').image,
              //                     fit: BoxFit.fitWidth
              //                 ),
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //   ),
              // ]
            ],
          ),
          SizedBox(
            width: sizeW,
            child: Text("There's work to do!",textAlign: TextAlign.center,
                style: AcademyStyles().styleLato(size: 14,color: AcademyColors.primary)),
          ),
          if(successQuestions > 50.0)...[
            SizedBox(height: sizeH * 0.02,),
            Container(
              width: sizeW,
              margin: EdgeInsets.symmetric(horizontal: sizeW * 0.15),
              child: ButtonGeneral(
                title: 'Share on Linkedin',
                textStyle: AcademyStyles().styleLato(size: sizeH * 0.016,color: Colors.white,fontWeight: FontWeight.bold),
                onPressed: (){},
                radius: 5,
                backgroundColor: AcademyColors.primary,
                height: sizeH * 0.05,
                widgetLatDer: Container(
                  height: sizeH * 0.03,
                  width: sizeH * 0.03,
                  margin: EdgeInsets.only(left: sizeW * 0.1),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: Image.asset('assets/image/shared1_white.png').image,
                          fit: BoxFit.fitWidth
                      )
                  ),
                ),
                widgetLatIzq: Container(margin: EdgeInsets.only(right: sizeW * 0.05)),
              ),
            )
          ],
          SizedBox(height: sizeH * 0.02,),
          Expanded(
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
          SizedBox(height: sizeH * 0.02,),
          // if(successQuestions > 50.0)...[
          //   Container(
          //     width: sizeW,
          //     margin: EdgeInsets.symmetric(horizontal: sizeW * 0.1),
          //     child: ButtonGeneral(
          //       title: 'Share on Linkedin',
          //       textStyle: AcademyStyles().styleLato(size: 16,color: Colors.white,fontWeight: FontWeight.bold),
          //
          //       onPressed: (){},
          //       backgroundColor: AcademyColors.primary,
          //       height: sizeH * 0.05,
          //       widgetLatDer: Container(
          //         height: sizeH * 0.03,
          //         width: sizeH * 0.03,
          //         margin: EdgeInsets.only(left: sizeW * 0.18,right: sizeW * 0.01),
          //         decoration: BoxDecoration(
          //             image: DecorationImage(
          //                 image: Image.asset('assets/image/shared1_white.png').image,
          //                 fit: BoxFit.fitWidth
          //             )
          //         ),
          //       ),
          //       widgetLatIzq: Container(margin: EdgeInsets.only(right: sizeW * 0.15)),
          //     ),
          //   )
          // ],
        ],
      ),
    );
  }
}

import 'package:academybw/config/academy_colors.dart';
import 'package:academybw/config/academy_style.dart';
import 'package:academybw/main.dart';
import 'package:academybw/providers/menu_provider.dart';
import 'package:academybw/providers/quiz_provider.dart';
import 'package:academybw/ui/menu/quiz/widgets/roulette_widget.dart';
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
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
          // Expanded(child: Container(color: Colors.red),)
          //Expanded(child: cardContainer()),
          // Flexible(child: cardContainer()),
          // cardContainer(),
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
      bool isSelected = x == quizProvider.posQuestion;
      listW.add(
          Container(
            color: isSelected ? AcademyColors.primary : AcademyColors.colors_787878,
            child: Center(
              child: Text('Page ${quizProvider.posQuestion}'),
            ),
          )
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
}

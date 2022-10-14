import 'package:academybw/config/academy_colors.dart';
import 'package:academybw/config/academy_style.dart';
import 'package:academybw/main.dart';
import 'package:academybw/ui/menu/quiz/provider/quiz_provider.dart';
import 'package:academybw/utils/get_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardQuestion extends StatefulWidget {
  const CardQuestion({Key? key, required this.question}) : super(key: key);
  final Map<String,dynamic> question;

  @override
  State<CardQuestion> createState() => _CardQuestionState();
}

class _CardQuestionState extends State<CardQuestion> {

  late QuizProvider quizProvider;

  @override
  Widget build(BuildContext context) {

    quizProvider = Provider.of<QuizProvider>(context);

    List<String> listQuestion = [];
    if(widget.question.containsKey('questions')){
      listQuestion = widget.question['questions'];
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: sizeW * 0.05),
      width: sizeW,
      child: Column(
        children: [
          Text(widget.question['title'],style: AcademyStyles().styleLato(size: 16,color: AcademyColors.colors_787878),),
          SizedBox(height: sizeH * 0.025),
          Expanded(
            child: ListView.builder(
              itemCount: listQuestion.length,
              itemBuilder: (context,i){
                return containerQuestions(answered: listQuestion[i],index: i + 1);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget containerQuestions({required String answered, required int index}){

    String num = mapABC.containsKey(index) ? mapABC[index]! : '??';
    bool selected = false;
    if(widget.question['type'] == TypeQuestion.simple){
      selected = widget.question['answered'] == answered;
    }else{
      selected = widget.question['answered'].toString().contains(answered);
    }


    return InkWell(
      child: Container(
        margin: EdgeInsets.only(bottom: sizeH * 0.02),
        padding: EdgeInsets.all(sizeH * 0.01),
        decoration: BoxDecoration(
          color: selected ? AcademyColors.primary : Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(
            width: 1.0,
            color: AcademyColors.primary,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(num,style: AcademyStyles().styleLato(size: 16,color: selected ? Colors.white : AcademyColors.primary,fontWeight: FontWeight.bold)),
            SizedBox(width: sizeW * 0.05,),
            Expanded(
              child: Center(
                child: Text(answered,style: AcademyStyles().styleLato(size: 16,color: selected ? Colors.white : AcademyColors.primary,fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
      onTap: (){
        quizProvider.onTapQuestion(answered: answered, idQuestion: widget.question['id']);
        if(widget.question['type'] == TypeQuestion.simple){
          quizProvider.pageNext();
        }
      },
    );
  }

}

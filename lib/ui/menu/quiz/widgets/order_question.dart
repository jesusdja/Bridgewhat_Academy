import 'package:academybw/config/academy_colors.dart';
import 'package:academybw/config/academy_style.dart';
import 'package:academybw/main.dart';
import 'package:academybw/ui/menu/quiz/provider/quiz_provider.dart';
import 'package:academybw/ui/menu/quiz/widgets/union_dragdrop_question.dart';
import 'package:academybw/utils/get_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderQuestion extends StatefulWidget {
  const OrderQuestion({Key? key, required this.question}) : super(key: key);
  final Map<String,dynamic> question;

  @override
  State<OrderQuestion> createState() => _OrderQuestionState();
}

class _OrderQuestionState extends State<OrderQuestion> {

  late QuizProvider quizProvider;

  @override
  void initState() {
    super.initState();
    initialData();
  }

  Future initialData()async{
    List listCant = widget.question['answered'];
    bool equals = true;
    for(int x = 0; x < listCant.length; x++){
      if(widget.question['answered'][x] != widget.question['questions'][x]){
        equals = false;
      }
    }
    if(!equals){
      await Future.delayed(const Duration(milliseconds: 500));
      bool? res = await showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) {
          return PopUpReset(idQuestion: widget.question['id'],);
        },
      );
      if(res != null && res){
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    quizProvider = Provider.of<QuizProvider>(context);

    List<String> listQuestion = [];
    // if(widget.question.containsKey('answered')){
    //   listQuestion = widget.question['answered'];
    // }


    int? pos;
    for(int x = 0; x < quizProvider.listQuestion.length; x++){
      if(quizProvider.listQuestion[x]['id'] == widget.question['id']){
        pos = x;
      }
    }
    if(pos != null){
      listQuestion = quizProvider.listQuestion[pos]['answered'] ?? [];
    }

    List<Widget> listW = [];
    for (int x = 0; x < listQuestion.length; x++) {
      listW.add(containerQuestions(answered: listQuestion[x],index: x + 1));
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: sizeW * 0.05),
      width: sizeW,
      child: Column(
        children: [
          Text(widget.question['title'],style: AcademyStyles().styleLato(size: 16,color: AcademyColors.colors_787878),),
          SizedBox(height: sizeH * 0.025),
          Expanded(
            child: ReorderableListView(
              children: listW,
              onReorder: (oldindex,newindex) {
                quizProvider.reorderData(oldindex: oldindex, newindex: newindex, idQuestion: widget.question['id']);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget containerQuestions({required String answered, required int index}){

    String num = mapABC.containsKey(index) ? mapABC[index]! : '??';

    return Container(
      key: ValueKey(num),
      margin: EdgeInsets.only(bottom: sizeH * 0.02),
      padding: EdgeInsets.all(sizeH * 0.01),
      decoration: BoxDecoration(
        color: AcademyColors.primary,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        border: Border.all(
          width: 1.0,
          color: AcademyColors.primary,
        ),
      ),
      child: Row(
        children: [
          Text(num,style: AcademyStyles().styleLato(size: 16,color: Colors.white,fontWeight: FontWeight.bold)),
          SizedBox(width: sizeW * 0.05,),
          Expanded(
            child: Center(
              child: Text(answered,style: AcademyStyles().styleLato(size: 16,color: Colors.white,fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }

}

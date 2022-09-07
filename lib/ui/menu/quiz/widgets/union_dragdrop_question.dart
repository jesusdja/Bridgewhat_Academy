import 'package:academybw/config/academy_colors.dart';
import 'package:academybw/config/academy_style.dart';
import 'package:academybw/main.dart';
import 'package:academybw/ui/menu/quiz/provider/quiz_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UnionDragQuestion extends StatefulWidget {
  const UnionDragQuestion({Key? key, required this.question}) : super(key: key);
  final Map<String,dynamic> question;

  @override
  State<UnionDragQuestion> createState() => _UnionDragQuestionState();
}

class _UnionDragQuestionState extends State<UnionDragQuestion> {

  late QuizProvider quizProvider;
  String colum1Selectd = '';
  late Map<String,Color> mapColor;

  List columns = [];
  int dragC = 0;

  @override
  void initState() {
    super.initState();
    for (var element in (widget.question['answered'] as List)) {
      if((element as List).isEmpty){ dragC++; }
    }
  }

  @override
  Widget build(BuildContext context) {

    quizProvider = Provider.of<QuizProvider>(context);
    columns = widget.question['answered'] ?? [];

    return Container(
      margin: EdgeInsets.symmetric(horizontal: sizeW * 0.05),
      width: sizeW,
      child: Column(
        children: [
          Text(widget.question['title'],style: AcademyStyles().styleLato(size: 16,color: AcademyColors.colors_787878),),
          SizedBox(height: sizeH * 0.025),
          Expanded(
            child: SizedBox(
              width: sizeW,
              child: containerQuestions(),
            ),
          )
        ],
      ),
    );
  }

  Widget containerQuestions(){

    Widget body = Container();

    if((dragC + 1) < columns.length){
      body = Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: columnDrag(dataDrag: columns[dragC]),
          ),
          SizedBox(width: sizeW * 0.02,),
          Expanded(
            child: columnDrop(dataDrop: columns[dragC + 1]),
          ),
        ],
      );
    }else{
      body = Expanded(
        child: columnDrop(dataDrop: columns[dragC]),
      );
    }


    return body;
  }

  Widget columnDrag({required List dataDrag}){

    List<Widget> listW = [];
    for (int x = 0; x < dataDrag.length; x++) {

      listW.add(
        Draggable<int>(
          data: x,
          child: containerColumn(text: dataDrag[x]),
          feedback: containerColumn(text: dataDrag[x]),
          childWhenDragging: Container(),
        )
      );
    }

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: listW,
      ),
    );
  }

  Widget columnDrop({required List dataDrop}){
    List<Widget> listW = [];
    for (int x = 0; x < dataDrop.length; x++) {

      listW.add(
          DragTarget<int>(
            onAccept: (value) {
              if((dragC + 2) != columns[dragC + 1][x].toString().split('/').length){
                String removeSt = columns[dragC][value];
                (columns[dragC] as List).removeAt(value);
                columns[dragC + 1][x] = '$removeSt / ${columns[dragC + 1][x]}';

                if((columns[dragC] as List).isEmpty){ dragC++; }

                setState(() {});
              }
            },
            builder: (_, candidateData, rejectedData) {
              return containerColumn(text: dataDrop[x]);
            },
          )
      );
    }

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: listW,
      ),
    );
  }

  Widget containerColumn({required String text}){
    return Container(
      width: sizeW * 0.5,
      padding: EdgeInsets.symmetric(horizontal: sizeW * 0.02,vertical: sizeH * 0.02),
      margin: EdgeInsets.only(bottom: sizeH * 0.01),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        border: Border.all(
          width: 1.0,
          color: AcademyColors.primary,
        ),
      ),
      child: Text(text,style: AcademyStyles().stylePoppins(size: sizeH * 0.02,color: Colors.black),textAlign: TextAlign.center),
    );
  }

}

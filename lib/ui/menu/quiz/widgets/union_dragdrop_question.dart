import 'package:academybw/config/academy_colors.dart';
import 'package:academybw/config/academy_style.dart';
import 'package:academybw/main.dart';
import 'package:academybw/ui/menu/quiz/provider/quiz_provider.dart';
import 'package:academybw/widgets_shared/button_general.dart';
import 'package:flutter/cupertino.dart';
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
  String keySelected = '';

  @override
  void initState() {
    super.initState();
    initialData();
  }

  Future initialData() async{
    for (var element in (widget.question['answered'] as List)) {
      if((element as List).isEmpty){ dragC++; }
    }
    if((dragC + 1) >= widget.question['answered'].length){
      initialDataPopUp();
    }
  }

  Future initialDataPopUp() async{
    await Future.delayed(const Duration(milliseconds: 500));
    bool? res = await showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return PopUpReset(idQuestion: widget.question['id'],);
      },
    );
    if(res != null && res){
      dragC = 0;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {

    quizProvider = Provider.of<QuizProvider>(context);

    int? pos;
    for(int x = 0; x < quizProvider.listQuestion.length; x++){
      if(quizProvider.listQuestion[x]['id'] == widget.question['id']){
        pos = x;
      }
    }
    if(pos != null){
      columns = quizProvider.listQuestion[pos]['answered'] ?? [];
    }


    return Container(
      margin: EdgeInsets.symmetric(horizontal: sizeW * 0.05),
      width: sizeW,
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
      body = IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: columnDrag(dataDrag: columns[dragC]),
            ),
            Container(width: 1,color:  AcademyColors.colors_787878),
            Expanded(
              child: columnDrop(dataDrop: columns[dragC + 1]),
            ),
          ],
        ),
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
          child: containerColumn(text: dataDrag[x],key: '1-$x'),
          feedback: containerColumn(text: dataDrag[x],key: '1.5-$x'),
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

      bool isAccept = false;
      if((dragC + 1) < columns.length){
        isAccept = (dragC + 2) != columns[dragC + 1][x].toString().split('/').length;
      }

      listW.add(
        DragTarget<int>(
          onAccept: (value) {
            if(isAccept){
              String removeSt = columns[dragC][value];
              (columns[dragC] as List).removeAt(value);
              columns[dragC + 1][x] = '$removeSt / ${columns[dragC + 1][x]}';
              if((columns[dragC] as List).isEmpty){ dragC++; }
              setState(() {});
              actionKey(key: '2-$x');
              quizProvider.change();
            }
          },
          builder: (_, candidateData, rejectedData) {
            return containerColumn(text: dataDrop[x],isAccept: !isAccept, key: '2-$x');
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

  Future actionKey({required String key}) async{
    keySelected = key;
    setState(() {});
    await Future.delayed(const Duration(seconds: 1));
    keySelected = '';
    setState(() {});
  }

  Widget containerColumn({required String text, bool isAccept = false, required String key}){

    Color color = Colors.white;
    if(keySelected == key){
      color = AcademyColors.colorsLeversObscure;
    }

    return AnimatedContainer(
      width: sizeW * 0.3,
      padding: EdgeInsets.symmetric(horizontal: sizeW * 0.01,vertical: sizeH * 0.01),
      margin: EdgeInsets.only(top: sizeH * 0.0075, bottom: sizeH * 0.0075),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        border: Border.all(
          width: 1.0,
          color: AcademyColors.primary,
        ),
      ),
      duration: const Duration(seconds: 1),
      child: Text(text,style: AcademyStyles().stylePoppins(size: sizeH * 0.016,color: Colors.black),textAlign: TextAlign.center),
    );
  }

}

class PopUpReset extends StatefulWidget {
  const PopUpReset({Key? key, required this.idQuestion}) : super(key: key);
  final int idQuestion;

  @override
  State<PopUpReset> createState() => _PopUpResetState();
}

class _PopUpResetState extends State<PopUpReset> {
  late QuizProvider categoryProvider;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    categoryProvider = Provider.of<QuizProvider>(context);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: sizeW * 0.7,
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: sizeW,
                margin: EdgeInsets.only(right: sizeW * 0.05,top: sizeH * 0.01),
                alignment: Alignment.centerRight,
                child: InkWell(
                  child: Icon(Icons.cancel_outlined,color: AcademyColors.primary,size: sizeH * 0.03),
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Container(
                width: sizeW,
                margin: EdgeInsets.symmetric(horizontal: sizeW * 0.1),
                child: Text('If you wish to change you response,\nclick here.',style: AcademyStyles().stylePoppins(
                  size: sizeH * 0.02,color: AcademyColors.primary
                ),textAlign: TextAlign.center),
              ),
              SizedBox(height: sizeH * 0.02,),
              Container(
                width: sizeW,
                margin: EdgeInsets.symmetric(horizontal: sizeW * 0.05),
                child: Row(
                  children: [
                    Expanded(
                      child: ButtonGeneral(
                        title: 'Reset',
                        height: sizeH * 0.04,
                        borderColor: AcademyColors.primary,
                        textStyle: AcademyStyles().stylePoppins(
                            size: sizeH * 0.016,color: AcademyColors.primary
                        ),
                        onPressed: (){
                          categoryProvider.resetUnionList(idQuestion: widget.idQuestion);
                          Navigator.of(context).pop(true);
                        },
                      ),
                    ),
                    SizedBox(width: sizeW * 0.02,),
                    Expanded(
                      child: ButtonGeneral(
                        title: 'Cancel',
                        height: sizeH * 0.04,
                        textStyle: AcademyStyles().stylePoppins(
                            size: sizeH * 0.016,color: AcademyColors.primary
                        ),
                        borderColor: AcademyColors.primary,
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: sizeH * 0.02,),
            ],
          ),
        ),
      ),
    );
  }
}

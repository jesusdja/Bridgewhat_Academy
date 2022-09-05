// import 'package:academybw/config/academy_colors.dart';
// import 'package:academybw/config/academy_style.dart';
// import 'package:academybw/main.dart';
// import 'package:academybw/providers/quiz_provider.dart';
// import 'package:academybw/utils/get_data.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// class Union2Question extends StatefulWidget {
//   const Union2Question({Key? key, required this.question}) : super(key: key);
//   final Map<String,dynamic> question;
//
//   @override
//   State<Union2Question> createState() => _Union2QuestionState();
// }
//
// class _Union2QuestionState extends State<Union2Question> {
//
//   late QuizProvider quizProvider;
//   String colum1Selectd = '';
//   late Map<String,Color> mapColor;
//
//   @override
//   Widget build(BuildContext context) {
//
//     quizProvider = Provider.of<QuizProvider>(context);
//     mapColor = quizProvider.listMapColor[widget.question['id']!]!;
//
//     List<Widget> listQuestion = [];
//     List columns = widget.question['questions'] ?? [];
//     for (int x = 0; x < columns.length; x++) {
//       listQuestion.add(containerQuestions(colum1: columns[x], type: x));
//     }
//
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: sizeW * 0.05),
//       width: sizeW,
//       child: Column(
//         children: [
//           Text(widget.question['title'],style: AcademyStyles().styleLato(size: 16,color: AcademyColors.colors_787878),),
//           SizedBox(height: sizeH * 0.025),
//           SizedBox(
//             width: sizeW,
//             height: sizeH * 0.4,
//             child: SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: listQuestion,
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   Widget containerQuestions({required List<String> colum1, required int type}){
//
//     List<Widget> listW = [];
//     for (int x = 0; x < colum1.length; x++) {
//       Color bgc = Colors.white;
//       if(type == 0){
//         if(mapColor.containsKey(colum1[x])){
//           bgc = mapColor[colum1[x]]!;
//         }
//       }else{
//         (widget.question['answered'] as Map).forEach((key, value) {
//           String keySelect = key.toString().substring(0,(key.toString().length - 1));
//           if(value == colum1[x] && mapColor.containsKey(keySelect)){
//             bgc = mapColor[keySelect]!;
//           }
//         });
//       }
//
//       listW.add(
//         InkWell(
//           child: Container(
//             width: sizeW,
//             padding: EdgeInsets.symmetric(horizontal: sizeW * 0.02,vertical: sizeH * 0.02),
//             margin: EdgeInsets.only(bottom: sizeH * 0.01),
//             decoration: BoxDecoration(
//               color: bgc,
//               borderRadius: const BorderRadius.all(Radius.circular(5)),
//               border: Border.all(
//                 width: 1.0,
//                 color: AcademyColors.primary,
//               ),
//             ),
//             child: Text(colum1[x],style: AcademyStyles().stylePoppins(size: sizeH * 0.015,color: Colors.black),textAlign: TextAlign.center),
//           ),
//           onTap: (){
//             if(type == 0){
//               if(mapColor.containsKey(colum1[x])){
//                 colum1Selectd = '';
//                 quizProvider.removeMapColor2(id: widget.question['id'], stRemove: '${colum1[x]}1');
//                 quizProvider.removeMapColor2(id: widget.question['id'], stRemove: '${colum1[x]}2');
//                 quizProvider.removeMapColor2(id: widget.question['id'], stRemove: '${colum1[x]}3');
//                 quizProvider.onRemoveValueToQuestion(removeKey: '${colum1[x]}$type', idQuestion: widget.question['id']);
//               }else{
//                 colum1Selectd = colum1[x];
//                 quizProvider.addMapColor(id: widget.question['id'], stAdd: colum1[x], colorAdd: colorsListQuestionUnion[x]);
//                 mapColor[colum1[x]] = colorsListQuestionUnion[x];
//               }
//             }else{
//               if(colum1Selectd.isNotEmpty){
//                 quizProvider.onTapQuestion(answered: '$colum1Selectd$type|${colum1[x]}', idQuestion: widget.question['id']);
//               }
//             }
//             setState(() {});
//           },
//         ),
//       );
//     }
//
//     return Container(
//       width: sizeW * 0.35,
//       margin: EdgeInsets.symmetric(horizontal: sizeW * 0.02),
//       child: SingleChildScrollView(
//         child: Column(
//           children: listW,
//         ),
//       ),
//     );
//   }
//
// }

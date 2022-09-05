// import 'package:academybw/config/academy_colors.dart';
// import 'package:academybw/config/academy_style.dart';
// import 'package:academybw/main.dart';
// import 'package:academybw/providers/quiz_provider.dart';
// import 'package:academybw/utils/get_data.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// class UnionQuestion extends StatefulWidget {
//   const UnionQuestion({Key? key, required this.question}) : super(key: key);
//   final Map<String,dynamic> question;
//
//   @override
//   State<UnionQuestion> createState() => _UnionQuestionState();
// }
//
// class _UnionQuestionState extends State<UnionQuestion> {
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
//           Expanded(
//             child: SizedBox(
//               width: sizeW,
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
//           if(value == colum1[x] && mapColor.containsKey(key)){
//             bgc = mapColor[key]!;
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
//             child: Text(colum1[x].replaceAll('#', ''),style: AcademyStyles().stylePoppins(size: sizeH * 0.02,color: Colors.black),textAlign: TextAlign.center),
//           ),
//           onTap: (){
//             if(type == 0){
//               if(mapColor.containsKey(colum1[x])){
//                 colum1Selectd = '';
//                 quizProvider.removeMapColor(id: widget.question['id'], stRemove: colum1[x]);
//                 //mapColor.remove(colum1[x]);
//                 quizProvider.onRemoveValueToQuestion(removeKey: colum1[x], idQuestion: widget.question['id']);
//               }else{
//                 colum1Selectd = colum1[x];
//                 quizProvider.addMapColor(id: widget.question['id'], stAdd: colum1[x], colorAdd: colorsListQuestionUnion[x]);
//                 mapColor[colum1[x]] = colorsListQuestionUnion[x];
//               }
//             }
//             if(type == 1){
//               if(colum1Selectd.isNotEmpty){
//                 quizProvider.onTapQuestion(answered: '$colum1Selectd|${colum1[x]}', idQuestion: widget.question['id']);
//               }
//             }
//             setState(() {});
//           },
//         ),
//       );
//     }
//
//     return Expanded(
//       child: Container(
//         margin: EdgeInsets.symmetric(horizontal: sizeW * 0.04),
//         child: SingleChildScrollView(
//           child: Column(
//             children: listW,
//           ),
//         ),
//       ),
//     );
//   }
//
// }

import 'package:academybw/config/academy_colors.dart';
import 'package:academybw/main.dart';
import 'package:academybw/providers/quiz_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Roulette extends StatefulWidget {
  const Roulette({Key? key}) : super(key: key);

  @override
  State<Roulette> createState() => _RouletteState();
}

class _RouletteState extends State<Roulette> {

  late QuizProvider quizProvider;

  @override
  void dispose() {
    super.dispose();
    quizProvider.disposeProvider();
  }

  @override
  Widget build(BuildContext context) {

    quizProvider = Provider.of<QuizProvider>(context);

    List<Widget> listW = [];

    for(int x = 0; x < quizProvider.listQuestion.length; x++){
      bool isSelected = x == quizProvider.posQuestion;
      listW.add(
        Container(
          width: sizeW * 0.1,
          height: sizeH * 0.01,
          margin: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
            color: isSelected ? AcademyColors.primary : AcademyColors.colors_787878,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
        )
      );
    }

    return SizedBox(
      width: sizeW,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Icon(Icons.arrow_back,size: sizeH * 0.03,color: AcademyColors.colors_787878),
            ),
            radius: 20,
            customBorder: const CircleBorder(),
            onTap: (){
              if(quizProvider.posQuestion > 0){
                quizProvider.changePosPageViewPreviu(pos: quizProvider.posQuestion);
              }
            },
          ),
          Expanded(
            child: SizedBox(
              height: sizeH * 0.005,
              child: ListView.builder(
                controller: quizProvider.scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: listW.length,
                itemBuilder: (context,index){
                  return listW[index];
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

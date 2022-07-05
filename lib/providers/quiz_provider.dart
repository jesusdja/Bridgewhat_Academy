import 'package:flutter/material.dart';
import 'dart:math' as math;

class QuizProvider extends ChangeNotifier {

  bool loadData = true;
  List<Map<String,dynamic>> listQuestion = [];
  int posQuestion = 0;

  late ScrollController scrollController;
  late PageController controllerPageView;

  Future loadDataQuiz() async{

    loadData = true;
    scrollController = ScrollController();
    controllerPageView = PageController(initialPage: 0);
    posQuestion = 0;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 3));

    listQuestion = [];
    Map<String,dynamic> question = {};
    for(int x = 1; x <= 10; x = x + 2){
      question = {
        'id' : x,
        'header' : 'Information',
        'title' : 'How many stages of client engagement are included in the Bridgewhat 20 Levers of Growth framework?',
        'questions' : [
          '4','5','10','20'
        ],
        'result' : '5',
        'answered' : '',
        'multi' : false,
      };
      listQuestion.add(question);
      question = {
        'id' : x + 1,
        'header' : 'The BridgeWhat 20 Levers of Growth',
        'title' : 'What levers belong to Attraction?',
        'questions' : [
          'CRM Marketing','Multichannel Development','Positioning & Targeting','Client-Centricity',
          'Digital Marketing','Innovative Co-Creation','Traffic Generation','Competences Development',
        ],
        'result' : 'CRM Marketing|Positioning & Targeting|Digital Marketing|Traffic Generation',
        'answered' : '',
        'multi' : true,
      };
      listQuestion.add(question);
    }
    loadData = false;
    notifyListeners();
  }

  void disposeProvider() {
    scrollController.dispose();
    controllerPageView.dispose();
  }

  changePosCarruselNext(){
    if(posQuestion >= 0 && posQuestion < listQuestion.length){
      posQuestion++;
      if(posQuestion > 2){
        scrollController.animateTo(
            ((posQuestion - 2) * 100),
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOut);
      }
      notifyListeners();
    }
  }

  changePosCarruselPreviu(){
    if(posQuestion > 0){
      posQuestion--;
      if(posQuestion > 1){
        scrollController.animateTo(
            ((posQuestion - 2) * 100),
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOut);
      }
      notifyListeners();
    }
  }

  changePosPageViewPreviu({required int pos}){
    controllerPageView.animateToPage(
        pos - 1,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut
    );
    notifyListeners();
  }

}
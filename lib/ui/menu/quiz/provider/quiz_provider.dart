import 'package:academybw/utils/get_data.dart';
import 'package:flutter/material.dart';

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

    listQuestion = getListQuestionQuiz();

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
            ((posQuestion - 2) * 50),
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
            ((posQuestion - 2) * 50),
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

  void onTapQuestion({required String answered, required int idQuestion}){
    int? pos;
    for(int x = 0; x < listQuestion.length; x++){
      if(listQuestion[x]['id'] == idQuestion){
        pos = x;
      }
    }
    if(pos != null){

      if(listQuestion[pos]['type'] == TypeQuestion.simple){
        listQuestion[pos]['answered'] = answered;
      }
      if(listQuestion[pos]['type'] == TypeQuestion.multi){
        if(!listQuestion[pos]['answered'].toString().contains(answered)){
          listQuestion[pos]['answered'] = '${listQuestion[pos]['answered']}$answered|';
        }else{
          listQuestion[pos]['answered'] = listQuestion[pos]['answered'].toString().replaceAll('$answered|', '');
        }
      }
      notifyListeners();
    }
  }

  void reorderData({required int oldindex, required int newindex, required int idQuestion}){
    int? pos;
    for(int x = 0; x < listQuestion.length; x++){
      if(listQuestion[x]['id'] == idQuestion){
        pos = x;
      }
    }
    if(pos != null){
      if(newindex>oldindex){
        newindex-=1;
      }
      final items =listQuestion[pos]['answered'].removeAt(oldindex);
      listQuestion[pos]['answered'].insert(newindex, items);
      notifyListeners();
    }
  }

  void addUnionList({required String idQuestion, required List columns}){
    int? pos;
    for(int x = 0; x < listQuestion.length; x++){
      if(listQuestion[x]['id'] == idQuestion){
        pos = x;
      }
    }
    if(pos != null){
      listQuestion[pos]['answered'] = columns;
      notifyListeners();
    }
  }

  void resetUnionList({required int idQuestion}){
    int? pos;
    for(int x = 0; x < listQuestion.length; x++){
      if(listQuestion[x]['id'] == idQuestion){
        pos = x;
      }
    }
    if(pos != null){

      List<Map<String,dynamic>> listQuestionAux = getListQuestionQuiz();

      List a = listQuestionAux[pos]['questions'];
      List newList = [];
      for (var element in a) {
        newList.add(element);
      }
      listQuestion[pos]['answered'] = listQuestionAux[pos]['questions'];
      notifyListeners();
    }
  }

  void change(){
    notifyListeners();
  }
}
import 'package:academybw/utils/get_data.dart';
import 'package:flutter/material.dart';

class QuizProvider extends ChangeNotifier {

  bool loadData = true;
  List<Map<String,dynamic>> listQuestion = [];
  int posQuestion = 0;
  Map<int,Map<String,Color>> listMapColor = {};

  late ScrollController scrollController;
  late PageController controllerPageView;

  Future loadDataQuiz() async{

    loadData = true;
    scrollController = ScrollController();
    controllerPageView = PageController(initialPage: 0);
    posQuestion = 0;
    listMapColor = {};
    notifyListeners();

    listQuestion = getListQuestionQuiz();

    for (var element in listQuestion) {
      if(element['type'] == TypeQuestion.union || element['type'] == TypeQuestion.union2){
        listMapColor[element['id']] = {};
      }
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
      if(listQuestion[pos]['type'] == TypeQuestion.union){
        List data = answered.split('|');
        String keyExists = '';
        listQuestion[pos]['answered'].forEach((key, value) {
          if(value == data[1]){ keyExists = key; }
        });
        if(keyExists.isNotEmpty){ listQuestion[pos]['answered'].remove(keyExists); }
        listQuestion[pos]['answered'][data[0]] = data[1];
      }
      if(listQuestion[pos]['type'] == TypeQuestion.union2){
        List data = answered.split('|');
        String keyExists = '';
        listQuestion[pos]['answered'].forEach((key, value) {
          if(value == data[1]){ keyExists = key; }
        });
        if(keyExists.isNotEmpty){ listQuestion[pos]['answered'].remove(keyExists); }
        listQuestion[pos]['answered'][data[0]] = data[1];
      }
      notifyListeners();
    }
  }

  void onRemoveValueToQuestion({required String removeKey, required int idQuestion}){
    int? pos;
    for(int x = 0; x < listQuestion.length; x++){
      if(listQuestion[x]['id'] == idQuestion){
        pos = x;
      }
    }
    if(pos != null){
      listQuestion[pos]['answered'].remove(removeKey);
      notifyListeners();
    }
  }

  void removeMapColor({required int id, required String stRemove}){
    listMapColor[id]!.remove(stRemove);
    notifyListeners();
    onRemoveValueToQuestion(idQuestion: id,removeKey: stRemove);
  }

  void removeMapColor2({required int id, required String stRemove}){
    String keySelect = stRemove.toString().substring(0,(stRemove.toString().length - 1));
    listMapColor[id]!.remove(keySelect);
    notifyListeners();
    onRemoveValueToQuestion(idQuestion: id,removeKey: stRemove);
  }


  void addMapColor({required int id, required String stAdd, required Color colorAdd}){
    listMapColor[id]![stAdd] = colorAdd;
    notifyListeners();
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




}
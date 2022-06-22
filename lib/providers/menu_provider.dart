import 'package:flutter/material.dart';

enum MenuStatus {post,videos,cartoons,demo,home}

class MenuProvider extends ChangeNotifier {

  MenuStatus status = MenuStatus.home;

  void changeMenu(MenuStatus menuStatusNew){
    status = menuStatusNew;
    notifyListeners();
  }
}

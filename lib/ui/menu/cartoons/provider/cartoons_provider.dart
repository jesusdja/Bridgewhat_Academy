import 'package:academybw/services/http_connection.dart';
import 'package:flutter/material.dart';

class CartoonsProvider extends ChangeNotifier {

  List<Map<String, dynamic>> listCartoons = [];
  Map<String,dynamic> dataAll = {};
  Map<int,bool> cartoonsLikes = {};
  Map<int,bool> cartoonsShared = {};
  Map<int,bool> cartoonsViewMoreDescription = {};
  bool isLoadData = true;

  String page = '';

  CartoonsProvider(){
    getPosts(isInit: true);
  }

  Future<bool> getPosts({required bool isInit}) async {
    // bool result = false;
    //
    // try{
    //   dataAll = await HttpConnection().getCartoonsAll();
    //   if(dataAll.containsKey('data')){
    //     List listPostData = dataAll['data'] ?? [];
    //     listCartoons = [];
    //     for (int x = 0; x < listPostData.length; x++){
    //       listCartoons.add(listPostData[x]);
    //     }
    //     result = true;
    //   }
    // }catch(e){
    //   debugPrint('Error getPosts : ${e.toString()}');
    // }

    bool result = false;
    isLoadData = true;
    notifyListeners();

    try{
      String pageNew = '';
      if(dataAll.isEmpty){
        dataAll = await HttpConnection().getCartoonsAll(pageNew: 'page=1');
        pageNew = 'page=1';
      }else if(!isInit){
        if(dataAll.containsKey('next_page_url') && dataAll['next_page_url'] != null){
          String next = dataAll['next_page_url'].toString().split('?')[1];
          dataAll = await HttpConnection().getCartoonsAll(pageNew: next);
          pageNew = next;
        }
      }

      if(dataAll.containsKey('data') && page != pageNew){
        page == pageNew;
        List listPostData = dataAll['data'] ?? [];
        for (int x = 0; x < listPostData.length; x++){
          listCartoons.add(listPostData[x]);
        }
        result = true;
      }
    }catch(e){
      debugPrint('Error getPosts : ${e.toString()}');
    }

    isLoadData = false;
    notifyListeners();
    return result;
  }

  void viewContainerLikePost({required int idPost}){
    bool oldValue = cartoonsLikes[idPost] ?? false;
    cartoonsLikes.forEach((key, value) {
      if(key != idPost){
        cartoonsLikes[key] = false;
      }else{
        cartoonsLikes[key] = !oldValue;
      }
    });
    notifyListeners();
  }

  void viewContainerSharedPost({required int idPost}){
    bool oldValue = cartoonsShared[idPost] ?? false;
    cartoonsShared.forEach((key, value) {
      if(key != idPost){
        cartoonsShared[key] = false;
      }else{
        cartoonsShared[key] = !oldValue;
      }
    });
    notifyListeners();
  }

  void viewContainerMoreDescriptionPost({required int idPost}){
    cartoonsViewMoreDescription[idPost] = true;
    notifyListeners();
  }
}
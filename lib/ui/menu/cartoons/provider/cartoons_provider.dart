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
    bool result = false;

    try{
      dataAll = await HttpConnection().getCartoonsAll();
      if(dataAll.containsKey('data')){
        List listPostData = dataAll['data'] ?? [];
        listCartoons = [];
        for (int x = 0; x < listPostData.length; x++){
          listCartoons.add(listPostData[x]);
        }
        result = true;
      }
    }catch(e){
      debugPrint('Error getPosts : ${e.toString()}');
    }

    // for (int x = 1; x < 6; x++){
    //   Map<String, dynamic> post = {
    //     'id': x,
    //     'user': 'Acenture',
    //     'title': 'Cartoons $x',
    //     'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut amet, volutpat risus aliquam malesuada quis. Eu, adipiscing egestas volutpat quis platea tempus vitae, fermentum tincidunt Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut amet, volutpat risus aliquam malesuada quis. Eu, adipiscing egestas volutpat quis platea tempus vitae, fermentum tincidunt',
    //     'like': 0,
    //     'shared': 0,
    //     'followers': 0,
    //     'lecture': '0',
    //     'image' : 'cartoon_$x.jpeg',
    //     'date': 'March 30 2022, 13:21',
    //   };
    //   listCartoons.add(post);
    //   cartoonsViewMoreDescription[post['id']] = false;
    // }

    notifyListeners();

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
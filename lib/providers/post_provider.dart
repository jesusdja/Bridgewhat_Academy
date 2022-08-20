import 'package:academybw/services/http_connection.dart';
import 'package:flutter/material.dart';

class PostProvider extends ChangeNotifier {

  List<Map<String, dynamic>> listPost = [];
  Map<String,dynamic> dataAll = {};
  Map<int,bool> postLikes = {};
  Map<int,bool> postShared = {};
  Map<int,bool> postViewMoreDescription = {};
  bool isLoadData = true;
  String page = '';

  Future<bool> getPosts({required bool isInit}) async {
    bool result = false;
    isLoadData = true;
    notifyListeners();

    try{
      String pageNew = '';
      if(dataAll.isEmpty){
        dataAll = await HttpConnection().getPostAll(pageNew: 'page=1');
        pageNew = 'page=1';
      }else if(!isInit){
        if(dataAll.containsKey('links') && dataAll['links']['next'] != null){
          String next = dataAll['links']['next'].toString().split('?')[1];
          dataAll = await HttpConnection().getPostAll(pageNew: next);
          pageNew = next;
        }
      }

      if(dataAll.containsKey('data') && page != pageNew){
        page == pageNew;
        List listPostData = dataAll['data'] ?? [];
        for (int x = 0; x < listPostData.length; x++){
          listPost.add(listPostData[x]);
          postLikes[listPostData[x]['id']] = false;
          postShared[listPostData[x]['id']] = false;
          postViewMoreDescription[listPostData[x]['id']] = false;
        }
        result = true;
      }

      // var rng = math.Random();
      // for (int x = 1; x < 11; x++) {
      //   Map<String, dynamic> post = {
      //     'id': x,
      //     'user': 'Acenture',
      //     'title': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      //     'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut amet, volutpat risus aliquam malesuada quis. Eu, adipiscing egestas volutpat quis platea tempus vitae, fermentum tincidunt Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut amet, volutpat risus aliquam malesuada quis. Eu, adipiscing egestas volutpat quis platea tempus vitae, fermentum tincidunt',
      //     'like': rng.nextInt(100),
      //     'shared': rng.nextInt(100),
      //     'followers': rng.nextInt(10000),
      //     'lecture': '${rng.nextInt(30).round()}',
      //     'date': 'March 30 2022, 13:21',
      //   };
      //   listPost.add(post);
      //   postLikes[post['id']] = false;
      //   postShared[post['id']] = false;
      //   postViewMoreDescription[post['id']] = false;
      // }
    }catch(e){
      debugPrint('Error getPosts : ${e.toString()}');
    }

    isLoadData = false;
    notifyListeners();
    return result;
  }

  void viewContainerLikePost({required int idPost}){
    bool oldValue = postLikes[idPost] ?? false;
    postLikes.forEach((key, value) {
      if(key != idPost){
        postLikes[key] = false;
      }else{
        postLikes[key] = !oldValue;
      }
    });
    notifyListeners();
  }

  void viewContainerSharedPost({required int idPost}){
    bool oldValue = postShared[idPost] ?? false;
    postShared.forEach((key, value) {
      if(key != idPost){
        postShared[key] = false;
      }else{
        postShared[key] = !oldValue;
      }
    });
    notifyListeners();
  }

  void viewContainerMoreDescriptionPost({required int idPost}){
    postViewMoreDescription[idPost] = true;
    notifyListeners();
  }
}
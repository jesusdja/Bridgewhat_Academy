import 'dart:convert';

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
        if(dataAll.containsKey('next_page_url') && dataAll['next_page_url'] != null){
          String next = dataAll['next_page_url'].toString().split('?')[1];
          dataAll = await HttpConnection().getPostAll(pageNew: next);
          pageNew = next;
        }
      }

      if(dataAll.containsKey('data') && page != pageNew){
        page == pageNew;
        List listPostData = dataAll['data'] ?? [];
        for (int x = 0; x < listPostData.length; x++){
          //var dataResponse = jsonDecode(listPostData[x]['response_data']);
          listPost.add(listPostData[x]);
          postLikes[listPostData[x]['id']] = false;
          postShared[listPostData[x]['id']] = false;
          postViewMoreDescription[listPostData[x]['id']] = false;
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
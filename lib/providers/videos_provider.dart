import 'package:flutter/material.dart';

class VideosProvider extends ChangeNotifier {

  List<Map<String, dynamic>> listVideos = [];
  Map<int,bool> postLikes = {};
  Map<int,bool> postShared = {};
  Map<int,bool> openDescription = {};

  VideosProvider(){
    getVideos();
  }

  Future getVideos() async {
    // var rng = math.Random();
    // for (int x = 1; x < 3; x++) {
    //   Map<String, dynamic> post = {
    //     'id': x,
    //     'user': 'Acenture',
    //     'title': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    //     'like': rng.nextInt(100),
    //     'shared': rng.nextInt(100),
    //     'followers': rng.nextInt(10000),
    //     'lecture': '${rng.nextInt(30).round()}',
    //     'date': 'March 30 2022, 13:21',
    //     'url' : 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'
    //   };
    //   listVideos.add(post);
    //   postLikes[post['id']] = false;
    //   postShared[post['id']] = false;
    // }

    for (int x = 1; x < 6; x++){
      Map<String, dynamic> post = {
        'id': x,
        'user': 'Acenture',
        'title': 'Stage$x',
        'description' : 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui oficia deserunt mollit anim id est laborum',
        'url' : 'assets/videos/stage_$x.mp4'
      };
      listVideos.add(post);
      openDescription[x] = false;
    }


    notifyListeners();
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
    openDescription[idPost] = !openDescription[idPost]!;
    notifyListeners();
  }
}
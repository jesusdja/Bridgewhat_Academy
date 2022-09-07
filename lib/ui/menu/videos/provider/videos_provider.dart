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

    listVideos = [];

    for (int x = 1; x < 6; x++){
      Map<String, dynamic> post = {
        'id': x,
        'title': titlesVideos[x],
        'description' : descriptionVideos[x],
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

  Map<int,String> titlesVideos = {
    1 : 'Stage 1 - Attraction – How companies become visible and credible.',
    2 : 'Stage 2 - Acquisition – How companies get clients, once they are visible and credible.',
    3 : 'Stage 3 - *ARPU (Average Revenue Per User) *– How companies maximize clients’ purchases.',
    4 : 'Stage 4 - Retention – How companies maintain their clients in the long term.',
    5 : 'Stage 5 - Referrals – How clients refer your company to other potential clients.',
  };

  Map<int,String> descriptionVideos = {
    1 : 'In this phase, companies concentrate their efforts on being visible and relevant to clients while creating a differentiation vis-à-vis their competitors.',
    2 : 'More than just being relevant, a company needs to go after clients and convert potential customers, available in a market, into their effective customers.',
    3 : 'Once the company starts to have a “critical mass” of clients, the following objective is to maximize the value of their purchases once they decide to buy.',
    4 : 'Good clients should be kept with the company as long as possible, thus saving the company from acquiring costs that can equally impact P&L results.',
    5 : 'Companies should also take advantage of free positive advocacy to increase brand awareness and prestige, with consequent favourable results on revenues and profits.',
  };

  Map<int,Map<int,String>> mapSubVideos = {
    1 : {
      1 : 'https://vimeo.com/747323324',
      2 : 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      3 : 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      4 : 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    },
    2 : {
      1 : '',
      2 : '',
      3 : '',
      4 : '',
    },
    3 : {
      1 : '',
      2 : '',
      3 : '',
      4 : '',
    },
    4 : {
      1 : '',
      2 : '',
      3 : '',
      4 : '',
    },
    5 : {
      1 : '',
      2 : '',
      3 : '',
      4 : '',
    },
  };
}

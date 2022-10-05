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
        'url' : ''
      };
      listVideos.add(post);
      openDescription[x] = false;
    }

    listVideos[0]['url'] = 'https://bridgewhat.ole.agency/videos/02%20Stage%201%20Attraction.mp4';
    listVideos[1]['url'] = 'https://bridgewhat.ole.agency/videos/07%20Stage%202%20Acquisition.mp4';
    listVideos[2]['url'] = 'https://bridgewhat.ole.agency/videos/12%20%20Stage%203%20ARPU.mp4';
    listVideos[3]['url'] = 'https://bridgewhat.ole.agency/videos/17%20Stage%204%20Retention.mp4';
    listVideos[4]['url'] = 'https://bridgewhat.ole.agency/videos/22%20Stage%205%20Referrals.mp4';


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
    1 : 'Attraction – How companies become visible and credible.',
    2 : 'Acquisition – How companies get clients, once they are visible and credible.',
    3 : 'ARPU (Average Revenue Per User) – How companies maximize clients’ purchases.',
    4 : 'Retention – How companies maintain their clients in the long term.',
    5 : 'Referrals – How clients refer your company to other potential clients.',
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
      1 : 'https://drive.google.com/file/d/14x0zZ23EskVDhlXDE43cK5fEGe8jrPdt/view?usp=sharing',
      2 : 'https://drive.google.com/file/d/1h2hA6-pRuw7CipgNgHb64MHSBgUAVdSq/view?usp=sharing',
      3 : 'https://drive.google.com/file/d/1mIO2LER2gBoD47O-aiZYz9DQNesdkHmf/view?usp=sharing',
      4 : 'https://drive.google.com/file/d/1K6Pl0T0wh1-4lGX6w78GmpqMG184tByr/view?usp=sharing',
    },
    2 : {
      5 : 'https://drive.google.com/file/d/1v6Ts1I7ZUi7cMGWSEDu3ElpufnrWskbL/view?usp=sharing',
      6 : 'https://drive.google.com/file/d/1-FzNmy2eE3n3KvjJPOD5MYemibTRTE-a/view?usp=sharing',
      7 : 'https://drive.google.com/file/d/1YFkANwbH2dVZQA6DDRiNwajFXqONTjvH/view?usp=sharing',
      8 : 'https://drive.google.com/file/d/1M6ikxZ9DwNWsXKKAjo8f2DFUly972Av-/view?usp=sharing',
    },
    3 : {
      9 : 'https://drive.google.com/file/d/1f2CjW-gw9rSIXgShLuXqiEVAzFGhVF8M/view?usp=sharing',
      10 : 'https://drive.google.com/file/d/1XE5NQe82Tjpup2H8OFHWal0NoA_S-_hN/view?usp=sharing',
      11 : 'https://drive.google.com/file/d/1OV4ghLqWQZLxwofT0WslpRh3fLaRADwO/view?usp=sharing',
      12 : 'https://drive.google.com/file/d/1Y1ltK8ozB5j1DeTYmKC-Ura6p4oYkOHz/view?usp=sharing',
    },
    4 : {
      13 : 'https://drive.google.com/file/d/1f2CjW-gw9rSIXgShLuXqiEVAzFGhVF8M/view?usp=sharing',
      14 : 'https://drive.google.com/file/d/1XE5NQe82Tjpup2H8OFHWal0NoA_S-_hN/view?usp=sharing',
      15 : 'https://drive.google.com/file/d/1OV4ghLqWQZLxwofT0WslpRh3fLaRADwO/view?usp=sharing',
      16 : 'https://drive.google.com/file/d/1Y1ltK8ozB5j1DeTYmKC-Ura6p4oYkOHz/view?usp=sharing',
    },
    5 : {
      17 : 'https://drive.google.com/file/d/1wbU3rTiP2MZ14Fsp6izmZ0cjZFj9axWk/view?usp=sharing',
      18 : 'https://drive.google.com/file/d/1tOe0gEcgfONpwYICEC08nYxurS395kkV/view?usp=sharing',
      19 : 'https://drive.google.com/file/d/1oeYBQdVzEzVVxl9YLWW7Fjosv_HYWpCy/view?usp=sharing',
      20 : 'https://drive.google.com/file/d/1XlZSP20rjjDPqZisSuj29zlPRqoUya8h/view?usp=sharing',
    },
  };

  Map<int,String> titleButtonVideo = {
    1 : 'PT',
    2 : 'DM',
    3 : 'TG',
    4 : 'CM',
    5 : 'MD',
    6 : 'SE',
    7 : 'ME',
    8 : 'MP',
    9 : 'IC',
    10 : 'PP',
    11 : 'CS',
    12 : 'SC',
    13 : 'CC',
    14 : 'LI',
    15 : 'CR',
    16 : 'BM',
    17 : 'CD',
    18 : 'OM',
    19 : 'RR',
    20 : 'BD',
  };
}

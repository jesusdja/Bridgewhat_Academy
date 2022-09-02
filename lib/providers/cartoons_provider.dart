import 'package:flutter/material.dart';
import 'dart:math' as math;

class CartoonsProvider extends ChangeNotifier {

  List<Map<String, dynamic>> listCartoons = [];
  Map<int,bool> cartoonsLikes = {};
  Map<int,bool> cartoonsShared = {};
  Map<int,bool> cartoonsViewMoreDescription = {};

  CartoonsProvider(){
    getPosts();
  }

  Future getPosts() async {
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
    //   listCartoons.add(post);
    //   cartoonsLikes[post['id']] = false;
    //   cartoonsShared[post['id']] = false;
    //   cartoonsViewMoreDescription[post['id']] = false;
    // }

    for (int x = 1; x < 6; x++){
      Map<String, dynamic> post = {
        'id': x,
        'user': 'Acenture',
        'title': 'Cartoons $x',
        'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut amet, volutpat risus aliquam malesuada quis. Eu, adipiscing egestas volutpat quis platea tempus vitae, fermentum tincidunt Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut amet, volutpat risus aliquam malesuada quis. Eu, adipiscing egestas volutpat quis platea tempus vitae, fermentum tincidunt',
        'like': 0,
        'shared': 0,
        'followers': 0,
        'lecture': '0',
        'image' : 'cartoon_$x.jpeg',
        'date': 'March 30 2022, 13:21',
      };
      listCartoons.add(post);
      cartoonsViewMoreDescription[post['id']] = false;
    }

    notifyListeners();
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
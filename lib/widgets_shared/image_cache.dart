import 'package:academybw/main.dart';
import 'package:academybw/widgets_shared/circular_progress_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageView {

  Widget imageNetWork({required String url}){
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, url) => circularProgressColors(widthContainer1: sizeW,widthContainer2: sizeH * 0.02),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      fit: BoxFit.fill,
    );
  }

}
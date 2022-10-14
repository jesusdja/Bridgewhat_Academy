import 'dart:io';

import 'package:academybw/config/academy_colors.dart';
import 'package:academybw/main.dart';
import 'package:academybw/ui/menu/videos/provider/videos_provider.dart';
import 'package:academybw/widgets_shared/circular_progress_colors.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SubVideosView extends StatefulWidget {
  const SubVideosView({
    Key? key, required this.video
  }) : super(key: key);

  final String video;

  @override
  State<SubVideosView> createState() => _SubVideosViewState();
}

class _SubVideosViewState extends State<SubVideosView> {

  String video = '';
  late VideosProvider videosProvider;
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    video = widget.video;
    String fullPath = tempPath + "/video_log_$video.mp4";
    File fileVideo = File(fullPath);
    existsVideo(fileVideo: fileVideo);
  }

  Future existsVideo({required File fileVideo}) async{

    debugPrint('BUSCANDO VIDEO LOG_$video.mp4');
    if(await fileVideo.exists()){
      _controller = VideoPlayerController.file(fileVideo)
        ..initialize().then((_) {
          setState(() {});
        });
      setState(() {});
    }else{
      if(mounted){
        await Future.delayed(const Duration(seconds: 3));
        existsVideo(fileVideo: fileVideo);
      }
    }
  }


  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          headerContainer(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: sizeW,
                  height: sizeH * 0.25,
                  child: Center(
                    child: _controller != null && _controller!.value.isInitialized
                        ? VideoPlayer(_controller!) :
                    circularProgressColors(widthContainer1: sizeW, widthContainer2: sizeW * 0.06,colorCircular: AcademyColors.primary),
                  ),
                ),
                if(_controller != null && _controller!.value.isInitialized)...[
                  SizedBox(
                    width: sizeW,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(_controller!.value.isPlaying ? Icons.pause_circle_outline : Icons.play_circle_outline,
                          size: sizeH * 0.05,color: Colors.black),
                          onPressed: (){
                            setState(() {
                              _controller!.value.isPlaying
                                  ? _controller!.pause()
                                  : _controller!.play();
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),

        ],
      ),
    );
  }

  Widget headerContainer(){
    return Container(
      width: sizeW,
      margin: EdgeInsets.only(left: sizeW * 0.06, right: sizeW * 0.03,top: 30),
      child: Row(
        children: [
          SizedBox(
            width: sizeW * 0.07,
            child: InkWell(
              child: Icon(Icons.arrow_back_ios,size: sizeH * 0.035,color: AcademyColors.primary),
              onTap: (){
                Navigator.of(context).pop();
              },
            ),
          ),
          iconApp(),
          Expanded(child: Container()),
        ],
      ),
    );
  }

  Widget iconApp(){
    return Container(
      height: sizeH * 0.1,
      width: sizeW * 0.25,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: Image.asset('assets/image/logo_colores_fondo_transparente.png').image,
            fit: BoxFit.fitWidth
        ),
      ),
    );
  }
}

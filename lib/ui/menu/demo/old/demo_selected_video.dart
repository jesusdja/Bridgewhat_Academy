import 'package:academybw/config/academy_colors.dart';
import 'package:academybw/config/academy_style.dart';
import 'package:academybw/main.dart';
import 'package:academybw/widgets_shared/button_general.dart';
import 'package:academybw/widgets_shared/circular_progress_colors.dart';
import 'package:academybw/widgets_shared/widgets_shared.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class DemoSelectedVideo extends StatefulWidget {
  const DemoSelectedVideo({Key? key, required this.type}) : super(key: key);
  final int type;
  @override
  State<DemoSelectedVideo> createState() => _DemoSelectedVideoState();
}

class _DemoSelectedVideoState extends State<DemoSelectedVideo> {

  List<String> title = ['CRYSTAL','SILVER','GOLD','PLATINUM'];
  int cardSelectedType = 0;
  late VideoPlayerController _controller;
  bool isVideoFinish = false;
  int value1 = 10;
  int value2 = 10;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
       'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
        setState(() {});
      });

    _controller.addListener(checkVideo);
  }

  void checkVideo(){
    if(_controller.value.position == _controller.value.duration) {
      isVideoFinish = true;
      setState(() {});
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {

    TextStyle style = AcademyStyles().stylePoppins(size: 14,color: AcademyColors.colors_787878);

    return SafeArea(
      child: GestureDetector(
        onTap: (){},
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              SizedBox(height: sizeH * 0.02,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: sizeW * 0.06),
                child: bannerTitle(type: 5,titleSt: 'DEMO ${title[widget.type]} BridgeWhat'),
              ),
              SizedBox(height: sizeH * 0.02,),
              Expanded(
                child: Stack(
                  children: [
                    InkWell(
                      onTap: (){
                        setState(() {
                          _controller.value.isPlaying
                              ? _controller.pause()
                              : _controller.play();
                        });
                      },
                      child: SizedBox(
                        width: sizeW,
                        child: Center(
                          child: _controller.value.isInitialized
                              ? VideoPlayer(_controller)
                              : circularProgressColors(widthContainer1: sizeW, widthContainer2: sizeW * 0.06,colorCircular: AcademyColors.primary),
                        ),
                      ),
                    ),
                    if(isVideoFinish)...[
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: sizeW,
                          margin: EdgeInsets.symmetric(horizontal: sizeW * 0.1),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: sizeW,
                                margin: EdgeInsets.only(right: sizeW * 0.05),
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  icon: Icon(Icons.cancel_outlined,size: sizeH * 0.03,color: AcademyColors.colors_787878),
                                  onPressed: (){
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: sizeW * 0.05),
                                child: Text('Is the content of this demo clear?',style: style,textAlign: TextAlign.center),
                              ),
                              validateVideo1(typeVideo: 0),
                              SizedBox(height: sizeH * 0.02),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: sizeW * 0.05),
                                child: Text('Has this demo been useful and beneficial to you?',style: style,textAlign: TextAlign.center),
                              ),
                              validateVideo1(typeVideo: 1),
                              SizedBox(height: sizeH * 0.02),
                              Container(
                                width: sizeW,
                                margin: EdgeInsets.symmetric(horizontal: sizeW * 0.1),
                                child: ButtonGeneral(
                                  width: sizeW,
                                  height: sizeH * 0.06,
                                  backgroundColor: AcademyColors.primary,
                                  title: 'Send',
                                  textStyle: AcademyStyles().stylePoppins(size: 16,color: Colors.white,fontWeight: FontWeight.bold),
                                  onPressed: (){
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
                              SizedBox(height: sizeH * 0.02),
                            ],
                          ),
                        ),
                      )
                    ]
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget headerContainer(){
    return Container(
      width: sizeW,
      margin: EdgeInsets.only(left: sizeW * 0.06, right: sizeW * 0.03),
      child: Row(
        children: [
          iconApp(),
          Expanded(child: Container()),
          IconButton(
            icon: Icon(Icons.cancel_outlined,size: sizeH * 0.04,color: AcademyColors.primary),
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
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

  Widget validateVideo1({required int typeVideo}){

    Widget space = SizedBox(width: sizeW * 0.02,);

    return Container(
      width: sizeW,
      margin: EdgeInsets.symmetric(horizontal: sizeW * 0.05, vertical: sizeH * 0.025),
      child: Row(
        children: [
          if(typeVideo == 0)...[
            validateVideoCard(type: 0,st: '1'),space,
            validateVideoCard(type: 1,st: '2'),space,
            validateVideoCard(type: 2,st: '3'),space,
            validateVideoCard(type: 3,st: '4'),space,
            validateVideoCard(type: 4,st: '5'),
          ]else...[
            validateVideoCard(type: 5,st: '1'),space,
            validateVideoCard(type: 6,st: '2'),space,
            validateVideoCard(type: 7,st: '3'),space,
            validateVideoCard(type: 8,st: '4'),space,
            validateVideoCard(type: 9,st: '5'),
          ]
        ],
      ),
    );
  }

  Widget validateVideoCard({required int type, required String st}){

    bool isSelected = (type == value1 || type == value2);

    return Expanded(
      child: InkWell(
        onTap: (){
          if(type < 5){
            value1 = type;
          }else{
            value2 = type;
          }
          setState(() {});
        },
        child: Container(
          width: sizeW,
          height: sizeH * 0.05,
          decoration: BoxDecoration(
            color: isSelected ? AcademyColors.primary : Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(
              width: 1.0,
              color: AcademyColors.primary,
            ),
          ),
          child: Center(
            child: Text(st,style: AcademyStyles().stylePoppins(size: 14,color: isSelected ? Colors.white : AcademyColors.primary,fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }
}

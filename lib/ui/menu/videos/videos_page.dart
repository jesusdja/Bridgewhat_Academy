import 'package:academybw/config/academy_colors.dart';
import 'package:academybw/config/academy_style.dart';
import 'package:academybw/main.dart';
import 'package:academybw/providers/videos_provider.dart';
import 'package:academybw/ui/menu/quiz/quiz_page.dart';
import 'package:academybw/utils/get_data.dart';
import 'package:academybw/widgets_shared/appbar_widgets.dart';
import 'package:academybw/widgets_shared/button_general.dart';
import 'package:academybw/widgets_shared/circular_progress_colors.dart';
import 'package:academybw/widgets_shared/widgets_shared.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class VideosPage extends StatefulWidget {
  const VideosPage({Key? key}) : super(key: key);

  @override
  State<VideosPage> createState() => _VideosPageState();
}

class _VideosPageState extends State<VideosPage> {

  late VideosProvider videosProvider;

  @override
  void initState() {
    super.initState();
    //initialData();
  }

  initialData(){
    Future.delayed(const Duration(milliseconds: 100)).then((value){
      videosProvider.viewContainerLikePost(idPost: 0);
      videosProvider.viewContainerSharedPost(idPost: 0);
    });
  }

  @override
  Widget build(BuildContext context) {

    videosProvider = Provider.of<VideosProvider>(context);

    return GestureDetector(
      onTap: (){
        // videosProvider.viewContainerLikePost(idPost: 0);
        // videosProvider.viewContainerSharedPost(idPost: 0);
      },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              headerShared(context: context),
              Expanded(
                child: Container(
                  width: sizeW,
                  //margin: EdgeInsets.symmetric(horizontal: sizeW * 0.06),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: sizeW * 0.06),
                        child: bannerTitle(type: 1),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              SizedBox(height: sizeH * 0.04),
                              cardContainer(),
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              Container(
                width: sizeW,
                height: sizeH * 0.08,
                color: AcademyColors.primary,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: sizeW * 0.05),
                        child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Est',style: AcademyStyles().stylePoppins(
                            size: 12,color: Colors.white
                        )),
                      ),
                    ),
                    ButtonGeneral(
                      margin: EdgeInsets.symmetric(horizontal: sizeW * 0.05),
                      width: sizeW * 0.2,
                      height: sizeH * 0.04,
                      radius: 5,
                      title: 'Quiz',
                      textStyle: AcademyStyles().stylePoppins(size: 12,color: AcademyColors.primary,fontWeight: FontWeight.bold),
                      onPressed: (){
                        Navigator.push(context,MaterialPageRoute<void>( builder: (context) => const QuizPage()),);
                      },
                    ),
                  ],
                ),
              )
            ],
          )
        ),
    );
  }

  Widget cardContainer(){

    List<Widget> listW = [];
    for (var element in videosProvider.listVideos) {
      listW.add(CardPostContainer(videos: element));
    }

    return SizedBox(
      width: sizeW,
      child: Column(
        children: listW,
      ),
    );
  }
}

class CardPostContainer extends StatefulWidget {
  const CardPostContainer({Key? key, required this.videos}) : super(key: key);

  final Map<String,dynamic> videos;

  @override
  State<CardPostContainer> createState() => _CardPostContainerState();
}

class _CardPostContainerState extends State<CardPostContainer> {

  Map<String,dynamic> video = {};
  late VideosProvider videosProvider;
  List<String> listTitleLikes = ['','Like','Love','Wow','Clap','Curious','Insightful'];
  List<String> listTitleShared = ['','Linkedin','Instagram','Twitter','Facebook'];
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    video = widget.videos;
    _controller = VideoPlayerController.asset(video['url'])
    ..initialize().then((_) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {

    videosProvider = Provider.of<VideosProvider>(context);

    return SizedBox(
      width: sizeW,
      child: Column(
        children: [
          cardVideo(),
          cardBottom(),
        ],
      ),
    );
  }

  Widget cardVideo(){
    return Container(
      width: sizeW,
      height: sizeH * 0.25,
      margin: EdgeInsets.only(bottom: sizeH * 0.02),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
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
              height: sizeH * 0.25,
              child: Center(
                child: _controller.value.isInitialized
                    ? VideoPlayer(_controller) :
                circularProgressColors(widthContainer1: sizeW, widthContainer2: sizeW * 0.06,colorCircular: AcademyColors.primary),
              ),
            ),
          ),
          if(_controller.value.isInitialized && !_controller.value.isPlaying)...[
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: (){
                  videosProvider.viewContainerLikePost(idPost: video['id']);
                },
                child: IconButton(
                  icon: Icon(Icons.play_circle_outline,color: Colors.grey[400],size: sizeH * 0.08),
                  onPressed: (){
                    _controller.play();
                    setState(() {});
                  },
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget cardBottom(){

    String title = video['title'];
    String description = video['description'];

    TextStyle style = AcademyStyles().styleLato(size: sizeH * 0.022,color: Colors.black);
    TextStyle style2 = AcademyStyles().styleLato(size: sizeH * 0.02,color: AcademyColors.colors_787878);

    Widget textMore = Container();

    if(description.length > 150){
      bool isMoreActive = videosProvider.openDescription[video['id']!]!;
      if(isMoreActive){
        textMore = Text(description,style: AcademyStyles().styleLato(size: 12,color: AcademyColors.colors_787878),);
      }else{
        textMore =  InkWell(
          onTap: (){
            videosProvider.viewContainerMoreDescriptionPost(idPost: video['id']);
          },
          child: SizedBox(
            child: RichText(
              text: TextSpan(
                text: description.substring(0,150), // _snapshot.data['username']
                style: style2,
                children: <TextSpan>[
                  TextSpan(
                    text: '. . .  More',
                    style: AcademyStyles().styleLato(size: 12,color: AcademyColors.primary),
                  )
                ],
              ),
            ),
          ),
        );
      }
    }else{
      textMore = Text(description,style: style2,);
    }

    return Container(
      width: sizeW,
      margin: EdgeInsets.only(bottom: sizeH * 0.02,left: sizeW * 0.06),
      child: Column(
        children: [
          SizedBox(
            width: sizeW,
            child: Text(title,style: style),
          ),
          SizedBox(height: sizeW * 0.02,),
          SizedBox(
            width: sizeW,
            child: textMore,
          ),
        ],
      ),
    );
  }
}

class CardPostContainer2 extends StatefulWidget {
  const CardPostContainer2({Key? key, required this.videos}) : super(key: key);

  final Map<String,dynamic> videos;

  @override
  State<CardPostContainer2> createState() => _CardPostContainerState2();
}

class _CardPostContainerState2 extends State<CardPostContainer2> {

  Map<String,dynamic> video = {};
  late VideosProvider videosProvider;
  List<String> listTitleLikes = ['','Like','Love','Wow','Clap','Curious','Insightful'];
  List<String> listTitleShared = ['','Linkedin','Instagram','Twitter','Facebook'];
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    video = widget.videos;
    _controller = VideoPlayerController.network(
        video['url'])
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {

    videosProvider = Provider.of<VideosProvider>(context);

    bool postSelectLike = videosProvider.postLikes[video['id']] ?? false;
    bool postSelectShared = videosProvider.postShared[video['id']] ?? false;

    return Stack(
      children: [
        SizedBox(
          width: sizeW,
          child: Column(
            children: [
              cardVideoTop(),
              cardVideo(),
              cardBottom(),
            ],
          ),
        ),
        if(postSelectLike)...[
          Container(
            margin: EdgeInsets.only(top: sizeH * 0.3,right: sizeW * 0.05,left: sizeW * 0.25),
            child: selectLike(),
          )
        ],

        if(postSelectShared)...[
          Container(
            margin: EdgeInsets.only(top: sizeH * 0.3),
            child: Row(
              children: [
                Expanded(
                  child: Container(),
                ),
                selectShared()
              ],
            ),
          )
        ],

      ],
    );
  }

  Widget cardVideoTop(){

    String nameUser = video['user'];
    String cantFollowers = '${numberFormat(double.parse('${video['followers']}')).split(',')[0]} followers';
    String lecture = '${video['lecture']} min lecture';
    String dateSt = video['date'];

    return Container(
      width: sizeW,
      margin: EdgeInsets.only(bottom: sizeH * 0.02),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: sizeH * 0.07,
            width: sizeH * 0.07,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: Image.asset('assets/image/img_acenture.png').image,
                    fit: BoxFit.fitWidth
                )
            ),
          ),
          SizedBox(width: sizeW * 0.02,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(nameUser,style: AcademyStyles().styleLato(
                  size: sizeH * 0.02,
                  color: AcademyColors.colors_787878
              )),
              Text(cantFollowers,style: AcademyStyles().styleLato(
                  size: sizeH * 0.015,
                  color: AcademyColors.colors_737373
              )),
            ],
          ),
          Expanded(child: Container()),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(lecture,style: AcademyStyles().styleLato(
                  size: sizeH * 0.015,
                  color: AcademyColors.colors_737373
              )),
              Text(dateSt,style: AcademyStyles().styleLato(
                  size: sizeH * 0.015,
                  color: AcademyColors.colors_737373
              )),
            ],
          )
        ],
      ),
    );
  }

  Widget cardVideo(){
    return Container(
      width: sizeW,
      height: sizeH * 0.25,
      margin: EdgeInsets.only(bottom: sizeH * 0.02),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
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
              height: sizeH * 0.25,
              child: Center(
                child: _controller.value.isInitialized
                    ? ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: VideoPlayer(_controller),
                ) : circularProgressColors(widthContainer1: sizeW, widthContainer2: sizeW * 0.06,colorCircular: AcademyColors.primary),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: InkWell(
              onTap: (){
                videosProvider.viewContainerLikePost(idPost: video['id']);
              },
              child: Container(
                height: sizeH * 0.03,
                width: sizeH * 0.03,
                margin: EdgeInsets.only(bottom: sizeH * 0.015,right: sizeW * 0.1),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: Image.asset('assets/image/button_like.png').image,
                        fit: BoxFit.fitWidth
                    )
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: InkWell(
              onTap: (){
                videosProvider.viewContainerSharedPost(idPost: video['id']);
              },
              child: Container(
                margin: EdgeInsets.only(bottom: sizeH * 0.015,right: sizeW * 0.025),
                height: sizeH * 0.03,
                width: sizeH * 0.03,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: Image.asset('assets/image/button_shared.png').image,
                        fit: BoxFit.fitWidth
                    )
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget cardBottom(){

    String title = video['title'];
    String likeSt = '${numberFormat(double.parse('${video['like']}')).split(',')[0]} likes';
    String sharedSt = '${numberFormat(double.parse('${video['shared']}')).split(',')[0]} times shared';



    TextStyle style = AcademyStyles().styleLato(size: 12,color: Colors.black);
    TextStyle style2 = AcademyStyles().styleLato(size: 10,color: Colors.white);

    return Container(
      width: sizeW,
      margin: EdgeInsets.only(bottom: sizeH * 0.02),
      child: Column(
        children: [
          SizedBox(
            width: sizeW,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(title,style: style),
                ),
                SizedBox(width: sizeW * 0.1,),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: sizeW * 0.03,vertical: sizeH * 0.005),
                    decoration: const BoxDecoration(
                      color: AcademyColors.colors_787878,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: FittedBox(
                      fit:BoxFit.contain,
                      child: Row(
                        children: [
                          Text(likeSt,style: style2),
                          Container(width: 10),
                          Text(sharedSt,style: style2),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: sizeW * 0.1,),
        ],
      ),
    );
  }

  Widget selectLike(){

    List<Widget> listW = [];
    for(int x = 1; x < 7; x++){
      listW.add(
        Container(
          margin: EdgeInsets.symmetric(horizontal: sizeW * 0.02),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: sizeH * 0.03,
                width: sizeH * 0.03,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: Image.asset('assets/image/like$x.png').image,
                        fit: BoxFit.fitHeight
                    )
                ),
              ),
              Text(listTitleLikes[x],style: AcademyStyles().styleLato(size: 12,color: AcademyColors.primary),)
            ],
          ),
        ),
      );
    }


    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        border: Border.all(
          width: 1.0,
          color: AcademyColors.primary,
        ),
      ),
      child: FittedBox(
        fit:BoxFit.contain,
        child: Row(
          children: listW,
        ),
      ),
    );
  }

  Widget selectShared(){

    List<Widget> listW = [];
    for(int x = 1; x < 5; x++){
      listW.add(
        Container(
          width: sizeW * 0.2,
          margin: EdgeInsets.symmetric(horizontal: sizeW * 0.02),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: sizeH * 0.03,
                width: sizeH * 0.03,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: Image.asset('assets/image/shared$x.png').image,
                        fit: BoxFit.fitWidth
                    )
                ),
              ),
              SizedBox(width: sizeW * 0.02,),
              Expanded(
                child: Text(listTitleShared[x],style: AcademyStyles().styleLato(size: 10,color: AcademyColors.primary)),
              ),
            ],
          ),
        ),
      );
      if(x < 4) {
        listW.add(
          Container(
            margin: EdgeInsets.symmetric(vertical: sizeH * 0.01),
            height: 0.5,
            width: sizeW * 0.2,
            color: AcademyColors.colorsC4C4C4,
          ),
        );
      }
    }


    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(0),
          topLeft: Radius.circular(10),
          bottomRight: Radius.circular(0),
          bottomLeft: Radius.circular(10),
        ),
        border: Border.all(
          width: 0.0,
          color: AcademyColors.primary,
        ),
      ),
      child: FittedBox(
        fit:BoxFit.contain,
        child: Column(
          children: listW,
        ),
      ),
    );
  }
}

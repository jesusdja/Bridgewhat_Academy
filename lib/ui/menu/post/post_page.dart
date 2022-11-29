
import 'package:academybw/config/academy_colors.dart';
import 'package:academybw/config/academy_style.dart';
import 'package:academybw/main.dart';
import 'package:academybw/ui/menu/post/provider/post_provider.dart';
import 'package:academybw/widgets_shared/widgets_shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {

  late PostProvider postProvider;
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    initialData();
    scrollController.addListener((){
      getDataPost();
    });
  }

  Future getDataPost() async {
    if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
      if(!postProvider.isLoadData){
        bool result = await postProvider.getPosts(isInit: false);
        if(result){
          if(scrollController.position.pixels >= (scrollController.position.maxScrollExtent - 300)){
            scrollController.animateTo(
                scrollController.position.pixels + 120,
              duration: const Duration(milliseconds: 300),
              curve: Curves.fastOutSlowIn
            );
          }
        }
      }
    }
  }

  initialData(){
    Future.delayed(const Duration(milliseconds: 100)).then((value){
      postProvider.getPosts(isInit: true);
      postProvider.viewContainerLikePost(idPost: 0);
      postProvider.viewContainerSharedPost(idPost: 0);
    });
  }

  @override
  Widget build(BuildContext context) {

    postProvider = Provider.of<PostProvider>(context);

    return GestureDetector(
      onTap: (){
        postProvider.viewContainerLikePost(idPost: 0);
        postProvider.viewContainerSharedPost(idPost: 0);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: Container(
                width: sizeW,
                margin: EdgeInsets.symmetric(horizontal: sizeW * 0.06),
                child: Column(
                  children: [
                    bannerTitle(type: 0),
                    SizedBox(height: sizeH * 0.02),
                    Expanded(
                      child: cardContainer(),
                    ),
                  ],
                ),
              ),
            )
          ],
        )
      ),
    );
  }

  Widget cardContainer(){
    List<Widget> listW = [];
    for (var element in postProvider.listPost) {
      listW.add(CardPostContainer(post: element));
    }

    return Stack(
      children: [
        SizedBox(
          width: sizeW,
          child: ListView.builder(
            controller: scrollController,
            physics: const BouncingScrollPhysics(),
            itemCount: listW.length,
            itemBuilder: (context,index){
              return listW[index];
            },
          ),
        ),
        if(postProvider.isLoadData)...[
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(bottom: 20),
              height: 50,width: 50,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                shape: BoxShape.circle
              ),
              child: const CircularProgressIndicator(color: AcademyColors.primary),
            ),
          ),
        ]
      ],
    );
  }
}

class CardPostContainer extends StatefulWidget {
  const CardPostContainer({Key? key, required this.post}) : super(key: key);

  final Map<String,dynamic> post;

  @override
  State<CardPostContainer> createState() => _CardPostContainerState();
}

class _CardPostContainerState extends State<CardPostContainer> {

  Map<String,dynamic> post = {};
  late PostProvider postProvider;
  List<String> listTitleLikes = ['','Like','Love','Wow','Clap','Curious','Insightful'];
  List<String> listTitleShared = ['','Linkedin','Instagram','Twitter','Facebook'];

  @override
  void initState() {
    super.initState();
    post = widget.post;
  }

  @override
  Widget build(BuildContext context) {

    postProvider = Provider.of<PostProvider>(context);

    // bool postSelectLike = postProvider.postLikes[post['id']] ?? false;
    // bool postSelectShared = postProvider.postShared[post['id']] ?? false;

    if(post['header_image'] == null) return Container();

    return Stack(
      children: [
        SizedBox(
          width: sizeW,
          child: Column(
            children: [
              cardPostTop(),
              cardPostImg(),
              cardBottom(),
            ],
          ),
        ),
        // if(postSelectLike)...[
        //   Container(
        //     margin: EdgeInsets.only(top: sizeH * 0.3,right: sizeW * 0.05,left: sizeW * 0.25),
        //     child: selectLike(),
        //   )
        // ],
        // if(postSelectShared)...[
        //   Container(
        //     margin: EdgeInsets.only(top: sizeH * 0.3),
        //     child: Row(
        //       children: [
        //         Expanded(
        //           child: Container(),
        //         ),
        //         selectShared()
        //       ],
        //     ),
        //   )
        // ],
      ],
    );
  }

  Widget cardPostTop(){

    String nameUser = post['company_name'] ?? '';
    DateTime dateDT = DateTime.parse(post['created_at']);
    String dateSt = '${dateDT.day.toString().padLeft(2,'0')}/${dateDT.month.toString().padLeft(2,'0')}/${dateDT.year}';

    Widget urlLogo = Container(
      height: sizeH * 0.07,
      width: sizeH * 0.07,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: Image.asset('assets/image/img_acenture.png').image,
              fit: BoxFit.fitWidth
          )
      ),
    );
    if(post.containsKey('company_logo') && post['company_logo'] != null && post['company_logo'].toString().isNotEmpty) {
      urlLogo = Container(
        height: sizeH * 0.07,
        width: sizeH * 0.07,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: Image.network(post['company_logo']).image,
                fit: BoxFit.fitWidth
            )
        ),
      );
    }

    return Container(
      width: sizeW,
      margin: EdgeInsets.only(bottom: sizeH * 0.00),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          urlLogo,
          SizedBox(width: sizeW * 0.02,),
          Expanded(child: Text(nameUser,style: AcademyStyles().styleLato(
              size: sizeH * 0.02,
              color: AcademyColors.colors_787878
          )),),
          SizedBox(width: sizeW * 0.02,),
          Text(dateSt,style: AcademyStyles().styleLato(
              size: sizeH * 0.015,
              color: AcademyColors.colors_737373
          )),
        ],
      ),
    );
  }

  Widget cardPostImg(){

    bool like = false;
    if(postProvider.postLikes.containsKey(post['id'])){
      like = postProvider.postLikes[post['id']]!;
    }

    return Container(
      width: sizeW,
      height: sizeH * 0.22,
      margin: EdgeInsets.only(bottom: sizeH * 0.02),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        image: DecorationImage(
            image: Image.network(post['header_image']).image,
            fit: BoxFit.cover
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: InkWell(
              onTap: (){
                postProvider.viewContainerLikePost(idPost: post['id']);
              },
              child: Container(
                height: sizeH * 0.032,
                width: sizeH * 0.032,
                margin: EdgeInsets.only(bottom: sizeH * 0.015,right: sizeW * 0.05),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: like ? Icon(CupertinoIcons.heart_solid,color: Colors.redAccent,size: sizeH * 0.022) :
                  Icon(CupertinoIcons.heart,color: Colors.black,size: sizeH * 0.022),
                ),
              ),
            ),
          ),
          // Align(
          //   alignment: Alignment.bottomRight,
          //   child: InkWell(
          //     onTap: (){
          //       postProvider.viewContainerSharedPost(idPost: post['id']);
          //     },
          //     child: Container(
          //       margin: EdgeInsets.only(bottom: sizeH * 0.015,right: sizeW * 0.025),
          //       height: sizeH * 0.03,
          //       width: sizeH * 0.03,
          //       decoration: BoxDecoration(
          //           image: DecorationImage(
          //               image: Image.asset('assets/image/button_shared.png').image,
          //               fit: BoxFit.fitWidth
          //           )
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }

  Widget cardBottom(){

    String title = post['title'] ?? '';
    String likeSt = '0  likes';// '${numberFormat(double.parse('${post['like']}')).split(',')[0]} likes';
    String sharedSt ='0  times shared'; // '${numberFormat(double.parse('${post['shared']}')).split(',')[0]} times shared';

    TextStyle style = AcademyStyles().styleLato(size: 12,color: Colors.black);
    TextStyle style2 = AcademyStyles().styleLato(size: 10,color: Colors.white);

    int likes = 0;
    if(post.containsKey('numberLikes') && post['numberLikes'] != null){
      likes = post['numberLikes'] ?? 0;
      if(post['like'] == 0 && postProvider.postLikes.containsKey(post['id']) && postProvider.postLikes[post['id']]!){
        likes++;
      }
      likeSt = '$likes  likes';
    }

    return Container(
      width: sizeW,
      margin: EdgeInsets.only(bottom: sizeH * 0.02),
      child: Column(
        children: [
          SizedBox(width: sizeW * 0.1,),
          SizedBox(
            width: sizeW,
            child: Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(left: sizeW * 0.5),
              padding: EdgeInsets.symmetric(horizontal: sizeW * 0.03,vertical: sizeH * 0.005),
              decoration: const BoxDecoration(
                color: AcademyColors.colors_787878,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(likeSt,style: style2),
                  Container(width: 10),
                  Text(sharedSt,style: style2),
                ],
              ),
            ),
          ),
          SizedBox(height: sizeH * 0.02,),
          Text(title,style: style),
          textDescription(),
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
                height: sizeH * 0.032,
                width: sizeH * 0.032,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: Image.asset('assets/image/like$x.png').image,
                        fit: BoxFit.fitHeight
                    )
                ),
              ),
              // Text(listTitleLikes[x],style: AcademyStyles().styleLato(size: 12,color: AcademyColors.primary),)
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
                height: sizeH * 0.032,
                width: sizeH * 0.032,
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

  Widget textDescription(){

    String description = post['description'] ?? '';
    Widget textMore = Container();
    // TextStyle styleDescription = AcademyStyles().styleLato(size: 12,color: AcademyColors.colors_787878);

    bool isMoreActive = postProvider.postViewMoreDescription[post['id']!]!;

    if(description.length > 150 && !isMoreActive){
      description = description.substring(0,150);
    }

    textMore = SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Text(description,style: styleDescription,),
          Html(
            data: description,
            onLinkTap: (_url,context,mapSt,element) async {
              try{
                if (!await launchUrl(Uri.parse(_url!))) {
                  throw 'Could not launch $_url';
                }
              }catch(_){}

            },
          ),
          if(!isMoreActive)...[
            InkWell(
              child: Text('. . . More',style: AcademyStyles().styleLato(size: 12,color: AcademyColors.primary),),
              onTap: ()=>postProvider.viewContainerMoreDescriptionPost(idPost: post['id']),
            ),
          ]
        ],
      ),
    );

    return Container(
      width: sizeW,
      margin: EdgeInsets.only(top: sizeH * 0.01,bottom: sizeH * 0.035),
      child: textMore,
    );
  }
}


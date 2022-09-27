import 'package:academybw/config/academy_colors.dart';
import 'package:academybw/main.dart';
import 'package:academybw/ui/menu/videos/provider/videos_provider.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

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

  @override
  void initState() {
    super.initState();
    video = widget.video;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          headerContainer(),
          Expanded(
            child: WebView(
              initialUrl: widget.video,
              javascriptMode: JavascriptMode.unrestricted,
              backgroundColor: Colors.transparent,
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

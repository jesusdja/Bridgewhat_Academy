import 'package:academybw/config/academy_colors.dart';
import 'package:academybw/main.dart';
import 'package:academybw/ui/menu/videos/provider/videos_provider.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';
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
  // late VideoPlayerController _controller;

  // late FlickManager flickManager;
  // late InAppWebViewController webView;

  @override
  void initState() {
    super.initState();
    video = widget.video;
    // _controller = VideoPlayerController.network(video)
    // ..initialize().then((_) {
    //   setState(() {});
    // });
    //
    // flickManager = FlickManager(
    //   videoPlayerController:
    //   VideoPlayerController.network(video),
    // );

    Future.delayed(const Duration(milliseconds: 500)).then((value) =>
        videosProvider.getVideos());
  }

  @override
  void dispose() {
    super.dispose();
    // _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {

    videosProvider = Provider.of<VideosProvider>(context);

    return Scaffold(
      body: Column(children: <Widget>[
        headerContainer(),
        Expanded(
          child: WebView(
            initialUrl: video,
            javascriptMode: JavascriptMode.unrestricted,
            backgroundColor: Colors.transparent,
            // onProgress: (progress) async {
            //   progressInt = double.parse(progress.toString())  / 100;
            //   print('progressInt : $progressInt');
            //   if(progress == 1.0){
            //     loadData = false;
            //   }
            //   setState(() {});
            // },
          ),
          // child: WebView(
          //   initialUrl: video,
          // ),
          // child: InAppWebView(
          //   initialUrlRequest: URLRequest(url: Uri.parse(video)),
          //   initialOptions: InAppWebViewGroupOptions(
          //     crossPlatform: InAppWebViewOptions(
          //       javaScriptEnabled: true,
          //     ),
          //   ),
          //   onWebViewCreated: (InAppWebViewController controller) {
          //     webView = controller;
          //   },
          //   onLoadStart: (_controller, url){},
          //   onLoadStop: (_controller, url){},
          // ),
        )
      ],
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //
  //   videosProvider = Provider.of<VideosProvider>(context);
  //
  //   return Scaffold(
  //     body: SizedBox(
  //       width: sizeW,
  //       child: Column(
  //         children: [
  //           headerContainer(),
  //           Expanded(
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 cardVideo(),
  //               ],
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // Widget cardVideo(){
  //   return Container(
  //     width: sizeW,
  //     height: sizeH * 0.3,
  //     margin: EdgeInsets.only(bottom: sizeH * 0.02),
  //     decoration: BoxDecoration(
  //       color: Colors.grey[100],
  //       borderRadius: const BorderRadius.all(Radius.circular(10)),
  //     ),
  //     child: Stack(
  //       children: [
  //         InkWell(
  //           child: SizedBox(
  //             width: sizeW,
  //             height: sizeH * 0.3,
  //             child: Center(
  //               child: _controller.value.isInitialized
  //                   ? FlickVideoPlayer(
  //                   flickManager: flickManager
  //               ) :
  //               circularProgressColors(widthContainer1: sizeW, widthContainer2: sizeW * 0.06,colorCircular: AcademyColors.primary),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

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


// import 'package:academybw/config/academy_colors.dart';
// import 'package:academybw/main.dart';
// import 'package:academybw/ui/menu/videos/provider/videos_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:provider/provider.dart';
//
// class SubVideosView extends StatefulWidget {
//   const SubVideosView({
//     Key? key, required this.video
//   }) : super(key: key);
//
//   final String video;
//
//   @override
//   State<SubVideosView> createState() => _SubVideosViewState();
// }
//
// class _SubVideosViewState extends State<SubVideosView> {
//
//   String video = '';
//   late VideosProvider videosProvider;
//   // late VideoPlayerController _controller;
//
//   // late FlickManager flickManager;
//   late InAppWebViewController webView;
//
//   @override
//   void initState() {
//     super.initState();
//     video = widget.video;
//     // _controller = VideoPlayerController.network(video)
//     // ..initialize().then((_) {
//     //   setState(() {});
//     // });
//     //
//     // flickManager = FlickManager(
//     //   videoPlayerController:
//     //   VideoPlayerController.network(video),
//     // );
//
//     Future.delayed(const Duration(milliseconds: 500)).then((value) =>
//     videosProvider.getVideos());
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     // _controller.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     videosProvider = Provider.of<VideosProvider>(context);
//
//     return Scaffold(
//       body: Column(children: <Widget>[
//         headerContainer(),
//         Expanded(
//             child: InAppWebView(
//               initialUrlRequest: URLRequest(url: Uri.parse(video)),
//               initialOptions: InAppWebViewGroupOptions(
//                 crossPlatform: InAppWebViewOptions(
//                   javaScriptEnabled: true,
//                 ),
//               ),
//               onWebViewCreated: (InAppWebViewController controller) {
//                 webView = controller;
//               },
//               onLoadStart: (_controller, url){},
//               onLoadStop: (_controller, url){},
//             ),
//         )
//       ],
//       ),
//     );
//   }
//
//   // @override
//   // Widget build(BuildContext context) {
//   //
//   //   videosProvider = Provider.of<VideosProvider>(context);
//   //
//   //   return Scaffold(
//   //     body: SizedBox(
//   //       width: sizeW,
//   //       child: Column(
//   //         children: [
//   //           headerContainer(),
//   //           Expanded(
//   //             child: Column(
//   //               crossAxisAlignment: CrossAxisAlignment.center,
//   //               mainAxisAlignment: MainAxisAlignment.center,
//   //               children: [
//   //                 cardVideo(),
//   //               ],
//   //             ),
//   //           )
//   //         ],
//   //       ),
//   //     ),
//   //   );
//   // }
//
//   // Widget cardVideo(){
//   //   return Container(
//   //     width: sizeW,
//   //     height: sizeH * 0.3,
//   //     margin: EdgeInsets.only(bottom: sizeH * 0.02),
//   //     decoration: BoxDecoration(
//   //       color: Colors.grey[100],
//   //       borderRadius: const BorderRadius.all(Radius.circular(10)),
//   //     ),
//   //     child: Stack(
//   //       children: [
//   //         InkWell(
//   //           child: SizedBox(
//   //             width: sizeW,
//   //             height: sizeH * 0.3,
//   //             child: Center(
//   //               child: _controller.value.isInitialized
//   //                   ? FlickVideoPlayer(
//   //                   flickManager: flickManager
//   //               ) :
//   //               circularProgressColors(widthContainer1: sizeW, widthContainer2: sizeW * 0.06,colorCircular: AcademyColors.primary),
//   //             ),
//   //           ),
//   //         ),
//   //       ],
//   //     ),
//   //   );
//   // }
//
//   Widget headerContainer(){
//     return Container(
//       width: sizeW,
//       margin: EdgeInsets.only(left: sizeW * 0.06, right: sizeW * 0.03,top: 30),
//       child: Row(
//         children: [
//           SizedBox(
//             width: sizeW * 0.07,
//             child: InkWell(
//               child: Icon(Icons.arrow_back_ios,size: sizeH * 0.035,color: AcademyColors.primary),
//               onTap: (){
//                 Navigator.of(context).pop();
//               },
//             ),
//           ),
//           iconApp(),
//           Expanded(child: Container()),
//         ],
//       ),
//     );
//   }
//
//   Widget iconApp(){
//     return Container(
//       height: sizeH * 0.1,
//       width: sizeW * 0.25,
//       decoration: BoxDecoration(
//         image: DecorationImage(
//             image: Image.asset('assets/image/logo_colores_fondo_transparente.png').image,
//             fit: BoxFit.fitWidth
//         ),
//       ),
//     );
//   }
// }

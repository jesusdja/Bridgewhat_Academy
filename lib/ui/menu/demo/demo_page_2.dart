import 'package:academybw/config/academy_colors.dart';
import 'package:academybw/main.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/platform_interface.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DemoPage2 extends StatefulWidget {
  const DemoPage2({Key? key}) : super(key: key);

  @override
  State<DemoPage2> createState() => _DemoPage2State();
}

class _DemoPage2State extends State<DemoPage2> {

  bool loadData = true;
  double progressInt = 0.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Column(
          children: <Widget>[
            headerContainer(),
            Expanded(
              child: Stack(
                children: [
                  if(loadData)...[
                    Center(
                      child: Container(
                          alignment: Alignment.topCenter,
                          margin: EdgeInsets.all(20),
                          child: LinearProgressIndicator(
                            value: progressInt,
                            backgroundColor: Colors.grey.withOpacity(0.5),
                            color: AcademyColors.primary,
                            minHeight: 10,
                          )
                      ),
                    )
                  ],
                  WebView(
                    initialUrl: 'https://bridgewhat.ole.agency/demo/',
                    javascriptMode: JavascriptMode.unrestricted,
                    backgroundColor: Colors.transparent,
                    onProgress: (progress) async {
                      progressInt = double.parse(progress.toString())  / 100;
                      print('progressInt : $progressInt');
                      if(progress == 1.0){
                        loadData = false;
                      }
                      setState(() {});
                    },
                  ),


                  // InAppWebView(
                  //   initialUrlRequest: URLRequest(url: Uri.parse("https://bridgewhat.ole.agency/demo/")),
                  //   initialOptions: InAppWebViewGroupOptions(
                  //     crossPlatform: InAppWebViewOptions(
                  //       javaScriptEnabled: true,
                  //     ),
                  //   ),
                  //   onWebViewCreated: (InAppWebViewController controller) {
                  //     webView = controller;
                  //   },
                  //   onProgressChanged: (_controller, progress) async {
                  //     progressInt = double.parse(progress.toString())  / 100;
                  //     print('progressInt : $progressInt');
                  //     if(progress == 1.0){
                  //       loadData = false;
                  //     }
                  //     setState(() {});
                  //   },
                  //   onLoadStart: (_controller, url){},
                  //   onLoadStop: (_controller, url){},
                  // ),
                ],
              ),
            ),
          ],
        ),
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


// import 'package:academybw/config/academy_colors.dart';
// import 'package:academybw/main.dart';
// import 'package:academybw/widgets_shared/circular_progress_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
//
// class DemoPage2 extends StatefulWidget {
//   const DemoPage2({Key? key}) : super(key: key);
//
//   @override
//   State<DemoPage2> createState() => _DemoPage2State();
// }
//
// class _DemoPage2State extends State<DemoPage2> {
//
//   late InAppWebViewController webView;
//   bool loadData = true;
//   double progressInt = 0.0;
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SizedBox(
//         child: Column(
//           children: <Widget>[
//             headerContainer(),
//             Expanded(
//               child: Stack(
//                 children: [
//                   if(loadData)...[
//                     Center(
//                       child: Container(
//                       alignment: Alignment.topCenter,
//                           margin: EdgeInsets.all(20),
//                           child: LinearProgressIndicator(
//                             value: progressInt,
//                             backgroundColor: Colors.grey.withOpacity(0.5),
//                             color: AcademyColors.primary,
//                             minHeight: 10,
//                           )
//                       ),
//                     )
//                   ],
//                   InAppWebView(
//                     initialUrlRequest: URLRequest(url: Uri.parse("https://bridgewhat.ole.agency/demo/")),
//                     initialOptions: InAppWebViewGroupOptions(
//                       crossPlatform: InAppWebViewOptions(
//                         javaScriptEnabled: true,
//                       ),
//                     ),
//                     onWebViewCreated: (InAppWebViewController controller) {
//                       webView = controller;
//                     },
//                     onProgressChanged: (_controller, progress) async {
//                       progressInt = double.parse(progress.toString())  / 100;
//                       print('progressInt : $progressInt');
//                       if(progress == 1.0){
//                         loadData = false;
//                       }
//                       setState(() {});
//                     },
//                     onLoadStart: (_controller, url){},
//                     onLoadStop: (_controller, url){},
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
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

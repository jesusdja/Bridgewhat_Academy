import 'package:academybw/main.dart';
import 'package:academybw/widgets_shared/widgets_shared.dart';
import 'package:flutter/material.dart';

class VideosPage extends StatefulWidget {
  const VideosPage({Key? key}) : super(key: key);

  @override
  State<VideosPage> createState() => _VideosPageState();
}

class _VideosPageState extends State<VideosPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: SizedBox(
        width: sizeW,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: sizeW * 0.06),
              child: bannerTitle(type: 1),
            ),
          ],
        ),
      ),
    );
  }
}

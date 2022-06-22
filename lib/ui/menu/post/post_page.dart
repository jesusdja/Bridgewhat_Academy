import 'package:academybw/main.dart';
import 'package:academybw/widgets_shared/widgets_shared.dart';
import 'package:flutter/material.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
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
              child: bannerTitle(type: 0),
            ),
          ],
        ),
      ),
    );
  }
}

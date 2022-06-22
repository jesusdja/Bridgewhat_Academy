import 'package:academybw/main.dart';
import 'package:academybw/widgets_shared/widgets_shared.dart';
import 'package:flutter/material.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({Key? key}) : super(key: key);

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
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
              child: bannerTitle(type: 3),
            ),
          ],
        ),
      ),
    );
  }
}

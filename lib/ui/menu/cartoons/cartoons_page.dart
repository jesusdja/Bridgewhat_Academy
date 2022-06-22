import 'package:academybw/main.dart';
import 'package:academybw/widgets_shared/widgets_shared.dart';
import 'package:flutter/material.dart';

class CartoonsPage extends StatefulWidget {
  const CartoonsPage({Key? key}) : super(key: key);

  @override
  State<CartoonsPage> createState() => _CartoonsPageState();
}

class _CartoonsPageState extends State<CartoonsPage> {
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
              child: bannerTitle(type: 2),
            ),
          ],
        ),
      ),
    );
  }
}

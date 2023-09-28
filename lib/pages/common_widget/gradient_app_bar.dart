import 'package:flutter/material.dart';

class GradientAppBarColor extends StatelessWidget {
  const GradientAppBarColor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color(0xff9eca47),
        Color(0xff68b9b3),
        Color(0xff6491d3)
      ])),
    );
  }
}

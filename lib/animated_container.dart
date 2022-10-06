import 'package:flutter/material.dart';
import "dart:math";

Color generateColor() => Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));
double generateBorderRadius() => Random().nextDouble() * 64;
double generateMargin() => Random().nextDouble() * 64;

class AnimatedContainerView extends StatefulWidget {
  const AnimatedContainerView({Key? key}) : super(key: key);

  @override
  State<AnimatedContainerView> createState() => _AnimatedContainerView();
}

class _AnimatedContainerView extends State<AnimatedContainerView> {
  late Color color;
  late double borderRadius;
  late double margin;
  @override
  void initState() {
    super.initState();
    color = Colors.red;
    borderRadius = generateBorderRadius();
    margin = generateMargin();
  }

  void change() {
    setState(() {
      color = generateColor();
      borderRadius = generateBorderRadius();
      margin = generateMargin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 200,
                height: 200,
                child: AnimatedContainer(
                  margin: EdgeInsets.all(margin),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                  duration: Duration(milliseconds: 500),
                ),
              ),
            ),
            ElevatedButton(onPressed: () => change(), child: const Text('change'))
          ],
        ),
      ),
    );
  }
}

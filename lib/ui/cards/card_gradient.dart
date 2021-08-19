import 'package:flutter/material.dart';

class CardGradient extends StatelessWidget {
  final Widget child;
  final Color colorFirst;
  final Color colorSecond;
  final double? height;
  final bool inverted;
  final double maxWidth;
  final double right;
  final double left;
  const CardGradient({
    Key? key,
    required this.child,
    this.colorFirst = Colors.black87,
    this.colorSecond = Colors.black54,
    this.height,
    this.inverted = false,
    this.maxWidth = 600,
    this.right = 20,
    this.left = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      padding: EdgeInsets.only(top: 20, right: right, bottom: 20, left: left),
      width: double.infinity,
      height: height,
      constraints: BoxConstraints(maxWidth: maxWidth),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [colorFirst, colorSecond]),
          borderRadius: BorderRadius.circular(20)),
      child: child,
    );
  }
}

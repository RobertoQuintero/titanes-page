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
    this.maxWidth = 500,
    this.right = 20,
    this.left = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double padding = 10;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      padding: size.width > 768
          ? EdgeInsets.only(top: padding, right: right, bottom: 0, left: left)
          : null,
      width: double.infinity,
      height: height,
      constraints: BoxConstraints(maxWidth: maxWidth),
      decoration: BoxDecoration(
          gradient: size.width > 768
              ? LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [colorFirst, colorSecond])
              : null,
          borderRadius: BorderRadius.circular(20)),
      child: child,
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';

class FroastedCard extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final Color color;
  const FroastedCard({
    Key? key,
    required this.child,
    this.width = 200,
    this.height = 200,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 9.0, sigmaY: 9.0),
        child: Container(
          width: width,
          height: height,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(width: .7, color: color.withOpacity(.5)),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  color.withOpacity(.7),
                  color.withOpacity(.5),
                ]),
            borderRadius: BorderRadius.circular(25),
          ),
          child: child,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CircularImage extends StatelessWidget {
  final String imgUrl;

  final bool inverted;
  final double topLeft;
  final double bottomLeft;
  final double topRight;
  final double bottomRight;
  final double maxWidth;
  const CircularImage({
    Key? key,
    required this.imgUrl,
    this.inverted = false,
    this.topLeft = 0,
    this.bottomLeft = 0,
    this.topRight = 0,
    this.bottomRight = 0,
    this.maxWidth = 400,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.only(
        topLeft: Radius.circular(topLeft),
        topRight: Radius.circular(topRight),
        bottomRight: Radius.circular(bottomRight),
        bottomLeft: Radius.circular(bottomLeft));
    return Container(
      padding: EdgeInsets.all(10),
      height: double.infinity,
      width: double.infinity,
      constraints: BoxConstraints(maxWidth: maxWidth, maxHeight: maxWidth),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: borderRadius,
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 15)]),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Hero(
          tag: this.imgUrl,
          child: Image.network(
            this.imgUrl,
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
      ),
    );
  }
}

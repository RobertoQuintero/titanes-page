import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = 50;
    final borderradius = BorderRadius.circular(width);
    return Container(
      padding: EdgeInsets.all(5),
      width: width,
      height: width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: borderradius,
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 15)]),
      child: ClipRRect(
        borderRadius: borderradius,
        child: InkWell(
          onTap: () => Navigator.pop(context),
          child: Image.asset(
            '/images/logo.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

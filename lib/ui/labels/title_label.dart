import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class TitleLabel extends StatelessWidget {
  final String text;
  const TitleLabel({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FadeInDown(
      delay: Duration(milliseconds: 800),
      child: Text(
        text,
        style: TextStyle(
            fontSize: size.width > 768 ? 50 : 30,
            fontFamily: 'MontserratAlternates',
            fontWeight: FontWeight.w700,
            color: Colors.white),
      ),
    );
  }
}

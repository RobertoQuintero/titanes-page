import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleLabel extends StatelessWidget {
  final String text;

  const TitleLabel({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final color = size.width < 768 ? Colors.black : Colors.white;
    return FadeInDown(
      from: 50,
      delay: Duration(milliseconds: 500),
      child: Text(text,
          style: GoogleFonts.montserratAlternates(
              fontSize: size.width > 768 ? 40 : 30,
              fontWeight: FontWeight.w700,
              color: color,
              letterSpacing: .5)),
    );
  }
}

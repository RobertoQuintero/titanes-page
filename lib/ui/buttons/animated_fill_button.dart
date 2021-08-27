import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimatedFillButton extends StatefulWidget {
  final String text;
  final Function onTap;
  const AnimatedFillButton({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  _AnimatedFillButtonState createState() => _AnimatedFillButtonState();
}

class _AnimatedFillButtonState extends State<AnimatedFillButton> {
  bool _isHover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onTap(),
      onHover: (value) {
        setState(() {
          _isHover = value;
        });
      },
      child: AnimatedContainer(
        curve: Curves.easeInOut,
        duration: Duration(milliseconds: 150),
        alignment: Alignment.center,
        width: 160,
        height: 40,
        decoration: BoxDecoration(
            color: _isHover ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(width: 2, color: Colors.white)),
        child: Text(
          widget.text,
          style: GoogleFonts.montserratAlternates(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: _isHover ? Colors.black : Colors.white),
        ),
      ),
    );
  }
}

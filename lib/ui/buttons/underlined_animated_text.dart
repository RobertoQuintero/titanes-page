import 'package:flutter/material.dart';

// ignore: avoid_web_libraries_in_flutter
// import 'dart:js' as js;

class UnderlinedAnimatedText extends StatefulWidget {
  final String text;
  final Color color;
  const UnderlinedAnimatedText(
      {Key? key, required this.text, required this.color})
      : super(key: key);

  @override
  _UnderlinedAnimatedTextState createState() => _UnderlinedAnimatedTextState();
}

class _UnderlinedAnimatedTextState extends State<UnderlinedAnimatedText> {
  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        InkWell(
          onTap: () {
            // js.context
            //     .callMethod('open', ['https://robertoquintero.vercel.app']);
          },
          onHover: (value) => setState(() => _isHover = value),
          child: Text(
            widget.text,
            style: TextStyle(color: widget.color, fontFamily: 'Poppins'),
          ),
        ),
        Positioned(
          bottom: -2,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            width: _isHover ? 119 : 0,
            height: 2,
            color: widget.color,
          ),
        )
      ],
    );
  }
}

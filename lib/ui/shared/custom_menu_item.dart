import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class CustomMenuItem extends StatefulWidget {
  final String text;
  final Function onPressed;
  final int delay;
  const CustomMenuItem(
      {Key? key, required this.text, required this.onPressed, this.delay = 0})
      : super(key: key);

  @override
  _CustomMenuItemState createState() => _CustomMenuItemState();
}

class _CustomMenuItemState extends State<CustomMenuItem> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      duration: Duration(milliseconds: 200),
      delay: Duration(milliseconds: widget.delay),
      from: 10,
      child: MouseRegion(
        onEnter: (_) => setState(() => isHover = true),
        onExit: (_) => setState(() => isHover = false),
        child: GestureDetector(
          onTap: () => widget.onPressed(),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            width: 150,
            height: 50,
            color: isHover ? Colors.white : Colors.transparent,
            child: Center(
              child: Text(widget.text,
                  style: TextStyle(
                      fontFamily: 'MontserratAlternates',
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: isHover ? Colors.black : Colors.white)),
            ),
          ),
        ),
      ),
    );
  }
}
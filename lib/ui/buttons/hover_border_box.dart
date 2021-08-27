import 'package:flutter/material.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

class HoverBorderBox extends StatefulWidget {
  final IconData? icon;
  final String? text;
  final double height;
  final double width;
  final double thickness;
  final Duration duration;
  final Color color;
  final double fontSize;
  final String url;

  const HoverBorderBox(
      {Key? key,
      this.icon,
      this.text,
      required this.height,
      required this.width,
      required this.thickness,
      required this.duration,
      this.color = Colors.black,
      this.fontSize = 17,
      required this.url})
      : super(key: key);

  @override
  _HoverBorderBoxState createState() => _HoverBorderBoxState();
}

class _HoverBorderBoxState extends State<HoverBorderBox> {
  double? topBottomLine;
  double? leftRightLine;
  bool isHover = false;

  @override
  void initState() {
    super.initState();
    topBottomLine = widget.width;
    leftRightLine = 0;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        js.context.callMethod('open', [widget.url]);
      },
      onHover: (value) {
        if (value) {
          topBottomLine = 0;
          leftRightLine = widget.height;
        } else {
          topBottomLine = widget.width;
          leftRightLine = 0;
        }
        setState(() {});
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Positioned(
                top: 0,
                left: 0,
                child: AnimatedContainer(
                  height: widget.thickness,
                  width: topBottomLine,
                  color: widget.color,
                  duration: widget.duration,
                )),
            Positioned(
                top: 0,
                left: 0,
                child: AnimatedContainer(
                  height: leftRightLine,
                  width: widget.thickness,
                  color: widget.color,
                  duration: widget.duration,
                )),
            Positioned(
                right: 0,
                top: 0,
                child: AnimatedContainer(
                  height: leftRightLine,
                  width: widget.thickness,
                  color: widget.color,
                  duration: widget.duration,
                )),
            Positioned(
                right: 0,
                bottom: 0,
                child: AnimatedContainer(
                  height: widget.thickness,
                  width: topBottomLine,
                  color: widget.color,
                  duration: widget.duration,
                )),
            Container(
              alignment: Alignment.center,
              width: widget.width,
              height: widget.height,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.icon != null)
                    Icon(widget.icon,
                        color: widget.color, size: widget.fontSize),
                  if (widget.text != null && widget.icon != null)
                    SizedBox(
                      width: 10,
                    ),
                  if (widget.text != null)
                    Text(
                      widget.text!,
                      style: TextStyle(
                          fontSize: widget.fontSize,
                          fontWeight: FontWeight.w700,
                          color: widget.color),
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

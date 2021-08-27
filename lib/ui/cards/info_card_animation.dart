import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoCardAnimation extends StatefulWidget {
  final String name;
  final String instrument;
  final String image;
  final double width;
  const InfoCardAnimation(
      {Key? key,
      required this.name,
      required this.instrument,
      required this.image,
      this.width = 200})
      : super(key: key);

  @override
  _InfoCardAnimationState createState() => _InfoCardAnimationState();
}

class _InfoCardAnimationState extends State<InfoCardAnimation> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: () => setState(() => isHover = !isHover),
      onHover: (value) => setState(() => isHover = value),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: widget.width,
        height: widget.width,
        decoration: BoxDecoration(
            color: isHover ? Colors.black : Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 20)]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedOpacity(
                    opacity: isHover ? 0.85 : 1,
                    duration: Duration(milliseconds: 200),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      width: isHover ? widget.width : widget.width * .6,
                      height: isHover ? widget.width : widget.width * .6,
                      margin: EdgeInsets.only(
                          top: isHover
                              ? 0
                              : (widget.width / 2 - widget.width * .6 / 2) -
                                  15),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(isHover ? 0 : widget.width),
                          image: DecorationImage(
                              scale: 1.1,
                              fit: BoxFit.cover,
                              image: NetworkImage(widget.image))),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 25,
                left: 15,
                child: Text(widget.name,
                    style: GoogleFonts.montserratAlternates(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: isHover ? Colors.white : Colors.black)),
              ),
              Positioned(
                bottom: 10,
                left: 15,
                child: Text(widget.instrument,
                    style: GoogleFonts.montserratAlternates(
                        fontSize: 14,
                        color: isHover ? Colors.white : Colors.black)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

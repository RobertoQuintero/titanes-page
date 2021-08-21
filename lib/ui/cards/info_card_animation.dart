import 'package:flutter/material.dart';

class InfoCardAnimation extends StatefulWidget {
  final String name;
  final String instrument;
  final String image;
  const InfoCardAnimation(
      {Key? key,
      required this.name,
      required this.instrument,
      required this.image})
      : super(key: key);

  @override
  _InfoCardAnimationState createState() => _InfoCardAnimationState();
}

class _InfoCardAnimationState extends State<InfoCardAnimation> {
  bool isHover = false;
  final double width = 250;
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
        width: width,
        height: width,
        margin: EdgeInsets.symmetric(horizontal: 20),
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
                      width: isHover ? width : width * .7,
                      height: isHover ? width : width * .7,
                      margin: EdgeInsets.only(top: isHover ? 0 : 15),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(isHover ? 0 : width),
                          image: DecorationImage(
                              scale: 1.1,
                              fit: BoxFit.cover,
                              image: AssetImage(widget.image))),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 25,
                left: 15,
                child: Text(
                  widget.name,
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'MontserratAlternates',
                      fontWeight: FontWeight.bold,
                      color: isHover ? Colors.white : Colors.black),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 15,
                child: Text(
                  widget.instrument,
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'MontserratAlternates',
                      color: isHover ? Colors.white : Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

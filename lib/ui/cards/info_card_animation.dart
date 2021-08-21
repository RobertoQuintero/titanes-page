import 'package:flutter/material.dart';

class InfoCardAnimation extends StatefulWidget {
  const InfoCardAnimation({Key? key}) : super(key: key);

  @override
  _InfoCardAnimationState createState() => _InfoCardAnimationState();
}

class _InfoCardAnimationState extends State<InfoCardAnimation> {
  bool isHover = false;
  final double width = 300;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      onTap: () {},
      onHover: (value) {
        if (value) {
          isHover = true;
        } else {
          isHover = false;
        }
        setState(() {});
      },
      child: Container(
        width: width,
        height: width,
        decoration: BoxDecoration(
            // color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 15)]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Stack(
            // clipBehavior: Clip.none,
            children: [
              Container(
                padding: EdgeInsets.all(15),
                color: Colors.white,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 500),
                  opacity: isHover ? 0 : 1,
                  child: Column(
                    children: [
                      Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100)),
                          child: Image.asset(
                            '/images/logo.jpg',
                            fit: BoxFit.cover,
                          )),
                      Text(
                        'ROberto carlor',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'In tempor et consectetur est anim irure esse ex ea.',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
              AnimatedPositioned(
                top: isHover ? -width * .5 : -width * 2,
                left: isHover ? -width * .5 : -width * 2,
                duration: Duration(milliseconds: 300),
                child: Container(
                  height: width * 2,
                  width: width * 2,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(width)),
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 500),
                  opacity: isHover ? 1 : 0,
                  child: Column(
                    children: [
                      Text(
                        'ROberto carlor',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      Text(
                        'Consectetur nulla velit eiusmod ea qui sunt id do ullamco aute pariatur elit. Tempor dolore nostrud et ex cupidatat ullamco sunt dolore cupidatat. Officia qui qui irure irure.',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

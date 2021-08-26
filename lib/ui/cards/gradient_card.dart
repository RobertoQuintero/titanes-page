import 'package:flutter/material.dart';

class GradientCard extends StatelessWidget {
  const GradientCard({
    Key? key,
    required this.width,
    required this.height,
    required this.topText,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.image,
    required this.colorFirst,
    required this.colorSecond,
  }) : super(key: key);

  final double width;
  final double height;
  final String topText;
  final String title;
  final String subtitle;
  final String image;
  final IconData icon;
  final Color colorFirst;
  final Color colorSecond;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter)),
        margin: EdgeInsets.only(bottom: 10),
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: LinearGradient(colors: [colorFirst, colorSecond])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon, color: Colors.white, size: 26),
                  Flexible(
                      child:
                          Text(topText, style: TextStyle(color: Colors.white)))
                ],
              ),
              Expanded(child: SizedBox()),
              Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 16, height: .2),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

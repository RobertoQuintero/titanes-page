import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:titanes_page/ui/buttons/animated_fill_button.dart';

final List<String> imgList = [
  'https://res.cloudinary.com/dmq9e2wuv/image/upload/v1629142429/bsjvhkttneak0br0gkyr.jpg',
  'https://res.cloudinary.com/dmq9e2wuv/image/upload/v1629142430/ufvxmhtmwxour0kygg9i.jpg',
  'https://res.cloudinary.com/dmq9e2wuv/image/upload/v1629142430/v4vjihqxuoyqzbdv16fx.jpg',
  'https://res.cloudinary.com/dmq9e2wuv/image/upload/v1629142429/lkbf8rjwmg9knkspxjgs.jpg',
  'https://res.cloudinary.com/dmq9e2wuv/image/upload/v1629142430/q27nqybl1mmponri9uff.jpg'
];

// final List<String> imgList = [
//   'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
//   'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
//   'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
//   'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
//   'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
//   'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
// ];

class SliderImages extends StatefulWidget {
  const SliderImages({Key? key}) : super(key: key);

  @override
  _SliderImagesState createState() => _SliderImagesState();
}

class _SliderImagesState extends State<SliderImages> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double padding = size.width < 650 ? 15 : size.width * .05;
    final double fontSize = size.width > 650 ? 25 : 0;
    final fontLarge = 40;
    final fontMedium = 30;

    return Stack(
      children: [
        Container(
            color: Colors.black,
            child: Opacity(opacity: 0.5, child: FullscreenSliderDemo())),
        Positioned(
          left: padding,
          bottom: padding,
          child: Container(
              alignment: Alignment.centerLeft,
              constraints: BoxConstraints(maxWidth: size.width * .7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Titanes Band',
                      style: GoogleFonts.montserratAlternates(
                          fontSize: fontLarge + fontSize,
                          color: Colors.white,
                          fontWeight: FontWeight.w700)),
                  Text('Salsa & cumbia',
                      style: GoogleFonts.montserratAlternates(
                          fontSize: fontMedium + fontSize,
                          color: Colors.white,
                          fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: 10,
                  ),
                  AnimatedFillButton(
                    text: 'Contacto',
                    onTap: () => Navigator.pushNamed(context, '/contacto'),
                  )
                ],
              )),
        ),
      ],
    );
  }
}

class FullscreenSliderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final double height = size.width < 450
        ? size.height
        : size.width < 990
            ? size.height * .7
            : size.width < size.height
                ? size.height * .7
                : size.height * .6;
    return CarouselSlider(
      options: CarouselOptions(
        height: height,
        viewportFraction: 1.0,
        enlargeCenterPage: false,
        autoPlay: true,
        autoPlayInterval: Duration(milliseconds: 5000),
      ),
      items: imgList
          .map((item) => Container(
                child: Center(
                    child: Image.network(
                  item,
                  fit: BoxFit.cover,
                  height: height,
                  width: size.width,
                )),
              ))
          .toList(),
    );
  }
}

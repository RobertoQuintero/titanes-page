import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:titanes_page/ui/layouts/custom_full_page.dart';

class PhotosPage extends StatelessWidget {
  const PhotosPage({Key? key}) : super(key: key);
  final String imgUrl =
      'https://res.cloudinary.com/dmq9e2wuv/image/upload/v1629305595/rxjymntpniftyvailibt.jpg';

  @override
  Widget build(BuildContext context) {
    return CustomFullPage(
      child: _WidgetDescription(),
      imgUrl: imgUrl,
      colorFirst: Color(0xffff6961),
      colorSecond: Color(0xffff6961).withOpacity(.8),
      pageTo: 2,
    );
  }
}

class _WidgetDescription extends StatelessWidget {
  final List<String> images = [
    'https://res.cloudinary.com/dmq9e2wuv/image/upload/v1629304714/ajwct5bl5bggknhfoqxb.jpg',
    'https://res.cloudinary.com/dmq9e2wuv/image/upload/v1629303198/g4lm88d8lxmcml0b8e0h.jpg',
    'https://res.cloudinary.com/dmq9e2wuv/image/upload/v1629303197/abvf9wwsawucrfjhuca7.jpg',
    'https://res.cloudinary.com/dmq9e2wuv/image/upload/v1629304714/ocrek5zz94vucreq7zac.jpg',
    'https://res.cloudinary.com/dmq9e2wuv/image/upload/v1629142430/v4vjihqxuoyqzbdv16fx.jpg',
    'https://res.cloudinary.com/dmq9e2wuv/image/upload/v1629142429/bsjvhkttneak0br0gkyr.jpg'
  ];

  List<Widget> generateImageTiles(Size screenSize) {
    return images
        .map(
          (element) => ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              element,
              fit: BoxFit.cover,
              width: screenSize.width,
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    List<Widget> imageSliders = generateImageTiles(screenSize);

    return Center(
      child: Column(
        children: [
          CarouselSlider(
            items: imageSliders,
            options: CarouselOptions(
              viewportFraction: .85,
              enlargeCenterPage: true,
              autoPlay: true,
            ),
          ),
          if (screenSize.width < 450)
            SizedBox(
              height: 150,
            )
        ],
      ),
    );
  }
}

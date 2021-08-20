import 'package:flutter/material.dart';

// final List<Map<String, String>> images = [
//   {
//     'imgUrl':
//         'https://res.cloudinary.com/dmq9e2wuv/image/upload/v1629305595/gbdxub9s8xzthl4irkka.jpg',
//     'route': '/titanes'
//   },
//   {
//     'imgUrl':
//         'https://res.cloudinary.com/dmq9e2wuv/image/upload/v1629305595/saa5zkd1bbkdqbaxocyi.jpg',
//     'route': '/integrantes'
//   },
//   {
//     'imgUrl':
//         'https://res.cloudinary.com/dmq9e2wuv/image/upload/v1629305595/rxjymntpniftyvailibt.jpg',
//     'route': '/fotos'
//   },
//   {
//     'imgUrl':
//         'https://res.cloudinary.com/dmq9e2wuv/image/upload/v1629305429/xnes55muzhjvlimvjpah.jpg',
//     'route': '/contacto'
//   },
// ];

final List<Map<String, String>> images = [
  {
    'imgUrl':
        'https://images.unsplash.com/photo-1523371683773-affcb4a2e39e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1402&q=80',
    'route': '/titanes'
  },
  {
    'imgUrl':
        'https://images.unsplash.com/photo-1550614806-51d8db524675?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
    'route': '/integrantes'
  },
  {
    'imgUrl':
        'https://images.unsplash.com/photo-1472393365320-db77a5abbecc?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
    'route': '/fotos'
  },
  {
    'imgUrl':
        'https://images.unsplash.com/photo-1592169813474-dd0c8e52e3bf?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
    'route': '/contacto'
  },
];

class MenuImagesGrid extends StatelessWidget {
  const MenuImagesGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        ...images
            .map(
                (img) => ImageItem(image: img['imgUrl']!, route: img['route']!))
            .toList(),
      ],
    );
  }
}

class ImageItem extends StatefulWidget {
  final String image;
  final String route;
  const ImageItem({Key? key, required this.image, required this.route})
      : super(key: key);

  @override
  _ImageItemState createState() => _ImageItemState();
}

class _ImageItemState extends State<ImageItem> {
  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    final hoveredTransform = Matrix4.identity()..scale(1.15);
    final transform = _isHover ? hoveredTransform : Matrix4.identity();
    final size = MediaQuery.of(context).size;
    final double small = 450;
    final double large = 990;
    final width = size.width < small
        ? size.width
        : size.width < large
            ? size.width / 2
            : size.width / 4;
    final height =
        size.width < size.height ? size.height * .2 : size.height * .3;

    return InkWell(
      onHover: (value) => setState(() => _isHover = value),
      onTap: () => Navigator.pushNamed(context, widget.route),
      child: Stack(
        children: [
          Container(
            width: width,
            height: height,
            child: Hero(
              tag: widget.image,
              child: Image.network(
                widget.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            width: width,
            transform: transform,
            height: height,
            color: _isHover ? Colors.black26 : Colors.black38,
            alignment: Alignment.center,
            child: Text(
              widget.route.substring(1),
              style: TextStyle(
                  fontFamily: 'MontserratAlternates',
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

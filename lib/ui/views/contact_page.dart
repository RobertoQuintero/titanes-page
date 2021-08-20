// https://images.unsplash.com/photo-1592169813474-dd0c8e52e3bf?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:titanes_page/ui/labels/title_label.dart';
import 'package:titanes_page/ui/layouts/custom_full_page.dart';

final String imgUrl =
    'https://images.unsplash.com/photo-1592169813474-dd0c8e52e3bf?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomFullPage(
      child: _WidgetDescription(),
      imgUrl: imgUrl,
      colorFirst: Color(0xff6A0675),
      colorSecond: Color(0xffA409B5),
      right: true,
    );
  }
}

final List<Map<String, dynamic>> contactData = [
  {'text': '782 528 4208', 'icon': MaterialCommunityIcons.whatsapp},
  {'text': '782 220 9710', 'icon': MaterialCommunityIcons.phone},
  {'text': 'Titanes Band', 'icon': MaterialCommunityIcons.facebook},
  {'text': 'Titanes Band', 'icon': MaterialCommunityIcons.instagram},
  {'text': 'Titanes Band', 'icon': MaterialCommunityIcons.youtube},
  {'text': '@titanesBand', 'icon': MaterialCommunityIcons.twitter},
];

class _WidgetDescription extends StatelessWidget {
  const _WidgetDescription({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (size.width < 290) return Container();
    return Flex(
      direction: Axis.horizontal,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleLabel(
              text: 'Contacto',
            ),
            SizedBox(
              height: 10,
            ),
            ...contactData
                .map((e) => Column(
                      children: [
                        ContactItem(text: e['text'], icon: e['icon']),
                        SizedBox(
                          height: 5,
                        )
                      ],
                    ))
                .toList()
          ],
        ),
        _ImagesStack()
      ],
    );
  }
}

class _ImagesStack extends StatelessWidget {
  const _ImagesStack({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double width = size.width < 450
        ? 130
        : size.width < 990
            ? 180
            : 240;
    final double height = size.width < 450
        ? 150
        : size.width < 770
            ? 250
            : size.width < 990
                ? 300
                : 400;
    return Container(
      width: size.width * .14,
      height: height,
      color: Colors.transparent,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -50,
            left: 40,
            child: Transform.rotate(
              angle: -pi / 4,
              child: Image.asset(
                '/images/trombon.png',
                width: width,
              ),
            ),
          ),
          Positioned(
            right: -100,
            top: 20,
            child: Transform.rotate(
              angle: pi / 10,
              child: Image.asset(
                '/images/trumpet.png',
                width: width - 30,
              ),
            ),
          ),
          Positioned(
            left: 10,
            bottom: -80,
            child: Transform.rotate(
              angle: pi / 12,
              child: Image.asset(
                '/images/conga.png',
                width: width + 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ContactItem extends StatelessWidget {
  final String text;
  final IconData icon;
  const ContactItem({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double fontSize = size.width < 768 ? 25 : 35;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.white, size: fontSize),
        SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: fontSize - 15,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins'),
        )
      ],
    );
  }
}

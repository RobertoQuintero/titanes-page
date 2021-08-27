import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:titanes_page/ui/cards/froasted_card.dart';
import 'package:titanes_page/ui/labels/title_label.dart';
import 'package:titanes_page/ui/layouts/custom_full_page.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

final String imgUrl =
    'https://res.cloudinary.com/dmq9e2wuv/image/upload/v1629305429/xnes55muzhjvlimvjpah.jpg';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomFullPage(
      child: _WidgetDescription(),
      imgUrl: imgUrl,
      colorFirst: Color(0xff957dad),
      colorSecond: Color(0xff957dad).withOpacity(.8),
      right: true,
    );
  }
}

final List<Map<String, dynamic>> contactData = [
  {'text': '782 528 4208', 'icon': MaterialCommunityIcons.phone},
  {'text': '782 220 9710', 'icon': MaterialCommunityIcons.phone},
  {'text': 'Titanes Band', 'icon': MaterialCommunityIcons.facebook},
  {'text': 'Titanes Band', 'icon': MaterialCommunityIcons.instagram},
  {'text': 'Titanes Band', 'icon': MaterialCommunityIcons.youtube},
  {'text': '@titanesBand', 'icon': MaterialCommunityIcons.twitter},
  {'text': 'titanesbandpr@gmail', 'icon': MaterialCommunityIcons.gmail},
];

class _WidgetDescription extends StatelessWidget {
  const _WidgetDescription({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (size.width < 290) return Container();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleLabel(
          text: 'Contacto',
        ),
        SizedBox(
          height: 10,
        ),
        Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            spacing: 15,
            runSpacing: 15,
            children: [
              FroastedCard(
                color: Colors.black,
                width: 250,
                height: 310,
                child: FeaturedItems(),
              ),
              SocialNetworkItems(),
              if (size.width > 990) _ImagesStack(),
            ]),
      ],
    );
  }
}

final List<String> featured = [
  'Tres sets de música en vivo',
  'DJ mezclando en vivo',
  'Escenario y pista iluminada',
  'Pantallas',
  'Luces y audio profesional',
  'Souvenirs',
  'Animación',
  'Shots y mucho más!',
];

class FeaturedItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...featured
            .map((e) => RowItem(
                  isWhite: true,
                  icon: Icons.check,
                  text: e,
                ))
            .toList(),
        SizedBox(
          height: 5,
        ),
        Text('Pregunta por los paquetes',
            style: GoogleFonts.montserratAlternates(
                fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white))
      ],
    );
  }
}

class SocialNetworkItems extends StatelessWidget {
  const SocialNetworkItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...contactData
            .map((e) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RowItem(
                        isWhite: size.width > 768,
                        text: e['text'],
                        icon: e['icon']),
                    SizedBox(
                      height: 5,
                    )
                  ],
                ))
            .toList(),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Color(0xff2E802A),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
            onPressed: () {
              js.context.callMethod('open', ['https://wa.me/5217825284208']);
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(MaterialCommunityIcons.whatsapp),
                SizedBox(
                  width: 5,
                ),
                Text('Whatsapp')
              ],
            ))
      ],
    );
  }
}

class RowItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool isWhite;
  const RowItem({
    Key? key,
    required this.text,
    required this.icon,
    this.isWhite = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: isWhite ? Colors.white : Colors.black,
          size: 26,
        ),
        SizedBox(
          width: 5,
        ),
        Flexible(
          child: Text(text,
              style: GoogleFonts.montserratAlternates(
                color: isWhite ? Colors.white : Colors.black,
                fontSize: size.width > 840 ? 17 : 15,
              )),
        ),
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
                ? 200
                : 300;
    return Container(
      width: size.width * .1,
      height: height,
      color: Colors.transparent,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -50,
            right: -150,
            child: Transform.rotate(
              angle: -pi / 4,
              child: Image.asset(
                '/images/trombon.png',
                width: width,
              ),
            ),
          ),
          Positioned(
            right: -150,
            top: 30,
            child: Transform.rotate(
              angle: pi / 12,
              child: Image.asset(
                '/images/conga.png',
                width: width + 20,
              ),
            ),
          ),
          Positioned(
            right: -70,
            bottom: -100,
            child: Transform.rotate(
              angle: pi / 10,
              child: Image.asset(
                '/images/trumpet.png',
                width: width - 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

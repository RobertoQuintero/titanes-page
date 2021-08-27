// https://images.unsplash.com/photo-1550614806-51d8db524675?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:titanes_page/ui/cards/info_card_animation.dart';
import 'package:titanes_page/ui/labels/title_label.dart';
// import 'package:titanes_page/ui/labels/title_label.dart';
import 'package:titanes_page/ui/layouts/custom_full_page.dart';

class TeamPage extends StatelessWidget {
  const TeamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String imgUrl =
        'https://res.cloudinary.com/dmq9e2wuv/image/upload/v1629305595/saa5zkd1bbkdqbaxocyi.jpg';
    return CustomFullPage(
      child: _WidgetDescription(),
      imgUrl: imgUrl,
      right: true,
      colorFirst: Color(0xffb5ead7),
      colorSecond: Color(0xffb5ead7).withOpacity(.8),
      pageTo: 1,
    );
  }
}

class _WidgetDescription extends StatelessWidget {
  const _WidgetDescription({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleLabel(
            text: 'Integrantes',
          ),
          SizedBox(
            height: 10,
          ),
          InfoPage()
        ],
      ),
    );
  }
}

final List<Map<String, String>> integrantes = [
  {
    'name': 'Jair Lara',
    'instrument': 'Conga',
    'image':
        'https://res.cloudinary.com/dmq9e2wuv/image/upload/v1630007534/tlyosvwr8ekgtglhyper.jpg'
  },
  {
    'name': 'Edy Palacios',
    'instrument': 'Teclado',
    'image':
        'https://res.cloudinary.com/dmq9e2wuv/image/upload/v1630007534/z0zdvsjtssnzuinf4w92.jpg'
  },
  {
    'name': 'Moi González',
    'instrument': 'Trompeta',
    'image':
        'https://res.cloudinary.com/dmq9e2wuv/image/upload/v1630007534/nok3mjenyej6gfuvrlij.jpg'
  },
  {
    'name': 'Alexis Macías',
    'instrument': 'Trombón',
    'image':
        'https://res.cloudinary.com/dmq9e2wuv/image/upload/v1630007534/hm2zntpq07vno4rvuuaa.jpg'
  },
  {
    'name': 'Ángel Medina',
    'instrument': 'Saxofón',
    'image':
        'https://res.cloudinary.com/dmq9e2wuv/image/upload/v1630007534/ueppppjhzhwbzwndly0c.jpg'
  },
  {
    'name': 'Luis Galván',
    'instrument': 'Vocalista',
    'image':
        'https://res.cloudinary.com/dmq9e2wuv/image/upload/v1630007534/fudd6z5rceazmqyrjp8u.jpg'
  },
  {
    'name': 'Yonathan Akira',
    'instrument': 'Batería',
    'image':
        'https://res.cloudinary.com/dmq9e2wuv/image/upload/v1630007535/jw5kfn71qxuxfunwd4mp.jpg'
  },
  {
    'name': 'Roberto Quintero',
    'instrument': 'Bajo',
    'image':
        'https://res.cloudinary.com/dmq9e2wuv/image/upload/v1630007534/yoqizyj5kdciheg28dat.jpg'
  },
];

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double width = size.width < 450 ? 300 : 170;
    if (size.width > 768 && size.width < 1100) width = 150;
    return Container(
      alignment: Alignment.center,
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.center,
        children: [
          ...integrantes
              .map((e) => InfoCardAnimation(
                  width: width,
                  name: e['name']!,
                  instrument: e['instrument']!,
                  image: e['image']!))
              .toList()
        ],
      ),
    );
  }
}

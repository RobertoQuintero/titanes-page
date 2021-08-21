// https://images.unsplash.com/photo-1550614806-51d8db524675?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:titanes_page/ui/cards/info_card_animation.dart';
// import 'package:titanes_page/ui/labels/title_label.dart';
import 'package:titanes_page/ui/layouts/custom_full_page.dart';

class TeamPage extends StatelessWidget {
  const TeamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String imgUrl =
        'https://images.unsplash.com/photo-1550614806-51d8db524675?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80';
    return CustomFullPage(
      child: _WidgetDescription(),
      imgUrl: imgUrl,
      right: true,
      colorFirst: Color(0xff75060D),
      colorSecond: Color(0xffBD0914),
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
    return Container(
      color: Colors.white,
      // child: Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     TitleLabel(text: 'Integrantes'),
      //     SizedBox(
      //       height: 10,
      //     ),
      //     Text(
      //       'Quis aute irure laborum tempor laborum nisi nulla nulla nisi.',
      //       style: TextStyle(fontSize: 30, color: Colors.white),
      //     ),
      //   ],
      // ),
    );
  }
}

final List<Map<String, String>> integrantes = [
  {
    'name': 'Jair Lara',
    'instrument': 'Conga',
    'image': 'assets/images/titanes4.jpg'
  },
  {
    'name': 'Edy Palacios',
    'instrument': 'Teclado',
    'image': 'assets/images/titanes6.jpg'
  },
  {
    'name': 'Moi González',
    'instrument': 'Trompeta',
    'image': 'assets/images/moi.jpg'
  },
  {
    'name': 'Alexis Macías',
    'instrument': 'Trombón',
    'image': 'assets/images/alexis.jpg'
  },
  {
    'name': 'Ángel Medina',
    'instrument': 'Saxofón',
    'image': 'assets/images/marvan.jpg'
  },
  {
    'name': 'Luis Galván',
    'instrument': 'Vocalista',
    'image': 'assets/images/luis.jpg'
  },
  {
    'name': 'Yonathan Akira',
    'instrument': 'Batería',
    'image': 'assets/images/titanes5.jpg'
  },
  {
    'name': 'Roberto Quintero',
    'instrument': 'Bajo',
    'image': 'assets/images/roberto.jpeg'
  },
];

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Colors.grey[200],
      body: Container(
        width: size.width,
        height: size.height,
        alignment: Alignment.center,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 30),
            child: Wrap(
              spacing: 15,
              runSpacing: 15,
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.center,
              children: [
                ...integrantes
                    .map((e) => InfoCardAnimation(
                        name: e['name']!,
                        instrument: e['instrument']!,
                        image: e['image']!))
                    .toList()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

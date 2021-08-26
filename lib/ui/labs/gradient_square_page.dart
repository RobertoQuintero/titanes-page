import 'package:flutter/material.dart';
import 'package:titanes_page/ui/cards/gradient_card.dart';

class GradientSquarePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            physics: BouncingScrollPhysics(),
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              children: [
                GradientCard(
                  image: 'assets/images/luis.jpg',
                  topText: 'Titanes Band',
                  title: 'Luis Galván',
                  subtitle: 'Vocalista',
                  icon: Icons.zoom_out,
                  colorFirst: Colors.deepOrange,
                  colorSecond: Colors.deepOrange.withOpacity(.6),
                  width: double.infinity,
                  height: size.width / 2 - 20,
                ),

                ImagesGroup(),
                // ImagesGroup(),
              ],
            ),
          )),
    );
  }
}

class ImagesGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width / 2 - 20;
    final height = size.width / 2 - 20 + size.width / 4;

    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flex(
          direction: Axis.vertical,
          children: [
            GradientCard(
                image: 'assets/images/roberto.jpeg',
                topText: 'Titanes Band',
                title: 'Roberto Quintero',
                subtitle: 'Bajo',
                icon: Icons.access_alarm_sharp,
                colorFirst: Colors.deepPurple,
                colorSecond: Colors.deepPurple.withOpacity(.6),
                width: width,
                height: height),
            GradientCard(
              image: 'assets/images/titanes4.jpg',
              topText: 'Titanes Band',
              title: 'Jair Lara',
              subtitle: 'Conga',
              icon: Icons.add_photo_alternate,
              colorFirst: Colors.pink,
              colorSecond: Colors.pink.withOpacity(.6),
              width: width,
              height: size.width / 2 - 20,
            ),
          ],
        ),
        Flex(
          direction: Axis.vertical,
          children: [
            GradientCard(
              image: 'assets/images/marvan.jpg',
              topText: 'Titanes Band',
              title: 'Angel Medina',
              subtitle: 'Saxofón',
              icon: Icons.wysiwyg_rounded,
              colorFirst: Colors.lightBlue,
              colorSecond: Colors.lightBlue.withOpacity(.6),
              width: width,
              height: size.width / 2 - 20,
            ),
            GradientCard(
              image: 'assets/images/titanes5.jpg',
              topText: 'Titanes Band',
              title: 'Yonathan Akira',
              subtitle: 'Batería',
              icon: Icons.wifi_tethering_off,
              colorFirst: Colors.red,
              colorSecond: Colors.red.withOpacity(.6),
              width: width,
              height: height,
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:titanes_page/ui/cards/froasted_card.dart';

class CristalPage extends StatelessWidget {
  const CristalPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double width = size.width;
    final double height = size.height;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/images/purple-1.jpg',
                ),
                fit: BoxFit.cover)),
        child: Stack(
          children: [
            Container(
              height: height,
              child: ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  physics: BouncingScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        FroastedCard(
                          color: Colors.black,
                          width: 250,
                          height: 310,
                          child: Column(
                            children: [
                              RowItem(
                                text: 'Tres sets de música en vivo',
                              ),
                              RowItem(
                                text: 'DJ mezclando en vivo',
                              ),
                              RowItem(
                                text: 'Escenario y pista iluminada',
                              ),
                              RowItem(
                                text: 'Pantallas',
                              ),
                              RowItem(
                                text: 'Luces y audio profesional',
                              ),
                              RowItem(
                                text: 'Souvenirs',
                              ),
                              RowItem(
                                text: 'Animación',
                              ),
                              RowItem(
                                text: 'Shots y mucho más!',
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Pregunta por los paquetes',
                                style: TextStyle(
                                    fontFamily: 'MontserratAlternates',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class RowItem extends StatelessWidget {
  final String text;
  const RowItem({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.check,
          color: Colors.white,
          size: 26,
        ),
        SizedBox(
          width: 5,
        ),
        Flexible(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'MontserratAlternates',
              color: Colors.white,
              fontSize: 17,
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:titanes_page/providers/page_privider.dart';
import 'package:titanes_page/ui/labels/title_label.dart';
import 'package:titanes_page/ui/layouts/custom_full_page.dart';

// final String imgeUrl = 'https://res.cloudinary.com/dmq9e2wuv/image/upload/v1629305595/gbdxub9s8xzthl4irkka.jpg';
class AboutPage extends StatelessWidget {
  // Color(0xff0D3EAD)
  navigationFunction(
      ScrollController scrollController, bool getBottom, BuildContext context) {
    if (scrollController.position.pixels >
        scrollController.position.maxScrollExtent) {
      if (!getBottom) {
        getBottom = true;
        Provider.of<PageProvider>(context, listen: false).goTo(1);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final String imgUrl =
        'https://images.unsplash.com/photo-1523371683773-affcb4a2e39e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1402&q=80';

    return CustomFullPage(
      child: _WidgetDescription(),
      imgUrl: imgUrl,
      // colorFirst: Color(0xff061B36),
      // colorSecond: Color(0xff0D3C75),
      colorFirst: Color(0xffD45CF2),
      colorSecond: Color(0xffDF61FF),
      pageTo: 0,
    );
  }
}

class _WidgetDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double fontSize = 17;
    if (size.width > 769 && size.width < 990) {
      fontSize = 15;
    }
    final double margin = 4;
    final color = size.width < 769 ? Colors.black : Colors.white;
    final textStyle = TextStyle(
        color: color,
        fontFamily: 'Poppins',
        // fontWeight: size.width < 769 ? FontWeight.w300 : null,
        fontWeight: FontWeight.w300,
        fontSize: fontSize);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleLabel(
          text: 'Titanes',
        ),
        SizedBox(
          height: 5,
        ),
        RichText(
            text: TextSpan(style: textStyle, children: [
          TextSpan(
              style: textStyle,
              text:
                  'Bienvenido a la página oficial de Titanes Band, una propuesta musical que te robará el aliento y te dejará vibrando. Te invitamos a visitar la página de '),
          _customSpan('Facebook', () => print('Facebook')),
          TextSpan(
              text:
                  ' para que estes al dia con todas las presentaciones y noticias, y a suscribirte también al canal de youtube '),
          _customSpan('Youtube', () => print('youtube')),
          TextSpan(text: ' para que disfrutes de los videos que se estrenan!'),
        ])),
        SizedBox(
          height: margin,
        ),
        Text(
          'Titanes Band es una agrupación originaria de Poza Rica Veracruz, con más de 5 años de trayectoria, se han abierto paso en el medio gracias a su juventud y frescura, asi como a la originalidad de sus talentosos integrantes, a su sobresaliente propuesta musical, a su gran energía e imagen.',
          style: textStyle,
        ),
        SizedBox(
          height: margin,
        ),
        Text(
          'Sus constantes actuaciones y su increible quimica con el público, han hecho que Titanes Band sea considerado uno de los mejores exponentes del género en la ciudad y en la región.',
          style: textStyle,
        ),
        SizedBox(
          height: margin,
        ),
        Text(
          'Formar parte de la experiencia con Titanes Band, deleitate con la versatilidad, baila hasta que el cuerpo aguante, canta con todas tus fuerzas al dolor y al amor y disfruta con la musica la alegría de la vida. ',
          style: textStyle,
        ),
        if (size.width < 450)
          SizedBox(
            height: 100,
          )
      ],
    );
  }

  TextSpan _customSpan(String title, Function onTap) {
    final _gestureRecognizer = TapGestureRecognizer()..onTap = () => onTap;
    return TextSpan(
        text: title,
        style: TextStyle(fontWeight: FontWeight.w300),
        recognizer: _gestureRecognizer);
  }
}

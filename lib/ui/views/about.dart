import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
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
        'https://res.cloudinary.com/dmq9e2wuv/image/upload/v1629305595/gbdxub9s8xzthl4irkka.jpg';

    return CustomFullPage(
      child: _WidgetDescription(),
      imgUrl: imgUrl,
      // colorFirst: Color(0xff061B36),
      // colorSecond: Color(0xff0D3C75),
      colorFirst: Color(0xffff9aa2),
      colorSecond: Color(0xffff9aa2).withOpacity(.8),
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
    final textStyle = GoogleFonts.montserratAlternates(
        color: color, fontWeight: FontWeight.w300, fontSize: fontSize);

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
              text:
                  'Bienvenido a la p??gina oficial de Titanes Band, una propuesta musical que te robar?? el aliento y te dejar?? vibrando. Te invitamos a visitar la p??gina de '),
          _customSpan('Facebook', () => print('Facebook')),
          TextSpan(
              text:
                  ' para que estes al dia con todas las presentaciones y noticias, y a suscribirte tambi??n al canal de youtube '),
          _customSpan('Youtube', () => print('youtube')),
          TextSpan(text: ' para que disfrutes de los videos que se estrenan!'),
        ])),
        SizedBox(
          height: margin,
        ),
        Text(
          'Titanes Band es una agrupaci??n originaria de Poza Rica Veracruz, con m??s de 5 a??os de trayectoria, se han abierto paso en el medio gracias a su juventud y frescura, asi como a la originalidad de sus talentosos integrantes, a su sobresaliente propuesta musical, a su gran energ??a e imagen.',
          style: textStyle,
        ),
        SizedBox(
          height: margin,
        ),
        Text(
          'Sus constantes actuaciones y su increible quimica con el p??blico, han hecho que Titanes Band sea considerado uno de los mejores exponentes del g??nero en la ciudad y en la regi??n.',
          style: textStyle,
        ),
        SizedBox(
          height: margin,
        ),
        Text(
          'Formar parte de la experiencia con Titanes Band, deleitate con la versatilidad, baila hasta que el cuerpo aguante, canta con todas tus fuerzas al dolor y al amor y disfruta con la musica la alegr??a de la vida. ',
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

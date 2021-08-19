import 'package:flutter/material.dart';
import 'package:titanes_page/ui/buttons/hover_border_box.dart';
import 'package:titanes_page/ui/buttons/underlined_animated_text.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

final List<IconData> icons = [
  MaterialCommunityIcons.facebook,
  MaterialCommunityIcons.youtube,
  MaterialCommunityIcons.twitter,
];

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.width < 450 ? size.height * .2 : size.height * .1,
      color: Colors.black26,
      alignment: Alignment.center,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        constraints: BoxConstraints(maxWidth: 1000),
        width: double.infinity,
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: size.width < 450
              ? WrapAlignment.center
              : WrapAlignment.spaceBetween,
          children: [
            Wrap(
              children: [
                Text(
                  'Developed by ',
                  style: TextStyle(color: Colors.white, fontFamily: 'Poppins'),
                  // style: GoogleFonts.poppins(
                  //     color: Colors.white, fontWeight: FontWeight.w500),
                ),
                UnderlinedAnimatedText(
                    text: 'Roberto Quintero', color: Color(0xffE6A805))
              ],
            ),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                ...icons
                    .map((e) => HoverBorderBox(
                        icon: e,
                        height: 40,
                        width: 40,
                        thickness: 2,
                        color: Colors.white,
                        fontSize: 22,
                        duration: Duration(milliseconds: 200)))
                    .toList(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

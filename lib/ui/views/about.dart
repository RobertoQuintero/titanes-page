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
      colorFirst: Color(0xff061B36),
      colorSecond: Color(0xff0D3C75),
      pageTo: 0,
    );
  }
}

class _WidgetDescription extends StatelessWidget {
  const _WidgetDescription({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleLabel(text: 'Titanes'),
        SizedBox(
          height: 10,
        ),
        Text(
          'Quis aute irure laborum tempor laborum nisi nulla nulla nisi.',
          style: TextStyle(color: Colors.white, fontFamily: 'Poppins'),
        ),
        Text(
          'Ullamco enim eu nulla id sint ea pariatur ut nostrud amet esse officia non proident. Ad pariatur voluptate laborum ad ea deserunt velit esse. Exercitation anim est pariatur id elit velit elit duis cillum amet non ad deserunt cupidatat. Nisi quis quis fugiat sunt qui minim proident aliquip velit pariatur magna occaecat. Non do dolor laboris cupidatat non nostrud esse sint tempor et.',
          style: TextStyle(color: Colors.white, fontFamily: 'Poppins'),
        ),
        Text(
          'Ullamco enim eu nulla id sint ea pariatur ut nostrud amet esse officia non proident. Ad pariatur voluptate laborum ad ea deserunt velit esse. Exercitation anim est pariatur id elit velit elit duis cillum amet non ad deserunt cupidatat. Nisi quis quis fugiat sunt qui minim proident aliquip velit pariatur magna occaecat. Non do dolor laboris cupidatat non nostrud esse sint tempor et.',
          style: TextStyle(color: Colors.white, fontFamily: 'Poppins'),
        ),
      ],
    );
  }
}

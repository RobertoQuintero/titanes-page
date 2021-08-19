import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:titanes_page/ui/layouts/custom_full_page.dart';

final String imgUrl =
    'https://images.unsplash.com/photo-1472393365320-db77a5abbecc?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80';

class PhotosPage extends StatelessWidget {
  const PhotosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomFullPage(
      child: _WidgetDescription(),
      imgUrl: imgUrl,
      colorFirst: Colors.yellow,
      colorSecond: Colors.yellowAccent,
      pageTo: 2,
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
      children: [
        Text(
          'Fotos',
          style: TextStyle(fontSize: 40, color: Colors.white),
        ),
        Text(
          'Quis aute irure laborum tempor laborum nisi nulla nulla nisi.',
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ],
    );
  }
}

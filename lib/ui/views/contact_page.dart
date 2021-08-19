// https://images.unsplash.com/photo-1592169813474-dd0c8e52e3bf?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:titanes_page/ui/layouts/custom_full_page.dart';

final String imgUrl =
    'https://images.unsplash.com/photo-1592169813474-dd0c8e52e3bf?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomFullPage(
      child: _WidgetDescription(),
      imgUrl: imgUrl,
      colorFirst: Colors.pink,
      colorSecond: Colors.pinkAccent,
      right: true,
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
          'Contacto',
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

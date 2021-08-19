// https://images.unsplash.com/photo-1550614806-51d8db524675?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:titanes_page/ui/layouts/custom_full_page.dart';

final String imgUrl =
    'https://images.unsplash.com/photo-1550614806-51d8db524675?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80';

class TeamPage extends StatelessWidget {
  const TeamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomFullPage(
      child: _WidgetDescription(),
      imgUrl: imgUrl,
      right: true,
      colorFirst: Colors.blue,
      colorSecond: Colors.lightBlue,
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
    return Column(
      children: [
        Text(
          'Integrantes',
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

// https://images.unsplash.com/photo-1550614806-51d8db524675?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:titanes_page/ui/labels/title_label.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleLabel(text: 'Integrantes'),
        SizedBox(
          height: 10,
        ),
        Text(
          'Quis aute irure laborum tempor laborum nisi nulla nulla nisi.',
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ],
    );
  }
}

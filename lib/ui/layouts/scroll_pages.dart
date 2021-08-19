import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:titanes_page/providers/page_privider.dart';
import 'package:titanes_page/ui/views/about.dart';
import 'package:titanes_page/ui/views/contact_page.dart';
import 'package:titanes_page/ui/views/integrantes.dart';
import 'package:titanes_page/ui/views/photos_page.dart';

class ScrollPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [_ScrollPages()],
    ));
  }
}

class _ScrollPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageProvider>(context, listen: false);
    // final size = MediaQuery.of(context).size;
    return PageView(
      controller: pageProvider.scrollController,
      // scrollDirection: size.width > 900 ? Axis.vertical : Axis.horizontal,
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      children: [AboutPage(), TeamPage(), PhotosPage(), ContactPage()],
    );
  }
}

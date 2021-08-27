import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:titanes_page/providers/page_privider.dart';
import 'package:titanes_page/ui/shared/custom_app_menu.dart';
import 'package:titanes_page/ui/shared/logo.dart';
import 'package:titanes_page/ui/views/views.dart';

class ScrollPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        _ScrollPages(),
        Positioned(top: 15, right: 10, child: SafeArea(child: CustomAppMenu())),
        Positioned(top: 15, left: 15, child: SafeArea(child: Logo()))
      ],
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

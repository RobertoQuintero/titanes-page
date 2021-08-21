import 'package:flutter/material.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

extension MouseAction on Widget {
  static final appContainer =
      html.window.document.getElementById('app-container');
  Widget onMouseHover(
      {required VoidCallback onEnter, required VoidCallback onExit}) {
    return MouseRegion(
        onEnter: (_) {
          onEnter();
        },
        onHover: (_) {
          appContainer!.style.cursor = 'pointer';
        },
        onExit: (_) {
          appContainer!.style.cursor = 'default';
          onExit();
        },
        child: this);
  }
}

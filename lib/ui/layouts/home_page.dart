import 'package:flutter/material.dart';
import 'package:titanes_page/ui/layouts/widgets_home/footer.dart';
import 'package:titanes_page/ui/layouts/widgets_home/menu_images_grid.dart';
import 'package:titanes_page/ui/layouts/widgets_home/slider_images.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          width: double.infinity,
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Column(
              children: [SliderImages(), MenuImagesGrid(), Footer()],
            ),
          ),
        ));
  }
}

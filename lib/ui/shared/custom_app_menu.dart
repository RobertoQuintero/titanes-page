import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:titanes_page/providers/page_privider.dart';
import 'package:titanes_page/ui/shared/custom_menu_item.dart';

class CustomAppMenu extends StatefulWidget {
  @override
  _CustomAppMenuState createState() => _CustomAppMenuState();
}

class _CustomAppMenuState extends State<CustomAppMenu>
    with SingleTickerProviderStateMixin {
  bool isOpen = false;
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
  }

  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageProvider>(context, listen: false);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          isOpen ? controller.reverse() : controller.forward();
          setState(() {
            isOpen = !isOpen;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: 150,
          height: isOpen ? 258 : 50,
          color: Colors.black,
          child: Column(
            children: [
              _MenuTitle(isOpen: isOpen, controller: controller),
              if (isOpen) ...[
                CustomMenuItem(
                    delay: 0,
                    text: 'Titanes',
                    onPressed: () => pageProvider.goTo(0)),
                CustomMenuItem(
                    delay: 40,
                    text: 'Integrantes',
                    onPressed: () => pageProvider.goTo(1)),
                CustomMenuItem(
                    delay: 80,
                    text: 'Fotos',
                    onPressed: () => pageProvider.goTo(2)),
                CustomMenuItem(
                    delay: 120,
                    text: 'Contacto',
                    onPressed: () => pageProvider.goTo(3)),
                SizedBox(
                  height: 8,
                )
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuTitle extends StatelessWidget {
  const _MenuTitle({
    Key? key,
    required this.isOpen,
    required this.controller,
  }) : super(key: key);

  final bool isOpen;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 50,
      child: Row(
        children: [
          AnimatedContainer(
            duration: Duration(
              milliseconds: 200,
            ),
            curve: Curves.easeInOut,
            width: isOpen ? 45 : 0,
          ),
          Text('Menú',
              style: TextStyle(
                  fontFamily: 'MontserratAlternates',
                  color: Colors.white,
                  fontSize: 18)),
          Spacer(),
          AnimatedIcon(
              icon: AnimatedIcons.menu_close,
              progress: controller,
              color: Colors.white),
        ],
      ),
    );
  }
}

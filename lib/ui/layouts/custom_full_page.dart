import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:titanes_page/providers/page_privider.dart';
import 'package:titanes_page/ui/cards/card_gradient.dart';
import 'package:titanes_page/ui/cards/circular_image.dart';

class CustomFullPage extends StatefulWidget {
  final Widget child;
  final String imgUrl;
  final bool right;
  final Color colorFirst;
  final Color colorSecond;
  final int? pageTo;
  const CustomFullPage(
      {Key? key,
      required this.child,
      required this.imgUrl,
      this.right = false,
      required this.colorFirst,
      required this.colorSecond,
      this.pageTo})
      : super(key: key);

  @override
  _CustomFullPageState createState() => _CustomFullPageState();
}

class _CustomFullPageState extends State<CustomFullPage> {
  ScrollController _scrollController = new ScrollController();
  bool _getBottom = false;

  final double small = 450;
  final double medium = 760;
  final double large = 990;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      navigationFunction(_scrollController);
    });
  }

  navigationFunction(ScrollController scrollController) {
    final pageProvider = Provider.of<PageProvider>(context, listen: false);
    if (scrollController.position.pixels >
        scrollController.position.maxScrollExtent) {
      if (!_getBottom) {
        _getBottom = true;
        if (widget.pageTo != null) {
          return pageProvider.goTo(widget.pageTo! + 1);
        }
      }
    } else if (scrollController.position.pixels < 0) {
      if (widget.pageTo != 0 && widget.pageTo != null) {
        return pageProvider.goTo(widget.pageTo! - 1);
      } else if (widget.pageTo == null) {
        return pageProvider.goTo(2);
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _getBottom = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double imageWidth = size.width < small
        ? size.width * .8
        : size.width < medium
            ? size.width * .5
            : size.width * .4;
    final double top =
        size.width < medium ? 40 : (size.height / 2) - (imageWidth / 2);
    final double stickyLocation =
        size.width < medium ? (size.width / 2) - (imageWidth / 2) : -10;
    final double circleMiddle = size.width < medium ? imageWidth : 0;
    final double cardHeight =
        size.width < 1100 ? imageWidth + 150 : imageWidth - 50;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      controller: _scrollController,
      child: Container(
        child: Column(
          children: [
            if (size.width > size.height &&
                size.height > 400 &&
                size.width < large)
              SizedBox(
                height: 100,
              ),
            Container(
              height: imageWidth + 40,
              width: size.width,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  if (size.width > medium)
                    Positioned(
                      top: size.height / 2 - (cardHeight) / 2,
                      right: widget.right ? null : size.width * .02,
                      left: widget.right ? size.width * .02 : null,
                      child: CardGradient(
                        colorFirst: widget.colorFirst,
                        colorSecond: widget.colorSecond,
                        child: widget.child,
                        height: cardHeight,
                        maxWidth: size.width,
                        left: widget.right ? 20 : imageWidth + 45,
                        right: widget.right ? imageWidth + 45 : 20,
                      ),
                    ),
                  Positioned(
                      top: top,
                      left: widget.right ? null : stickyLocation,
                      right: widget.right ? stickyLocation : null,
                      child: widget.right
                          ? CircularImage(
                              imgUrl: widget.imgUrl,
                              maxWidth: imageWidth,
                              topRight: circleMiddle,
                              bottomRight: circleMiddle,
                              topLeft: imageWidth,
                              bottomLeft: imageWidth,
                            )
                          : CircularImage(
                              imgUrl: widget.imgUrl,
                              maxWidth: imageWidth,
                              topRight: imageWidth,
                              bottomRight: imageWidth,
                              topLeft: circleMiddle,
                              bottomLeft: circleMiddle,
                            )),
                ],
              ),
            ),
            if (size.width > size.height &&
                size.height > 400 &&
                size.width < large)
              SizedBox(
                height: 150,
              ),
            if (size.width < medium) ...[
              SizedBox(
                height: 20,
              ),
              CardGradient(
                colorFirst: widget.colorFirst,
                colorSecond: widget.colorSecond,
                child: widget.child,
              ),
              SizedBox(
                height: 200,
              )
            ]
          ],
        ),
      ),
    );
  }
}

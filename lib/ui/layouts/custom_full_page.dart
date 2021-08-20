import 'package:animate_do/animate_do.dart';
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
  final double medium = 769;
  final double large = 990;
  final double extraLarge = 1100;

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
        size.width < medium ? 80 : (size.height / 2) - (imageWidth / 2);
    final double stickyLocation =
        size.width < medium ? (size.width / 2) - (imageWidth / 2) : -10;
    final double roundedCorner = size.width < medium ? imageWidth : 0;
    final double cardHeight =
        size.width < extraLarge ? imageWidth + 150 : imageWidth - 50;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      controller: _scrollController,
      child: Container(
        child: Column(
          children: [
            if (size.width < 825 && size.height < 420)
              SizedBox(
                height: 100,
              ),
            Container(
              height: imageWidth + 80,
              width: size.width,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  if (size.width > medium)
                    widget.right
                        ? Positioned(
                            top: size.height / 2 - (cardHeight) / 2,
                            right: null,
                            left: size.width * .02,
                            child: SlideInRight(
                              delay: Duration(milliseconds: 500),
                              child: CardGradient(
                                colorFirst: widget.colorFirst,
                                colorSecond: widget.colorSecond,
                                child: widget.child,
                                height: cardHeight,
                                maxWidth: size.width,
                                left: 20,
                                right: imageWidth + 45,
                              ),
                            ),
                          )
                        : Positioned(
                            top: size.height / 2 - (cardHeight) / 2,
                            right: size.width * .02,
                            left: null,
                            child: SlideInLeft(
                              delay: Duration(milliseconds: 500),
                              child: CardGradient(
                                colorFirst: widget.colorFirst,
                                colorSecond: widget.colorSecond,
                                child: widget.child,
                                height: cardHeight,
                                maxWidth: size.width,
                                left: imageWidth + 45,
                                right: 20,
                              ),
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
                              topRight: roundedCorner,
                              bottomRight: roundedCorner,
                              topLeft: imageWidth,
                              bottomLeft: imageWidth,
                            )
                          : CircularImage(
                              imgUrl: widget.imgUrl,
                              maxWidth: imageWidth,
                              topRight: imageWidth,
                              bottomRight: imageWidth,
                              topLeft: roundedCorner,
                              bottomLeft: roundedCorner,
                            )),
                ],
              ),
            ),
            if (size.width < 825 && size.height < 420)
              SizedBox(
                height: 100,
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
                height: 100,
              )
            ]
          ],
        ),
      ),
    );
  }
}

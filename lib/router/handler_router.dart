import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import 'package:titanes_page/providers/page_privider.dart';
import 'package:titanes_page/ui/layouts/home_page.dart';
import 'package:titanes_page/ui/layouts/scroll_pages.dart';
// import 'package:titanes_page/ui/layouts/scroll_pages.dart';
// // import 'package:titanes_page/ui/views/about.dart';
// import 'package:titanes_page/ui/views/contact_page.dart';
// import 'package:titanes_page/ui/views/integrantes.dart';
// import 'package:titanes_page/ui/views/photos_page.dart';

class HandlerRouter {
  static Handler home = Handler(handlerFunc: (context, params) {
    return HomePage();
  });

  static Handler scrollHandler = Handler(handlerFunc: (context, params) {
    final page = params['page']!.first;
    if (page != '/') {
      final pageProvider = Provider.of<PageProvider>(context!, listen: false);

      pageProvider.createScrollController(page);
      return ScrollPages();
    }
  });
}

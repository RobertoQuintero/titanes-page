import 'package:fluro/fluro.dart';
import 'package:titanes_page/router/handler_router.dart';

class Flurorouter {
  static final FluroRouter router = new FluroRouter();

  static String rootRoute = '/';
  static String aboutRoute = '/titanes';
  static String teamRoute = '/integrantes';
  static String photosRoute = '/fotos';
  static String contactRoute = '/contacto';

  static void configureRoutes() {
    router.define(
      rootRoute,
      handler: HandlerRouter.home,
      transitionType: TransitionType.fadeIn,
    );

    router.define('/:page',
        handler: HandlerRouter.scrollHandler,
        transitionType: TransitionType.fadeIn,
        transitionDuration: Duration(milliseconds: 300));

    router.notFoundHandler = HandlerRouter.home;
  }
}

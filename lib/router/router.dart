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
    router.define(rootRoute,
        handler: HandlerRouter.home, transitionType: TransitionType.fadeIn);

    router.define('/:page',
        handler: HandlerRouter.scrollHandler,
        transitionType: TransitionType.fadeIn);

    // router.define(aboutRoute,
    //     handler: HandlerRouter.about, transitionType: TransitionType.fadeIn);

    // router.define(teamRoute,
    //     handler: HandlerRouter.team, transitionType: TransitionType.fadeIn);
    // router.define(photosRoute,
    //     handler: HandlerRouter.photo, transitionType: TransitionType.fadeIn);
    // router.define(contactRoute,
    //     handler: HandlerRouter.contact, transitionType: TransitionType.fadeIn);

    router.notFoundHandler = HandlerRouter.home;
  }
}

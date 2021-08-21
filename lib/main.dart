import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:titanes_page/providers/page_privider.dart';
import 'package:titanes_page/router/router.dart';
import 'package:titanes_page/services/navigation_service.dart';
import 'package:titanes_page/ui/cards/info_card_animation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flurorouter.configureRoutes();
  runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => PageProvider())],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.deepPurple,
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: InfoPage(),
      // initialRoute: '/contacto',
      // onGenerateRoute: Flurorouter.router.generator,
      // navigatorKey: NavigationService.navigatorKey,
      // theme:
      //     ThemeData.light().copyWith(scaffoldBackgroundColor: Colors.white)
    );
  }
}

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        child: Center(
          child: InfoCardAnimation(),
        ),
      ),
    );
  }
}

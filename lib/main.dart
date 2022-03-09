import 'package:flutter/material.dart';
import 'utils/singleton.dart';
import 'router.dart';

// main app server
void main() {
  runApp(
    MyApp(
      router: AppRouter(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AppRouter router;
  MyApp({Key? key, required this.router}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Singleton.isLoggedIn = true;
/*     SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]); */
    return MaterialApp(
      title: Singleton.App_Caption,
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      onGenerateRoute: router.generateRoute,
    );
  }
}

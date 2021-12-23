import 'package:flutter/material.dart';
import 'package:whatchlist/views/start_page.dart';
import 'package:whatchlist/views/login_view.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
   const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  _AppState createState() => _AppState();
}


class _AppState extends State<MyApp> {

  final ThemeData _lightTheme =
  ThemeData.light().copyWith(accentColor: Colors.transparent);
  final ThemeData _darkTheme =
  ThemeData.dark().copyWith(accentColor: Colors.transparent);
  //final AbstractRoutes routes = Routes.routes;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie',
      debugShowCheckedModeBanner: false,
      theme: _lightTheme,
      darkTheme: _darkTheme,
      /*localizationsDelegates: [
        I18n.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],*/
     /* supportedLocales: I18n.delegate.supportedLocales,
      localeResolutionCallback:
      I18n.delegate.resolution(fallback: new Locale("en", "US")),
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],*/
      initialRoute: '/',
      routes: {
        
        '/' : (context) => const FirstScreen(),
        '/second': (context) => const LoginView()
      },
      /*home: routes.buildPage('startpage', null),
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute<Object>(builder: (BuildContext context) {
          return routes.buildPage(settings.name, settings.arguments);
        });
      },*/
    );
  }
}

// @dart=2.9
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:whatchlist/views/countries.dart';
import 'package:whatchlist/views/nuevo.dart';
import 'package:whatchlist/views/popular.dart';
import 'package:whatchlist/views/watchlist.dart';
import 'package:whatchlist/views/search.dart';
import 'package:whatchlist/views/start_page.dart';
import 'package:whatchlist/views/login_view.dart';
import 'package:whatchlist/views/home.dart';
import 'package:whatchlist/views/register_view.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'firebase_options.dart';
import 'package:whatchlist/services/auth.dart';
import 'package:whatchlist/views/search.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp(post: getPopularMovies(apiType)));
}

class MyApp extends StatefulWidget {
  final Future<List<PopularMovie>> post;

  const MyApp({Key key, this.post}) : super(key: key);

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
        '/login': (context) => const LoginView(),
        '/home': (context) => const Home(),
        '/register': (context) => const RegisterView(),
        '/search': (context) => const Search(),
        '/new' : (context) => const Nuevo(),
        '/popular' : (context) => const Popular(),
        '/watchlist' : (context) => const Watchlist(),
        '/countries' : (context) => const Countries()

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

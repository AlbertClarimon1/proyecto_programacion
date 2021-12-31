// @dart=2.9
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:whatchlist/views/countries.dart';
import 'package:whatchlist/views/gustos.dart';
import 'package:whatchlist/views/nuevo.dart';
import 'package:whatchlist/views/popular.dart';
import 'package:whatchlist/views/watchlist.dart';
import 'package:whatchlist/views/search.dart';
import 'package:whatchlist/views/start_page.dart';
import 'package:whatchlist/views/login_view.dart';
import 'package:whatchlist/views/home.dart';
import 'package:whatchlist/views/register_view.dart';
import 'firebase_options.dart';
import 'package:whatchlist/services/auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp(post: getPopularMovies(apiType)));
}

class MyApp extends StatefulWidget {
  final Future<List<PopularMovie>> post;

  const MyApp({Key key, this.post}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}


class _AppState extends State<MyApp> {

  final ThemeData _lightTheme =
  ThemeData.light().copyWith(accentColor: Colors.transparent);
  final ThemeData _darkTheme =
  ThemeData.dark().copyWith(accentColor: Colors.transparent);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie',
      debugShowCheckedModeBanner: false,
      theme: _lightTheme,
      darkTheme: _darkTheme,
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
        '/countries' : (context) => const Countries(),
        '/preferences' : (context) => const Gustos()

      },
    );
  }
}

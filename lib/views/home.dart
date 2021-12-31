import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatchlist/services/auth.dart';
import 'package:whatchlist/widget/bottom bar.dart';
import 'package:whatchlist/widget/appBar.dart';

String apiType = "http://api.themoviedb.org/3/discover/movie?sort_by=vote_average.desc&api_key=70242251c4047938bf574587e8bf585e&1&vote_count.gte=10000http://api.themoviedb.org/3/discover/movie?sort_by=vote_average.desc&api_key=70242251c4047938bf574587e8bf585e&1&vote_count.gte=10000";
String lenguaje = "";
String similar_movie = "";
List gustos = [];
List nombreGustos = [];
User? user;
List countries = ["es", "en", "fr", "de", "it"];
Color colorGusto = Colors.white;



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  State<Home> createState() => HomePage();
}

class HomePage extends State<Home>{
  void login(){
    setState(() {
      Navigator.pushNamed(context, '/');
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBar2(context),
      bottomNavigationBar: bottomBar(context),
      body: SafeArea(
          child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: 1,
              itemBuilder: (BuildContext context, int index){
                return Container(
                  child: Column(
                      children: [
                        popularmoviesicon("Mejor calificadas", "http://api.themoviedb.org/3/discover/movie?sort_by=vote_average.desc&api_key=70242251c4047938bf574587e8bf585e&1&vote_count.gte=10000", context, Axis.horizontal),
                        SizedBox(height: 20),
                        popularmoviesicon("Proximos lanzamientos", "https://api.themoviedb.org/3/movie/upcoming?api_key=70242251c4047938bf574587e8bf585e", context,Axis.horizontal),
                        SizedBox(height: 20),
                        popularmoviesicon("Mas remuneradas", "https://api.themoviedb.org/3/discover/movie?api_key=70242251c4047938bf574587e8bf585e&language="+lenguaje+"&sort_by=revenue.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate", context,Axis.horizontal),
                        SizedBox(height: 20),
                        popularmoviesicon("Recomendaciones", "https://api.themoviedb.org/3/movie/"+similar_movie+"/recommendations?api_key=70242251c4047938bf574587e8bf585e&language"+lenguaje, context,Axis.horizontal),
                        Column(
                          children: prueba(),
                        ),
                      ]
                  ),
                );
              }
          ),
      ),
    );
  }

  List <Widget> prueba(){
    List<Widget> listElementWidgetList = <Widget>[];
    for(int i=0; i<nombreGustos.length;i++){
      var listad = popularmoviesicon("Porque te gusta "+ nombreGustos[i], "https://api.themoviedb.org/3/discover/movie?api_key=70242251c4047938bf574587e8bf585e&with_genres="+gustos[i].toString(), context, Axis.horizontal);
      listElementWidgetList.add(listad);
    }
    return listElementWidgetList;
  }

}




import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:whatchlist/services/auth.dart';
//import 'package:whatchlist/services/auth.dart';
import 'package:whatchlist/widget/iconButton.dart';
//import 'package:whatchlist/services/auth.dart';
//import 'package:http_parser/http_parser.dart' as http;
//import 'package:whatchlist/main.dart';
String apiType = "http://api.themoviedb.org/3/discover/movie?sort_by=vote_average.desc&api_key=70242251c4047938bf574587e8bf585e&1&vote_count.gte=10000http://api.themoviedb.org/3/discover/movie?sort_by=vote_average.desc&api_key=70242251c4047938bf574587e8bf585e&1&vote_count.gte=10000";
String lenguaje = "es";


class Home extends StatefulWidget {

  const Home({Key? key}) : super(key: key);
  State<Home> createState() => HomePage();
//HomePage createState()=> HomePage();
}

class HomePage extends State<Home>{


  void login(){
    setState(() {
      Navigator.pushNamed(context, '/');
    });
  }




  popularmoviesicon(String textType, String Api ){
    return Container(
      height: (MediaQuery.of(context).size.height)/1.5,
      width: (MediaQuery.of(context).size.width),
      //child: Expanded(
      child: Column(
        children: [
          Row(
            children: [
              Text(
                textType,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          SizedBox(height: 20),
          Expanded(
            //child: Column(
            //children: [
            child: FutureBuilder<List<PopularMovie>>(
              future: getPopularMovies(Api),
              builder: (BuildContext context, AsyncSnapshot<List> snapshot){
                if(!snapshot.hasData)
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                // return
                List<PopularMovie>? movies = snapshot.data?.cast<PopularMovie>();

                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.all(8),
                    itemCount: movies!.length,
                    itemBuilder: (BuildContext context, int index){
                      return Container(
                        child: Column(
                          children: [
                            /*Text(
                              movies[index].title,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),*/

                            FadeInImage.memoryNetwork(
                              placeholder: kTransparentImage,
                              image: "https://image.tmdb.org/t/p/w500/" + movies[index].posterPath,
                              fit: BoxFit.cover,
                              height: 450,
                            ),
                          ],
                        ),
                      );
                    }
                );
              },
            ),
          ),

        ],
      ),
      // ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: 1,
          itemBuilder: (BuildContext context, int index){
            return Container(
              child: Column(
                  children: [
                    popularmoviesicon("Mejor calificadas", "http://api.themoviedb.org/3/discover/movie?sort_by=vote_average.desc&api_key=70242251c4047938bf574587e8bf585e&1&vote_count.gte=10000http://api.themoviedb.org/3/discover/movie?sort_by=vote_average.desc&api_key=70242251c4047938bf574587e8bf585e&1&vote_count.gte=10000"),
                    SizedBox(height: 20),
                    popularmoviesicon("Proximos lanzamientos", "https://api.themoviedb.org/3/movie/upcoming?api_key=70242251c4047938bf574587e8bf585e"),
                    SizedBox(height: 20),
                    popularmoviesicon("Mas remuneradas", "https://api.themoviedb.org/3/discover/movie?api_key=70242251c4047938bf574587e8bf585e&language="+lenguaje+"&sort_by=revenue.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate")
                    //popularmoviesicon("Romance"),
                  ]
              ),
            );
          }
        ),


      ),
    );
  }

}




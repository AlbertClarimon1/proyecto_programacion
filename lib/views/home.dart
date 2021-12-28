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
String Api = "http://api.themoviedb.org/3/discover/movie?sort_by=vote_average.desc&api_key=70242251c4047938bf574587e8bf585e&1&vote_count.gte=10000";



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

  Movies(String api){
    Api = api;

  }



  popularmoviesicon(List? movies){

    /*for(int i=0; i<movies!.length;i++){
      PopularMovie movie = movies[i];
      var imageURL = "https://image.tmdb.org/t/p/w500/" + movie.posterPath;


    }*/
    //return listElementWidgetList;
    GridView.count(
      crossAxisCount: 1,
        children: List.generate(100, (index) {
      return Center(
        child: Text(
          'Item $index',
          style: Theme.of(context).textTheme.headline5,
        ),
      );
    }),
    );


  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          child: Column(
              children: [
                Container(
                  height: (MediaQuery.of(context).size.height)/1.5,
                  width: (MediaQuery.of(context).size.width),
                 //child: Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: const [
                            Text(
                              "Mejor calificadas",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                            //Movies("http://api.themoviedb.org/3/discover/movie?sort_by=vote_average.desc&api_key=70242251c4047938bf574587e8bf585e&1&vote_count.gte=10000"),
                          ],
                        ),
                        SizedBox(height: 20),
                        Expanded(
                            //child: Column(
                              //children: [
                            child: FutureBuilder<List<PopularMovie>>(
                              future: getPopularMovies(),
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
                                            Text(
                                              movies[index].title,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),

                                            FadeInImage.memoryNetwork(
                                              placeholder: kTransparentImage,
                                              image: "https://image.tmdb.org/t/p/w500/" + movies[index].posterPath,
                                              fit: BoxFit.cover,
                                              height: 430,
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
                ),
              ]
          ),
        ),

      ),
    );
  }

}




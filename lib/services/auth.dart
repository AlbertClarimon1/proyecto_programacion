
import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatchlist/views/home.dart';
import 'package:whatchlist/services/MovieDetailsPage.dart';
import 'package:http/http.dart' as http;
import 'package:transparent_image/transparent_image.dart';

class PopularMovie {
  var id;
  String title;
  String posterPath;
  String backdropPath;
  String originalTitle;
  var voteAverage;
  String overview;
  String releaseDate;

  PopularMovie(this.id, this.title, this.posterPath, this.backdropPath,
      this.originalTitle, this.voteAverage, this.overview, this.releaseDate);
}

class generos{
  var id;
  String name;
  bool press;
  Color color;

  generos(this.id, this.name, this.press, this.color);
}

Future <List<generos>> getGenero() async {
  final String nowPlaying = "https://api.themoviedb.org/3/genre/movie/list?api_key=70242251c4047938bf574587e8bf585e";

  var httpClient = HttpClient();
  var request = await httpClient.getUrl(Uri.parse(nowPlaying));
  var response = await request.close();
  var jsonResponse = await response.transform(utf8.decoder).join();
  // Decode the json response
  var data = jsonDecode(jsonResponse);
  // Get the result list
  List results = data["genres"];
  // Get the Movie list
  List<generos> movieGender = createGenero(results);
  // Print the results.
  return movieGender;
}


List<generos> createGenero(List data) {
  List<generos> list = [];
  for (int i = 0; i < data.length; i++) {
    var id = data[i]["id"];
    String name = data[i]["name"];
    bool press = false;
    Color color = Colors.white;

    generos movie = generos(
        id,
        name, press, color);
    list.add(movie);

  }
  return list;
}

Future <List<PopularMovie>> getPopularMovies( String Api) async {
  final String nowPlaying = Api;

  var httpClient = HttpClient();
  var request = await httpClient.getUrl(Uri.parse(nowPlaying));
  var response = await request.close();
  var jsonResponse = await response.transform(utf8.decoder).join();
  // Decode the json response
  var data = jsonDecode(jsonResponse);
  // Get the result list
  List results = data["results"];
  // Get the Movie list
  List<PopularMovie> movieList = createPopularMovieList(results);
  // Print the results.
  return movieList;
}



List<PopularMovie> createPopularMovieList(List data) {
  List<PopularMovie> list = [];
  for (int i = 0; i < data.length; i++) {
    var id = data[i]["id"];
    String title = data[i]["title"];
    String posterPath = data[i]["poster_path"];

    if(posterPath != null && data[i]["backdrop_path"]!= null){
      posterPath = "https://image.tmdb.org/t/p/w500/" + posterPath;
      String backdropImage = data[i]["backdrop_path"];
      String originalTitle = data[i]["original_title"];
      var voteAverage = data[i]["vote_average"];
      String overview = data[i]["overview"];
      String releaseDate = data[i]["release_date"];

      PopularMovie movie = PopularMovie(
          id,
          title,
          posterPath,
          backdropImage,
          originalTitle, voteAverage, overview, releaseDate);
      list.add(movie);
    }
  }
  return list;
}

popularmoviesicon(String textType, String Api, BuildContext context, Axis axis  ){
  return Container(
    height: (MediaQuery.of(context).size.height)/1.4,
    width: (MediaQuery.of(context).size.width),
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
          child: FutureBuilder<List<PopularMovie>>(
            future: getPopularMovies(Api),
            builder: (BuildContext context, AsyncSnapshot<List> snapshot){
              if(!snapshot.hasData)
                return Center(
                  child: CircularProgressIndicator(),
                );
              List<PopularMovie>? movies = snapshot.data?.cast<PopularMovie>();

              return ListView.builder(
                  scrollDirection: axis,
                  padding: const EdgeInsets.all(8),
                  itemCount: movies!.length,
                  itemBuilder: (BuildContext context, int index){
                    return Container(
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: (){
                              if (movies[index].id > 0) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => MovieDetailsPage(movies[index].id )),
                              );
                              }
                            },

                            child: FadeInImage.memoryNetwork(
                              placeholder: kTransparentImage,
                              image: movies[index].posterPath,
                              fit: BoxFit.cover,
                              height: 450,
                            ),
                          )
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

genresTypes(BuildContext context){
  return Container(
    height: (MediaQuery.of(context).size.height),
    width: (MediaQuery.of(context).size.width),
    child: Column(

      children: [
    Expanded(
    child: FutureBuilder<List<generos>>(
        future: getGenero(),
    builder: (BuildContext context, AsyncSnapshot<List> snapshot){
      if(!snapshot.hasData)
        return Center(
          child: CircularProgressIndicator(),
        );
      // return
      List<generos>? movies = snapshot.data?.cast<generos>();

      return ListView.builder(
          padding: const EdgeInsets.all(0),
          itemCount: movies!.length,
          itemBuilder: (BuildContext context, int index){
            return Container(
              child: Column(
                children: [
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () async {
                      if (movies[index].id > 0) {
                        if( movies[index].press == false){
                          nombreGustos.add(movies[index].name);
                          gustos.add(movies[index].id);
                          movies[index].press = true;
                          movies[index].color = Colors.amber;
                        }else{
                          for(int i=0; i<gustos.length;i++){
                            print(nombreGustos[i]);
                            print(movies[index].name);
                            if(movies[index].name.compareTo(nombreGustos[i])==0){
                              nombreGustos.remove(nombreGustos[i]);
                              gustos.remove(gustos[i]);
                            }

                          }
                          movies[index].color = Colors.white;
                          movies[index].press = false;
                        }
                        await FirebaseFirestore.instance.collection("users").doc(user!.uid).update({
                          'gustos':gustos,
                          'nombreGustos':nombreGustos,
                        });
                        await FirebaseFirestore.instance.collection("users").doc(user!.uid).get().then((resultado){
                          lenguaje = resultado['idiom'];
                          gustos = resultado['gustos'];
                          nombreGustos = resultado['nombreGustos'];
                          similar_movie = resultado['similar_movie'].toString();
                        });
                      }
                    },

                    child: Text(
                      movies[index].name,
                      style: TextStyle(
                        color: movies[index].color ,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  )
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
  );
}




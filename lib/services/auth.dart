
import 'dart:convert';
import 'dart:async';
import 'dart:io';
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
  return list;
}

popularmoviesicon(String textType, String Api, BuildContext context ){
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
                              image: "https://image.tmdb.org/t/p/w500/" + movies[index].posterPath,
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

List<Widget> createPopularMovieCardItem(
    List<PopularMovie> movies, BuildContext context) {
  // Children list for the list.
  List<Widget> listElementWidgetList = <Widget>[];
  if (movies != null) {
    var lengthOfList = movies.length;
    for (int i = 0; i < lengthOfList; i++) {
      PopularMovie movie = movies[i];
      // Image URL
      var imageURL = "https://image.tmdb.org/t/p/w500/" + movie.posterPath;
      // List item created with an image of the poster
      var listItem = GridTile(
          footer: GridTileBar(
            backgroundColor: Colors.black45,
            title: Text(movie.title),
          ),
          child: GestureDetector(
            onTap: () {
              if (movie.id > 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => MovieDetailsPage(movie.id)),
                );
              }
            },
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: imageURL,
              fit: BoxFit.cover,
            ),
          ));
      listElementWidgetList.add(listItem);
    }
  }
  return listElementWidgetList;
}





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


Future <List<PopularMovie>> getPopularMovies() async {
  final String nowPlaying =
      'http://api.themoviedb.org/3/discover/movie?sort_by=vote_average.desc&api_key=70242251c4047938bf574587e8bf585e&1&vote_count.gte=10000http://api.themoviedb.org/3/discover/movie?sort_by=vote_average.desc&api_key=70242251c4047938bf574587e8bf585e&1&vote_count.gte=10000';

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




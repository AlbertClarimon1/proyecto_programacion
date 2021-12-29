
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:whatchlist/services/auth.dart';
import 'package:whatchlist/views/home.dart';
import 'package:http/http.dart' as http;


  // Method to get now playing movies from the backend

class MovieDetailsPage extends StatelessWidget {
  MovieDetailsPage(this.id);
  var id;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder<MovieDetail>(
        future: getMovieDetail(id),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            print("Result $snapshot");
            return Container(
              // Shows progress indicator until the data is load.
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          } else {
            MovieDetail? movies = snapshot.data;
            return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: 1,
                itemBuilder: (BuildContext context, int index){
                  return Container(
                    child: Column(
                      children: [
                         FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: "https://image.tmdb.org/t/p/w500/" + movies!.backdropPath,
                          fit: BoxFit.cover,
                           //width: MediaQuery.of(context).size.width,
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Text(

                              movies.originalTitle+"\n"+ "("+movies.date.toString()+")",
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            //SizedBox(width: 15),
                          ],
                        ),
                        SizedBox(height: 15),
                        Text(
                          movies.synopsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 15),
                        /*Text(

                          movies.adult.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),*/


                      ],
                    ),

                  );
                }

            );
            /*return SingleChildScrollView(
              child: Column(
                children: [
                  MovieDetailHeader(movies),
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: StoryLine(movies.synopsis),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20.0,
                      bottom: 50.0,
                    ),
                    child: ProductionCompaniesScroller(
                        movies.productionCompanies),
                  ),
                ],
              ),
            );*/
          }
        },
      ),
    );
  }

  // Method to get now playing movies from the backend
  Future<MovieDetail> getMovieDetail(id) async {
    final String nowPlaying = 'https://api.themoviedb.org/3/movie/' +
        id.toString() +
        '?api_key=70242251c4047938bf574587e8bf585e' +
        '&language=' +
        lenguaje;

    var httpClient = HttpClient();
    final response = await http.get(Uri.parse(nowPlaying));
    final responseJson = json.decode(response.body);

//      var request = await httpClient.getUrl(Uri.parse(nowPlaying));
//      var response = await request.close();
//        var jsonResponse = await responseJson .transform(utf8.decoder).join();
    // Decode the json response
//        var data = jsonDecode(jsonResponse);
    // Get the Movie list
    MovieDetail movieDetail = createDetailList(responseJson);
    // Print the results.
    return movieDetail;
  }

  MovieDetail createDetailList(data) {
    List<String> genresList = [];
    List<ProductionCompanies> productionCompaniesList = [];

    var id = data["id"];
    var adult = data["adult"];
    var title = data["title"];
    var date = data["release_date"];
    var productionCompany = data["production_companies"];
    for (int i = 0; i < productionCompany.length; i++) {
      var id = productionCompany[i]["id"];
      String name = productionCompany[i]["name"];
      String logoPath = productionCompany[i]["logo_path"];
      ProductionCompanies productionCompanies =
      ProductionCompanies(id, name, logoPath);
      productionCompaniesList.add(productionCompanies);
    }
    var genres = data["genres"];
    for (int i = 0; i < genres.length; i++) {
      String name = genres[i]["name"];
      genresList.add(name);
    }
    var overview = data["overview"];
    var posterPath = data["poster_path"];
    var backdropPath = data["backdrop_path"];
    var voteAverage = data["vote_average"];
    MovieDetail detail = MovieDetail(id, title, genresList, overview,
        posterPath, backdropPath, voteAverage, productionCompaniesList, date,adult);
    return detail;
  }
}

class MovieDetail {
  var id;
  final String originalTitle;
  final List<String> genres;
  final String synopsis;
  final String posterPath;
  final String backdropPath;
  double voteAverage;
  final List<ProductionCompanies> productionCompanies;
  final String date;
  final bool adult;

  MovieDetail(
      this.id,
      this.originalTitle,
      this.genres,
      this.synopsis,
      this.posterPath,
      this.backdropPath,
      this.voteAverage,
      this.productionCompanies,
      this.date,
      this.adult);
}
class Genres {
  var id;
  final String name;

  Genres(this.id, this.name);
}

class ProductionCompanies {
  var id;
  final String name;
  final String logoPath;

  ProductionCompanies(this.id, this.name, this.logoPath);
}








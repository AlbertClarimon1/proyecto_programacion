
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieDetailsPage extends StatelessWidget {
  MovieDetailsPage(this.id);

  var id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<MovieDetail>(
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            print("Result $snapshot");
            return Container(
              // Shows progress indicator until the data is load.
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          } else {
            MovieDetail? movies = snapshot.data;
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20.0,
                      bottom: 50.0,
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  // Method to get now playing movies from the backend

  MovieDetail createDetailList(data) {
    List<String> genresList = [];
    List<ProductionCompanies> productionCompaniesList = [];

    var id = data["id"];
    var title = data["original_title"];
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
        posterPath, backdropPath, voteAverage, productionCompaniesList);
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

  MovieDetail(
      this.id,
      this.originalTitle,
      this.genres,
      this.synopsis,
      this.posterPath,
      this.backdropPath,
      this.voteAverage,
      this.productionCompanies);
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

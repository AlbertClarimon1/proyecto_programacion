import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:whatchlist/services/MovieDetailsPage.dart';
import 'package:whatchlist/services/auth.dart';
import 'package:whatchlist/views/home.dart';
import 'package:whatchlist/widget/textField.dart';
import 'package:http/http.dart' as http;

class Search extends StatefulWidget{


  const Search({Key? key}) : super(key: key);
  State<Search> createState() => SearchMovie();
}

textToApi(TextEditingController movie, BuildContext context) async {
  final String nowPlaying = 'https://api.themoviedb.org/3/search/movie?api_key=70242251c4047938bf574587e8bf585e&query=' + movie.text.trim().toLowerCase();
  var httpClient = HttpClient();
  final response = await http.get(Uri.parse(nowPlaying));
  final responseJson = json.decode(response.body);
  var id = responseJson["results"][0]["id"];
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (_) => MovieDetailsPage(id)),
  );
}

 createDetailList(data) {
  //List<String> genresList = [];
  //List<ProductionCompanies> productionCompaniesList = [];
  }

class SearchMovie extends State<Search>{
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 10),
                TextFiel(title: "Buscar pelicula", width: 1.0, controller: nameController, obscureText: false, context: context,color: Colors.white),
                IconButton(onPressed: ()=>  textToApi(nameController, context), icon: Icon(Icons.search), color: Colors.white,),
              ],
            ),
            SizedBox(height: 20),
            popularmoviesicon("Mas populares", "https://api.themoviedb.org/3/movie/popular?api_key=70242251c4047938bf574587e8bf585e&language"+lenguaje, context,Axis.horizontal),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:whatchlist/services/auth.dart';
import 'package:whatchlist/views/home.dart';
import 'package:whatchlist/widget/textField.dart';

class Search extends StatefulWidget{


  const Search({Key? key}) : super(key: key);
  State<Search> createState() => SearchMovie();
}

textToApi(){

}

class SearchMovie extends State<Search>{
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 10),
                TextFiel(title: "Buscar pelicula", width: 1.0, controller: nameController, obscureText: false, context: context,color: Colors.white),
                IconButton(onPressed: textToApi, icon: Icon(Icons.search), color: Colors.white,),
                //Tex("Pon tu contraseña", 1.0,passwordController,true),
              ],
            ),
            SizedBox(height: 20),
            popularmoviesicon("Mas populares", "https://api.themoviedb.org/3/movie/popular?api_key=70242251c4047938bf574587e8bf585e&language"+lenguaje, context),
          ],
        ),
      ),
    );
  }
}
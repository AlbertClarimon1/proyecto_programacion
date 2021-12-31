import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatchlist/services/auth.dart';
import 'package:whatchlist/widget/appBar.dart';
import 'package:whatchlist/widget/bottom%20bar.dart';

class Nuevo extends StatefulWidget {

  const Nuevo({Key? key}) : super(key: key);
  State<Nuevo> createState() => NuevoPage();
}

class NuevoPage extends State<Nuevo>{
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
                      popularmoviesicon("Estrenos", "https://api.themoviedb.org/3/discover/movie?sort_by=release_date.desc&api_key=70242251c4047938bf574587e8bf585e&page=100", context,Axis.vertical),

                    ]
                ),
              );
            }
        ),
      ),
    );
  }
}
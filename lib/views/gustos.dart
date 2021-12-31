import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatchlist/services/auth.dart';
import 'package:whatchlist/views/home.dart';
import 'package:whatchlist/widget/appBar.dart';
import 'package:whatchlist/widget/bottom%20bar.dart';
import 'package:country_icons/country_icons.dart';
import 'package:flag/flag.dart';


class Gustos extends StatefulWidget {

  const Gustos({Key? key}) : super(key: key);
  State<Gustos> createState() => Likes();
}

class Likes extends State<Gustos> {
  Color colorbox = Colors.white;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Column(
          children: [
            Text(
              "Gustos",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            //Image.asset("icons/flags/png/"+lenguaje+".png", package: 'country_icons'),
            //Image.asset('icons/flags/png/es.png', package: 'country_icons'),
          ],
        ),
        bottom: PreferredSize(
          child: Container(
            color: Colors.grey.withOpacity(0.5),
            height: 1.0,
          ),
          preferredSize: Size.fromHeight(1.0),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: countries.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      genresTypes(context),
                      //Text("data"),
                    ]
                ),
              );
            }
        ),
      ),
    );
  }

}
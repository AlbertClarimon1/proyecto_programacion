import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatchlist/views/home.dart';


class Countries extends StatefulWidget {

  const Countries({Key? key}) : super(key: key);
  State<Countries> createState() => Country();
}

class Country extends State<Countries> {
  Color colorbox = Colors.white;
  changeIdiom(String countries) async {
    await FirebaseFirestore.instance.collection("users").doc(user!.uid).update({
      'idiom':countries,
    });
    await FirebaseFirestore.instance.collection("users").doc(user!.uid).get().then((resultado){
      setState(() {
        lenguaje = resultado['idiom'];
      });
      similar_movie = resultado['similar_movie'].toString();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Column(
          children: [
            Text(
              "Pais",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Text(
              "<"+lenguaje+">",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
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
                    children: [
                      Row(
                        children: [
                          SizedBox(height: 40),
                          IconButton(onPressed: ()=> changeIdiom(countries[index]), icon: Icon(Icons.flag), color: Colors.white, iconSize: 40),
                          SizedBox(width: 10),
                          Text(
                            countries[index],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      )
                    ]
                ),
              );
            }
        ),
      ),
    );
  }
}


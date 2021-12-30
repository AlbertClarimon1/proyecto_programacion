import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatchlist/widget/appBar.dart';

class Nuevo extends StatefulWidget {

  const Nuevo({Key? key}) : super(key: key);
  State<Nuevo> createState() => NuevoPage();
}

class NuevoPage extends State<Nuevo>{
  int _selectedIndex = 0;

  void login(){
    setState(() {
      Navigator.pushNamed(context, '/');
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBar2(context),

      body: SafeArea(
        child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: 1,
            itemBuilder: (BuildContext context, int index){
              return Container(
                child: Column(
                    children: [
                      Text("data")
                    ]
                ),
              );
            }
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Inicio',

          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.access_time,
            ),
            label: 'Nuevo',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
            ),
            label: 'Popular',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.local_movies_rounded,
            ),
            label: 'Watchlist',
          ),

        ],
        unselectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),

    );
  }





}
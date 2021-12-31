import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Watchlist extends StatefulWidget {

  const Watchlist({Key? key}) : super(key: key);
  State<Watchlist> createState() => WatchlistPage();
}

class WatchlistPage extends State<Watchlist> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Configuraciones",
          style: TextStyle(
            color: Colors.white,
          ),
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
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(height: 150),
                          IconButton(onPressed: ()=>Navigator.pushNamed(context, '/countries'), icon: Icon(Icons.room), color: Colors.white, iconSize: 40),
                          Text(
                            "País",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(height: 150),
                          IconButton(onPressed: ()=>Navigator.pushNamed(context, '/preferences'), icon: Icon(Icons.room_preferences), color: Colors.white, iconSize: 40),
                          Text(
                            "Preferencias",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(height: 150),
                          IconButton(onPressed: ()=>Navigator.pushNamed(context, '/'), icon: Icon(Icons.logout), color: Colors.white, iconSize: 40),
                          Text(
                            "Logout",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
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

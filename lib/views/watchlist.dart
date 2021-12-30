import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatchlist/widget/appBar.dart';
import 'package:whatchlist/widget/bottom%20bar.dart';

class Watchlist extends StatefulWidget {

  const Watchlist({Key? key}) : super(key: key);
  State<Watchlist> createState() => WatchlistPage();
}

class WatchlistPage extends State<Watchlist> {

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
            itemBuilder: (BuildContext context, int index) {
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
    );
  }
}

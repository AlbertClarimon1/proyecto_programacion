import 'package:flutter/material.dart';


appBar2(BuildContext context){
  return AppBar(
    backgroundColor: Colors.black,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          "assets/logo.png",
          fit: BoxFit.contain,
          height: 100,
        ),
        Container(
          child: Row(
            children: [
              IconButton(onPressed: ()=>Navigator.pushNamed(context, '/search'), icon: Icon(Icons.search)),
              IconButton(onPressed: ()=>Navigator.pushNamed(context, '/watchlist'), icon: Icon(Icons.menu)),
            ],
          ),
        )
      ],
    ),
    automaticallyImplyLeading: false,
  );
}
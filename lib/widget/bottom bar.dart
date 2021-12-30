

import 'package:flutter/material.dart';

bottomBar(BuildContext context){
  return BottomAppBar(
    color: Colors.black,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed: ()=>Navigator.pushNamed(context, '/home'), icon: Icon(Icons.home), color: Colors.white),
        IconButton(onPressed: ()=>Navigator.pushNamed(context, '/new'), icon: Icon(Icons.access_time),color: Colors.white),
        IconButton(onPressed: ()=>Navigator.pushNamed(context, '/search'), icon: Icon(Icons.star),color: Colors.white),
        IconButton(onPressed: ()=>Navigator.pushNamed(context, '/search'), icon: Icon(Icons.local_movies_rounded), color: Colors.white),
      ],
    ),

  );
}



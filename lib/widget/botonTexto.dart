import 'package:flutter/material.dart';

class botonTexto extends StatelessWidget{

  final String title;
  final Function() onTap;

  botonTexto({ required this.title, required this.onTap});

  @override
  Widget build(BuildContext context){
    return Container(
        child: TextButton(
            style: TextButton.styleFrom(
                primary: Colors.black,
                textStyle: const TextStyle(fontSize: 12)
            ),
            onPressed: onTap,
            child:
            Text(title)
        )
    );
  }
}
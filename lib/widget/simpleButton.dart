import 'package:flutter/material.dart';

class SimpleButtom extends StatelessWidget{

  final Color color;
  final String title;
  final double width;
  final double height;
  final Function() onTap;
  final double textSize;
  final Color borderColor;

  SimpleButtom({ required this.title, required this.width,  required this.height, required this.onTap, required this.color, required this.textSize, required this.borderColor});

  @override
  Widget build(BuildContext context){
    return Container(

      width: (MediaQuery.of(context).size.width)/width,
      height: (MediaQuery.of(context).size.width)/height,
      child: RaisedButton(
        child: Text(
          title,
          style: TextStyle(
              color: Colors.black,
              fontSize: textSize,
              fontWeight: FontWeight.w500),
        ),
        onPressed: onTap,
        color: color,
        splashColor: color.withOpacity(0),
        shape:  RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(color: borderColor)
        ),
      ),
    );
  }
}
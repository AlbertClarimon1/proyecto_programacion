
import 'package:flutter/material.dart';


class TextFiel extends StatelessWidget{

  final String title;
  final TextEditingController controller;
  final double width;
  final bool obscureText;
  final BuildContext context;
  final Color color;

  //IconButtom({ required this.title, required this.width,  required this.height, required this.onTap, required this.color, required this.textSize, this.iconData});

  TextFiel({required this.title, required this.width, required this.controller, required this.obscureText, required this.context, required this.color });


  @override
  Widget build(BuildContext context){
    return Container(
      width: (MediaQuery.of(context).size.width)/1.3,
      height: (MediaQuery.of(context).size.width)/10,
      child:TextField(
        controller: controller,
        style: TextStyle(
          color: color,
        ),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: color, width: width),
          ),
          //labelText: 'User Name',
          hintText: title,
        ),
        cursorColor: color,

        obscureText: obscureText,
      ),
    );
  }
}

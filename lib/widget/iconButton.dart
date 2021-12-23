import 'package:flutter/material.dart';

class IconButtom extends StatelessWidget{

  final Color color;
  final String title;
  final double width;
  final double height;
  final Function() onTap;
  final double textSize;
  final IconData? iconData;

  IconButtom({ required this.title, required this.width,  required this.height, required this.onTap, required this.color, required this.textSize, this.iconData});

  @override
  Widget build(BuildContext context){
    return Container(

      width: (MediaQuery.of(context).size.width)/width,
      height: (MediaQuery.of(context).size.width)/height,
      child: RaisedButton(
        child: Row(
          children: [
            CircleAvatar(
              maxRadius: 20,
              child: Icon(iconData, color: Colors.black,),
              backgroundColor: Colors.white,
            ),


            SizedBox(width: 20),
            Text(
              title,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: textSize,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        onPressed: onTap,
        color: color,
        splashColor: color.withOpacity(0),
        shape:  RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
        ),
      ),
    );
  }
}
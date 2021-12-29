import 'package:flutter/material.dart';


class Search extends StatefulWidget{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _TextLabel("Pon tu contraseña", 1.0,passwordController,true),
          ],
        ),
      ),
    );
  }

}
import 'package:flutter/material.dart';
import 'package:whatchlist/widget/iconButton.dart';


class FirstScreen extends StatefulWidget {

  const FirstScreen({Key? key}) : super(key: key);
  State<FirstScreen> createState() => StartPage();
}

class StartPage extends State<FirstScreen>{

  void login(){
    setState(() {
      Navigator.pushNamed(context, '/login');
    });
  }

  void crearCuenta(){
    setState(() {
      Navigator.pushNamed(context, '/register');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                height: (MediaQuery.of(context).size.height)/1.5,
                width: (MediaQuery.of(context).size.width),
                child: Stack(
                  overflow: Overflow.visible,
                  children: [
                    Image.asset(
                      'assets/Start_Image.png',
                      width: (MediaQuery.of(context).size.width),
                    ),
                    Positioned(
                      bottom: (MediaQuery.of(context).size.height)-(MediaQuery.of(context).size.width)*2.2,
                      left: (MediaQuery.of(context).size.width)/16,
                      right: (MediaQuery.of(context).size.width)/16,
                      child:Container(
                        width: (MediaQuery.of(context).size.width),
                        height: (MediaQuery.of(context).size.width),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2.5,
                                blurRadius: 1,
                                offset: Offset(0, 5), // changes position of shadow
                              ),
                            ],
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                SizedBox(height: 20),
                                IconButtom(title: "Iniciar sesión", width: 1.3, height: 5, onTap: login, color: Color.fromRGBO(169, 169, 169, 1), textSize: 20, iconData: Icons.person,),
                                SizedBox(height: 20),
                                IconButtom(title: "Registrarse", width: 1.3, height: 3, onTap: crearCuenta, color: Color.fromRGBO(169, 169, 169, 1), textSize: 20, iconData: Icons.person,)

                              ],
                            ),
                          )
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}



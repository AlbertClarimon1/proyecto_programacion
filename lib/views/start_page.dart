import 'package:flutter/material.dart';
import 'package:whatchlist/views/login_view.dart';




class FirstScreen extends StatefulWidget {

  const FirstScreen({Key? key}) : super(key: key);
  State<FirstScreen> createState() => HomePage();
  //HomePage createState()=> HomePage();
}

class HomePage extends State<FirstScreen>{


  void login(){
    setState(() {
      Navigator.pushNamed(context, '/second');
      print("hola");
    });

  }

  void crearCuenta(){
        (context) => const FirstScreen();
  }

  @override
  _buttomIcon(String title, double width, double height, Function() onTap, Color color, double textSize, {IconData? iconData}){
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(

        //alignment: Alignment.topCenter,
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
                      //fit: BoxFit.contain,
                    ),
                    // SizedBox(height: 0),
                    Positioned(
                      bottom: (MediaQuery.of(context).size.width)/1.4-(MediaQuery.of(context).size.height-(MediaQuery.of(context).size.width+100)),
                      left: (MediaQuery.of(context).size.width)/16,
                      right: (MediaQuery.of(context).size.width)/16,
                      child:Container(
                        width: (MediaQuery.of(context).size.width),
                        height: (MediaQuery.of(context).size.height-(MediaQuery.of(context).size.width+100)),
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

                          child: Column(
                            children: [
                              SizedBox(height: 20),
                              _buttomIcon("Iniciar sesión", 1.3, 5,login, Color.fromRGBO(169, 169, 169, 1), 20, iconData: Icons.person),
                              SizedBox(height: 20),
                              _buttomIcon("Crear una cuenta", 1.3, 3, crearCuenta, Color.fromRGBO(169, 169, 169, 1), 20, iconData: Icons.person),

                            ],
                          ),
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



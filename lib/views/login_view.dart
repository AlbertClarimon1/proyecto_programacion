import 'package:flutter/material.dart';
import 'package:whatchlist/widget/simpleButton.dart';


class LoginView extends StatefulWidget {

  const LoginView({Key? key}) : super(key: key);
  State<LoginView> createState() => Login();
//HomePage createState()=> HomePage();
}

class Login extends State<LoginView>  {
  TextEditingController nameController = TextEditingController();
  void login(){
    setState(() {
      Navigator.pushNamed(context, '/');
      print("hola");
    });

  }

  void crearCuenta(){
       // (context) => const FirstScreen();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(

          //alignment: Alignment.topCenter,
          child: ListView(
              //crossAxisAlignment: CrossAxisAlignment.end,
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: (MediaQuery.of(context).size.height)/1.5,
                  width: (MediaQuery.of(context).size.width),
                  child: Stack(
                    overflow: Overflow.visible,
                    children: [
                      Image.asset(
                        'assets/login_image.png',
                        width: (MediaQuery.of(context).size.width),
                        //fit: BoxFit.contain,
                      ),
                      // SizedBox(height: 0),
                      Positioned(
                        bottom: (MediaQuery.of(context).size.width)/2.2-(MediaQuery.of(context).size.height-(MediaQuery.of(context).size.width+100)),
                        left: (MediaQuery.of(context).size.width)/16,
                        right: (MediaQuery.of(context).size.width)/16,
                        child:Container(
                          width: (MediaQuery.of(context).size.width),
                          height: (MediaQuery.of(context).size.height-(MediaQuery.of(context).size.width)),
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
                                SimpleButtom(title: "Continuar con facebook", width: 1.3, height: 10, onTap: login, color: Colors.white, textSize: 15, borderColor: Colors.black),
                                SizedBox(height: 5),
                                SimpleButtom(title: "Continuar con google", width: 1.3, height: 10, onTap: login, color: Colors.white, textSize: 15, borderColor: Colors.black),
                                SizedBox(height: 25),
                                Text(
                                  "o",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(height: 25),
                                Container(
                                  width: (MediaQuery.of(context).size.width)/1.3,
                                  height: (MediaQuery.of(context).size.width)/10,
                                  child:TextField(
                                    controller: nameController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      //labelText: 'User Name',
                                      hintText: 'Enter Your Name',
                                    ),
                                  ),
                                ),
                                SizedBox(height: 15),
                                Container(
                                  width: (MediaQuery.of(context).size.width)/1.3,
                                  height: (MediaQuery.of(context).size.width)/10,
                                  child:TextField(
                                    controller: nameController,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(color: Colors.black, width: 1.0),

                                      ),
                                      //labelText: 'User Name',
                                      hintText: 'Enter your email',
                                    ),
                                  ),
                                ),

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



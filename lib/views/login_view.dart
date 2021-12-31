import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:whatchlist/views/home.dart';
import 'package:whatchlist/widget/simpleButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:whatchlist/widget/textField.dart';


class LoginView extends StatefulWidget {

  const LoginView({Key? key}) : super(key: key);
  State<LoginView> createState() => Login();
}

class Login extends State<LoginView>  {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<bool> signInWithEmail( email, password) =>
      _signInWithEmail(email, password);


  Future<bool> _signInWithEmail( TextEditingController email,
      TextEditingController password) async {
    try {

      setState(() async {
        UserCredential result = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
            email: email.text.trim().toLowerCase(), password: password.text);
        print('Signed in: ${result.user!.uid}');
        user = FirebaseAuth.instance.currentUser;
        await FirebaseFirestore.instance.collection("users").doc(user!.uid).get().then((resultado){
          lenguaje = resultado['idiom'];
          gustos = resultado['gustos'];
          similar_movie = resultado['similar_movie'].toString();
          nombreGustos = resultado['nombreGustos'];
        });
        Navigator.pushNamed(context, '/home');

      });
      return true;
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  void facebook(){
    setState(() {
      //Navigator.pushNamed(context, '/');
    });

  }

  void google(){
    setState(() {
     // Navigator.pushNamed(context, '/');
    });

  }

  void home(){
    setState(() {
      Navigator.pushNamed(context, '/home');
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: ListView(
              children: [
                Container(
                  height: (MediaQuery.of(context).size.height),
                  width: (MediaQuery.of(context).size.width),
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/login_image.png',
                        width: (MediaQuery.of(context).size.width),
                      ),
                      Positioned(
                        bottom: (MediaQuery.of(context).size.width)-(MediaQuery.of(context).size.height-(MediaQuery.of(context).size.width+100)),
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
                                  offset: Offset(0,5), // changes position of shadow
                                ),
                              ],
                            ),

                            child: Column(
                              children: [
                                SizedBox(height: 20),
                                SimpleButtom(title: "Continuar con facebook", width: 1.3, height: 10, onTap: facebook, color: Colors.white, textSize: 15, borderColor: Colors.black, borderwidth: 1),
                                SizedBox(height: 5),
                                SimpleButtom(title: "Continuar con google", width: 1.3, height: 10, onTap: google, color: Colors.white, textSize: 15, borderColor: Colors.black, borderwidth: 1),
                                SizedBox(height: 25),
                                Text(
                                  "o",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(height: 25),
                                TextFiel(title: "Pon tu email", width: 1.0, controller: nameController, obscureText: false, context: context, color: Colors.black),
                                SizedBox(height: 15),
                                TextFiel(title: "Pon tu contraseña", width: 1.0, controller: passwordController, obscureText: true, context: context, color: Colors.black),
                                SizedBox(height: 25),
                                SimpleButtom(title: "Continuar", width: 1.3, height: 10, onTap: ()=> signInWithEmail(nameController, passwordController), color: Color.fromRGBO(255, 199, 0 , 1), textSize: 15, borderColor: Colors.black, borderwidth: 0),

                              ],
                            ),
                          ),
                        ),
                      ),
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



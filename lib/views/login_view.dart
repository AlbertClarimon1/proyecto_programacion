import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:whatchlist/views/home.dart';
import 'package:whatchlist/widget/simpleButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:whatchlist/widget/textField.dart';


class LoginView extends StatefulWidget {

  const LoginView({Key? key}) : super(key: key);
  State<LoginView> createState() => Login();
//HomePage createState()=> HomePage();
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




  /*@override
  _TextLabel(String title, double width, TextEditingController controller, bool _obscureText ){
    return Container(
      width: (MediaQuery.of(context).size.width)/1.3,
      height: (MediaQuery.of(context).size.width)/10,
      child:TextField(
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: width),
          ),
          //labelText: 'User Name',
          hintText: title,

        ),
        obscureText: _obscureText,
      ),
    );
  }*/

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
                  height: (MediaQuery.of(context).size.height+22)/1.1,
                  width: (MediaQuery.of(context).size.width),
                  child: Stack(
                    //overflow: Overflow.visible,
                    children: [
                      Image.asset(
                        'assets/login_image.png',
                        width: (MediaQuery.of(context).size.width),
                        //fit: BoxFit.contain,
                      ),
                      // SizedBox(height: 0),
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
                                /*Container(
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
                                ),*/

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



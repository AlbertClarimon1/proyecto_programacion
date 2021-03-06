import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:whatchlist/services/auth.dart';
import 'package:whatchlist/views/home.dart';
import 'package:whatchlist/widget/botonTexto.dart';
import 'package:whatchlist/widget/simpleButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:whatchlist/widget/textField.dart';

class RegisterView extends StatefulWidget {

  const RegisterView({Key? key}) : super(key: key);
  State<RegisterView> createState() => Register();
}

class Register extends State<RegisterView>  {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repitpasswordController = TextEditingController();
  TextEditingController idioma = TextEditingController();

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool accept = false;
  bool age = false;
  Color colorbox = Colors.black;


  void signUpWithEmailAndPassword(email, password) =>
      _signUpWithEmailAndPassword(email, password);

  Future<bool> _signUpWithEmailAndPassword(TextEditingController email,
      TextEditingController password) async {
    try {
      if (accept){

        setState(() async {
          UserCredential result = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
              email: email.text.trim().toLowerCase(), password: password.text);
          print('Signed up: ${result.user!.uid}');
          Navigator.pushNamed(context, '/home');
          user = FirebaseAuth.instance.currentUser;
          
          await FirebaseFirestore.instance.collection("users").doc(user!.uid).set({
            'uid' : user?.uid,
            'email': user?.email,
            'idiom': "en",
            'similar_movie': "550",
            'gustos':gustos,
            'nombreGustos':nombreGustos,
          });
        });
      }else{
        setState(() {
          colorbox = Colors.red;
        });

      }
      return true;
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }



  void signInwithGoogle()=>_signInwithGoogle();

  Future<String?> _signInwithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
      await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }
  Future<void> signOutFromGoogle() async{
    await _googleSignIn.signOut();
    await _auth.signOut();
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

  void login(){
    setState(() {
       Navigator.pushNamed(context, '/login');
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
                        'assets/register.png',
                        width: (MediaQuery.of(context).size.width),
                      ),
                      Positioned(
                        bottom: (MediaQuery.of(context).size.width)-(MediaQuery.of(context).size.height)/2.5,
                        left: (MediaQuery.of(context).size.width)/16,
                        right: (MediaQuery.of(context).size.width)/16,
                        child:Container(
                          width: (MediaQuery.of(context).size.width),
                          height: (MediaQuery.of(context).size.height-(MediaQuery.of(context).size.width)+100),
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

                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(height: 15),
                                  SimpleButtom(title: "Continuar con facebook", width: 1.3, height: 10, onTap: facebook, color: Colors.white, textSize: 15, borderColor: Colors.black, borderwidth: 1),
                                  SizedBox(height: 5),
                                  SimpleButtom(title: "Continuar con google", width: 1.3, height: 10, onTap: signInwithGoogle, color: Colors.white, textSize: 15, borderColor: Colors.black, borderwidth: 1),
                                  SizedBox(height: 17),
                                  Text(
                                    "o",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(height: 17),
                                  TextFiel(title: "Pon tu email", width: 1.0, controller: nameController, obscureText: false, context: context, color: Colors.black),
                                  SizedBox(height: 10),
                                  TextFiel(title: "Pon tu contrase??a", width: 1.0, controller: passwordController, obscureText: false, context: context, color: Colors.black),
                                  SizedBox(height: 10),
                                  TextFiel(title: "Repite tu contrase??a", width: 1.0, controller: repitpasswordController, obscureText: false, context: context, color: Colors.black),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      SizedBox(width: 40),
                                      Theme(
                                        data: ThemeData(unselectedWidgetColor: colorbox),
                                        child: Checkbox(
                                            value: accept,
                                            activeColor: Color.fromRGBO(255, 199, 0, 1),
                                            onChanged: (bool? value){
                                              setState(() {
                                                accept = value!;
                                              });
                                            }
                                        ),
                                      ),


                                      Text(
                                        "Accepto las pol??ticas de privacidad",
                                        style: TextStyle(
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 10),
                                  Row(
                                    children: [
                                      SizedBox(width: 40),
                                      Theme(
                                        data: ThemeData(unselectedWidgetColor: Colors.black),
                                        child: Checkbox(
                                            value: age,
                                            activeColor: Color.fromRGBO(255, 199, 0, 1),
                                            onChanged: (bool? value){
                                              setState(() {
                                                age = value!;
                                              });
                                            }
                                        ),
                                      ),

                                      Text(
                                        "Soy mayor de 18 a??os",
                                        style: TextStyle(
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  SimpleButtom(title: "Continuar", width: 1.3, height: 10, onTap: ()=> signUpWithEmailAndPassword(nameController, passwordController), color: Color.fromRGBO(255, 199, 0 , 1), textSize: 15, borderColor: Colors.black, borderwidth: 0),
                                  botonTexto(title: "??Ya tienes cuenta? Inicia sesi??n", onTap: login)
                                ],
                              ),
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

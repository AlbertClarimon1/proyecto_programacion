import 'package:flutter/material.dart';
import 'package:whatchlist/widget/simpleButton.dart';


class RegisterView extends StatefulWidget {

  const RegisterView({Key? key}) : super(key: key);
  State<RegisterView> createState() => Register();
//HomePage createState()=> HomePage();
}

class Register extends State<RegisterView>  {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repitpasswordController = TextEditingController();
  bool accept = false;
  bool age = false;
  Color colorbox = Colors.black;

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
    if (accept){
      setState(() {
        Navigator.pushNamed(context, '/home');
      });
    }else{
      setState(() {
        colorbox = Colors.red;
      });

    }

  }




  @override
  _TextLabel(String title, double width, TextEditingController controller ){
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
                        'assets/register.png',
                        width: (MediaQuery.of(context).size.width),
                        //fit: BoxFit.contain,
                      ),
                      // SizedBox(height: 0),
                      Positioned(
                        bottom: (MediaQuery.of(context).size.width)-(MediaQuery.of(context).size.height-(MediaQuery.of(context).size.width+20)),
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

                            child: Column(
                              children: [
                                SizedBox(height: 15),
                                SimpleButtom(title: "Continuar con facebook", width: 1.3, height: 10, onTap: facebook, color: Colors.white, textSize: 15, borderColor: Colors.black, borderwidth: 1),
                                SizedBox(height: 5),
                                SimpleButtom(title: "Continuar con google", width: 1.3, height: 10, onTap: google, color: Colors.white, textSize: 15, borderColor: Colors.black, borderwidth: 1),
                                SizedBox(height: 17),
                                Text(
                                  "o",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(height: 17),
                                _TextLabel("Pon tu email", 1.0, nameController),
                                SizedBox(height: 10),
                                _TextLabel("Pon tu contraseña", 1.0,passwordController ),
                                SizedBox(height: 10),
                                _TextLabel("Repite tu contraseña", 1.0,repitpasswordController ),
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
                                      "Accepto las políticas de privacidad",
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
                                      "Soy mayor de 18 años",
                                      style: TextStyle(
                                        fontSize: 13,
                                      ),

                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                SimpleButtom(title: "Continuar", width: 1.3, height: 10, onTap: home, color: Color.fromRGBO(255, 199, 0 , 1), textSize: 15, borderColor: Colors.black, borderwidth: 0),
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

import 'package:flutter/material.dart';
import 'package:whatchlist/widget/simpleButton.dart';


class LoginView extends StatefulWidget {

  const LoginView({Key? key}) : super(key: key);
  State<LoginView> createState() => Login();
//HomePage createState()=> HomePage();
}

class Login extends State<LoginView>  {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                                _TextLabel("Pon tu nombre", 1.0, nameController),
                                SizedBox(height: 15),
                                _TextLabel("Pon tu Email", 1.0,passwordController ),
                                SizedBox(height: 25),
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



import 'package:flutter/material.dart';




class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _buttomIcon(String title, double width, double height, Function() onTap, Color color, double textSize, BuildContext context, {IconData? iconData}){
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
              Stack(
                overflow: Overflow.visible,
                children: [
                  Image.asset(
                    'assets/Start_Image.png',
                    width: (MediaQuery.of(context).size.width),
                    //fit: BoxFit.contain,
                  ),
                  //SizedBox(height: 200),
                  Positioned(
                    bottom: (MediaQuery.of(context).size.width)/15-(MediaQuery.of(context).size.height-(MediaQuery.of(context).size.width+100)),
                    left: (MediaQuery.of(context).size.width)/16,
                    right: (MediaQuery.of(context).size.width)/16,
                    child: Container(
                      width: (MediaQuery.of(context).size.width),
                      height: (MediaQuery.of(context).size.height-(MediaQuery.of(context).size.width+100)),
                      child: Container(
                        decoration: new BoxDecoration(
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
                            _buttomIcon("Iniciar sesión", 1.3, 5, () => null, Color.fromRGBO(169, 169, 169, 1), 20, context, iconData: Icons.person),
                            SizedBox(height: 20),
                            _buttomIcon("Crear una cuenta", 1.3, 3, () => null, Color.fromRGBO(169, 169, 169, 1), 20, context, iconData: Icons.person),

                            /*Padding(
                              padding: EdgeInsets.all(32.0),
                              child: Container(
                                width: 40,
                                height: 40,
                                child: Container(
                                  decoration: new BoxDecoration(
                                    color: Colors.blue,
                                    shape: BoxShape.rectangle,
                                  ),
                                ),
                              ),
                            ),*/

                          ],
                        ),
                      ),
                    ),
                    /*child: CircleAvatar(
                      maxRadius: 30,
                      child: Icon(Icons.star, color: Colors.white,),
                      backgroundColor: Colors.pinkAccent,
                    ),*/
                  ),
                 /* Padding(
                    padding: EdgeInsets.all(32.0),
                    child: Container(
                      width: (MediaQuery.of(context).size.width),
                      height: 60,
                      child: Container(
                        decoration: new BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.rectangle,
                        ),
                      ),
                    ),
                  )*/
                ],
              )

            ]
          ),
        ),
      ),
      /*body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to the second screen when tapped.
          },
          child: const Text('Launch screen'),
        ),
      ),*/
    );
  }
}



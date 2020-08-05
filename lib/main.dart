import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dailynews/views/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark().copyWith(
      primaryColor: Color(0xFF0A0E21),
      scaffoldBackgroundColor: Color(0xFF0A0E21),
    ),
  ));
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    new Timer(const Duration(milliseconds: 5000), onClose);

  }
  void  onClose(){
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context)=>new Home(),
    ),);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: <Widget>[
          Container(
            child:Image(
        image: AssetImage('assets/images/bg.jpg'),
              height:MediaQuery.of(context).size.height ,
              width:MediaQuery.of(context).size.width ,
              fit: BoxFit.cover,
    ),),

          Container(
//            decoration: BoxDecoration(
//              gradient: LinearGradient(
//                  begin: Alignment.topRight,
//                  end: Alignment.bottomLeft,
//                  colors: [Colors.purpleAccent,Colors.orangeAccent,Colors.pinkAccent]
//              ),
//            ),
            alignment: Alignment.center,
            padding: EdgeInsets.only(top:150.0),
            child: Column(
              children: <Widget>[
                Text('Daily News',style: TextStyle(
                  fontFamily: "Signatra",
                  fontSize: 100.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 0.2,
                ),),
                SizedBox(
                  height: 13.0,
                ),

                Center(
                  child: FadeAnimatedTextKit(
                    duration: Duration(milliseconds:900),
                    totalRepeatCount: 1,
                    text: ['Simple..','Fast..','Easy..'],
                    textStyle: TextStyle(
                      fontFamily: "Signatra",
                      fontSize:90.0,
                      color: Colors.white70,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 0.2,

                    ),
                  ),

                ),
                SizedBox(
                  height: 26.0,
                ),
                ClipRRect(
                  borderRadius:BorderRadius.circular(15.0) ,
                  child: Image(
                    image: AssetImage('assets/images/newspaper.jpg'),
            height: 200.0,
            width: 200.0,
                ),
                ),],
            ),
          ),

        ],
      ),
    );
  }
}















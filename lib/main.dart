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
    // TODO: implement initState
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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.teal,Colors.purple]
          ),
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.only(top:150.0),
        child: Column(
          children: <Widget>[
            Text('Daily News',style: TextStyle(
              fontFamily: "Signatra",
              fontSize: 110.0,
              color: Colors.white,
              fontWeight: FontWeight.w300,
              letterSpacing: 0.2,
            ),),
            SizedBox(
              height: 10.0,
            ),

            Center(
                child: FadeAnimatedTextKit(
                duration: Duration(milliseconds:800),
                      totalRepeatCount: 1,
                      text: ['Simple..','Fast..','Easy..'],
                      textStyle: TextStyle(
                              fontFamily: "Signatra",
                              fontSize:100.0,
                              color: Colors.white70,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 0.2,

                            ),
                    ),

            ),
            SizedBox(
              height: 20.0,
            ),
            ClipRRect(
              borderRadius:BorderRadius.circular(15.0) ,
              child: Image(
                image: AssetImage('assets/images/newspaper.jpg'),
                height: 200.0,
                width: 200.0,
              ),
            ),

          ],
        ),
      ),
    );
  }
}



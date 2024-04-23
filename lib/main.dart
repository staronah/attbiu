import 'dart:async';
import 'package:flutter/material.dart';
import 'main1.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
          primarySwatch: Colors.blue),
      home: MyHomePage(),
    );

  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                MyHome2Page()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[600],
      child: Center(
        child: Text("",style: TextStyle(fontSize: 50, color: Colors.white,),
        ),
      ),
    );
  }
}



class MyHome2Page extends StatefulWidget {
  @override
  _MyHome2PageState createState() => _MyHome2PageState();
}
class _MyHome2PageState extends State<MyHome2Page> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                Main1()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF1F1E44),
      child: Center(
        heightFactor: 40,
        child: Container(
          color: Color(0xFF1F1E44),
          child:Image.asset(
            'assets/images/biulogo1.png',
            height: 200,
            width: 200,
          ),
        ),
      ),
    );
  }
}

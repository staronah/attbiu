import 'package:Sotonye/att/chapel/chapel.dart';
import 'package:Sotonye/att/log.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'att/aboutus.dart';
import 'att/cfi/chapel.dart';
import 'att/sunday/chapel.dart';
import 'login.dart';




class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF1F1E44),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(""),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Container(
                width: 46,
                height: 30,
                decoration: BoxDecoration(
                    color: Color(0xFF1F1E44),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Center(child: Text("2023.1")),
              ),
            )
          ],
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage('assets/images/biulogo1.png'),
                          fit: BoxFit.cover
                      )
                  ),

                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ContactUs()),
                      );},
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              colors: [
                                Colors.black.withOpacity(.4),
                                Colors.black.withOpacity(.2),
                              ]
                          )
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text("SLD-BIU", style: TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),),
                          SizedBox(height: 30,),
                          Container(
                            height: 50,
                            margin: EdgeInsets.symmetric(horizontal: 40),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white
                            ),
                            child: Center(child: Text("About Us", style: TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold),)),
                          ),
                          SizedBox(height: 30,),
                        ],
                      ),                ),
                  ),
                ),
                SizedBox(height: 20,),
                Expanded(
                    child: GridView.count(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      children: <Widget>[
                        Card(
                          color: Colors.transparent,
                          elevation: 0,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => CFI()),
                              );},
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: AssetImage('assets/images/2.jpg'),
                                      fit: BoxFit.cover
                                  )
                              ),
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 63),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white
                                ),
                                child: Center(child: Text("CFI Service", style: TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold),)),
                              ),
                            ),
                          ),
                        ),
                        Card(
                          color: Colors.transparent,
                          elevation: 0,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Chapel()),
                              );                        },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: AssetImage('assets/images/biulogo1.png'),
                                      fit: BoxFit.cover
                                  )
                              ),
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 63),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white
                                ),
                                child: Center(child: Text("Chapel Service", style: TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold),)),
                              ),
                            ),
                          ),
                        ),
                        Card(
                          color: Colors.transparent,
                          elevation: 0,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Login()),
                              );},
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: AssetImage('assets/images/biulogo1.png'),
                                      fit: BoxFit.cover
                                  )
                              ),
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 63),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white
                                ),
                                child: Center(child: Text("Cell", style: TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold),)),
                              ),
                            ),
                          ),
                        ),
                        Card(
                          color: Colors.transparent,
                          elevation: 0,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Sunday()),
                              );},
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: AssetImage('assets/images/biulogo1.png'),
                                      fit: BoxFit.cover
                                  )
                              ),
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 63),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white
                                ),
                                child: Center(child: Text("Sunday Service", style: TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold),)),
                              ),
                            ),
                          ),
                        ),
                        Card(
                          color: Colors.transparent,
                          elevation: 0,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => WebViewPages()),
                              );},
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: AssetImage('assets/images/biulogo1.png'),
                                      fit: BoxFit.cover
                                  )
                              ),
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 63),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white
                                ),
                                child: Center(child: Text("Logs", style: TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold),)),
                              ),
                            ),
                          ),
                        ),




                      ],
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

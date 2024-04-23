import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF455180),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("About Us"),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage('assets/images/vicaslogosmall.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ContactUs()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          colors: [
                            Colors.black.withOpacity(.4),
                            Colors.black.withOpacity(.2),
                          ],
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            "Sotonye",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Welcome to Sotonye - a digital experience crafted by Vicas Emporium, a leading technology company at the forefront of innovation and creativity.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "About Sotonye:",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Sotonye is more than just an app; it's a powerful tool designed to revolutionize attendance taking processes. We understand the importance of effortless and accurate attendance management in various settings, from classrooms to workplaces. Sotonye simplifies the attendance-taking process, making it efficient, reliable, and hassle-free. Our aim is to provide educators, administrators, and organizers with a seamless solution that saves time and enhances productivity.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 20),

                Card(
                  color: Colors.transparent,
                  elevation: 0,
                  child: Center(
                    child: CircleAvatar(
                      radius:70,
                      backgroundImage: AssetImage('assets/images/vicaslogosmall.png'),
                    ),
                  ),
                ),


                SizedBox(height: 40),
                Text(
                  "About Vicas Emporium:",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),

                Text(
                  "Vicas Emporium, the powerhouse behind Sotonye, is a tech company driven by a passion for excellence. Our mission is to provide our clients with productive and profitable solutions that are globally recognized and render services that adds value, promotes safety, and local capacity development as the driving business objective.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "Contact us at:",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "- Email: vicas.emporium@gmail.com",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "- Phone number: 08166068997",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),

                SizedBox(height: 50),

                Card(
                  color: Colors.transparent,
                  elevation: 0,
                  child: Center(
                    child: CircleAvatar(
                      radius:70,
                      backgroundImage: AssetImage('assets/images/md.png'),
                    ),
                  ),
                ),

                SizedBox(height: 20),


                Text(
                  "Meet our Chief Executive Officer (CEO):",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),

                Text(
                  "Lucky Onah (Star) - the guiding force at Vicas Emporium. With years of experience and a vision for the future, Star spearheads our mission to create outstanding apps. For any inquiries or assistance, feel free to reach out:",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "- Email: staronah@gmail.com",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "At Vicas Emporium, we're dedicated to shaping a brighter digital world, and Sotonye is a testament to that dedication. Thank you for being a part of our journey as we continue to innovate and create applications that truly matter to you.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:Sotonye/att/cell/agape/cell1/chapel.dart';
import 'package:Sotonye/att/cell/agape/cell3/chapel.dart';
import 'package:Sotonye/att/cell/agape/cell4/chapel.dart';
import 'package:Sotonye/att/cell/agape/cell5/chapel.dart';
import 'package:Sotonye/att/cell/cedar/cell1/chapel.dart';
import 'package:Sotonye/att/cell/cedar/cell2/chapel.dart';
import 'package:Sotonye/att/cell/cedar/cell3/chapel.dart';
import 'package:Sotonye/att/cell/cedar/cell5/chapel.dart';
import 'package:Sotonye/att/cell/macademia/cell2/chapel.dart';
import 'package:Sotonye/att/cell/macademia/cell3/chapel.dart';
import 'package:Sotonye/att/cell/macademia/cell4/chapel.dart';
import 'package:Sotonye/att/cell/macademia/cell5/chapel.dart';
import 'package:flutter/material.dart';

import 'att/cell/agape/cell2/chapel.dart';
import 'att/cell/cedar/cell4/chapel.dart';
import 'att/cell/macademia/cell1/chapel.dart';
import 'att/cell/rehoboth/cell1/chapel.dart';
import 'att/cell/rehoboth/cell2/chapel.dart';
import 'att/cell/rehoboth/cell3/chapel.dart';
import 'att/cell/rehoboth/cell4/chapel.dart';
import 'att/cell/rehoboth/cell5/chapel.dart';
import 'att/cell/shabach/cell1/chapel.dart';
import 'att/cell/shabach/cell2/chapel.dart';
import 'att/cell/shabach/cell3/chapel.dart';
import 'att/cell/shabach/cell4/chapel.dart';
import 'att/cell/shabach/cell5/chapel.dart';
import 'att/cell/shekinah/cell1/chapel.dart';
import 'att/cell/shekinah/cell2/chapel.dart';
import 'att/cell/shekinah/cell3/chapel.dart';
import 'att/cell/shekinah/cell4/chapel.dart';
import 'att/cell/shekinah/cell5/chapel.dart';


void main() => runApp(Login());

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
      debugShowCheckedModeBanner: false,
      routes: {

        '/agapec1': (context) => AgapeC1(),
        '/agapec2': (context) => AgapeC2(),
        '/agapec3': (context) => AgapeC3(),
        '/agapec4': (context) => AgapeC4(),
        '/agapec5': (context) => AgapeC5(),

        '/cedarc1': (context) => CedarC1(),
        '/cedarc2': (context) => CedarC2(),
        '/cedarc3': (context) => CedarC3(),
        '/cedarc4': (context) => CedarC4(),
        '/cedarc5': (context) => CedarC5(),

        '/macademiac1': (context) => MacedemiaC1(),
        '/macademiac2': (context) => MacedemiaC2(),
        '/macademiac3': (context) => MacedemiaC3(),
        '/macademiac4': (context) => MacedemiaC4(),
        '/macademiac5': (context) => MacedemiaC5(),


        '/rehobothc1': (context) => RehobothC1(),
        '/rehobothc2': (context) => RehobothC2(),
        '/rehobothc3': (context) => RehobothC3(),
        '/rehobothc4': (context) => RehobothC4(),
        '/rehobothc5': (context) => RehobothC5(),


        '/shabachc1': (context) => ShabachC1(),
        '/shabachc2': (context) => ShabachC2(),
        '/shabachc3': (context) => ShabachC3(),
        '/shabachc4': (context) => ShabachC4(),
        '/shabachc5': (context) => ShabachC5(),


        '/shekinahc1': (context) => ShekinahC1(),
        '/shekinahc2': (context) => ShekinahC2(),
        '/shekinahc3': (context) => ShekinahC3(),
        '/shekinahc4': (context) => ShekinahC4(),
        '/shekinahc5': (context) => ShekinahC5(),

      },
    );
  }
}

class InputPage extends StatelessWidget {
  final TextEditingController _codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/biulogo.png'), // Replace with your image asset path
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 110), // Added space above TextField
              TextField(
                controller: _codeController,
                style: TextStyle(color: Colors.white), // Set text color to white
                decoration: InputDecoration(
                  hintText: 'Enter code',
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String code = _codeController.text;
                  if (code == 'ATT6606') {
                    Navigator.pushNamed(context, '/att');
                  }
                  else if (code == 'DUES6606') { Navigator.pushNamed(context, '/dues6606'); }

                  ////////////////////////////////////////// agape

                  else if (code == 'agapec1') { Navigator.pushNamed(context, '/agapec1'); }
                  else if (code == 'agapec2') { Navigator.pushNamed(context, '/agapec2'); }
                  else if (code == 'agapec3') { Navigator.pushNamed(context, '/agapec3'); }
                  else if (code == 'agapec4') { Navigator.pushNamed(context, '/agapec4'); }
                  else if (code == 'agapec5') { Navigator.pushNamed(context, '/agapec5'); }
                  /////////////////////////////////////////////////////////////


                  ////////////////////////////////////////// cedar
                  else if (code == 'cedarc1') { Navigator.pushNamed(context, '/cedarc1'); }
                  else if (code == 'cedarc2') { Navigator.pushNamed(context, '/cedarc2'); }
                  else if (code == 'cedarc3') { Navigator.pushNamed(context, '/cedarc3'); }
                  else if (code == 'cedarc4') { Navigator.pushNamed(context, '/cedarc4'); }
                  else if (code == 'cedarc5') { Navigator.pushNamed(context, '/cedarc5'); }
                  /////////////////////////////////////////////////////////////


                  ////////////////////////////////////////// macademia
                  else if (code == 'macademiac1') { Navigator.pushNamed(context, '/macademiac1'); }
                  else if (code == 'macademiac2') { Navigator.pushNamed(context, '/macademiac2'); }
                  else if (code == 'macademiac3') { Navigator.pushNamed(context, '/macademiac3'); }
                  else if (code == 'macademiac4') { Navigator.pushNamed(context, '/macademiac4'); }
                  else if (code == 'macademiac5') { Navigator.pushNamed(context, '/macademiac5'); }
                  /////////////////////////////////////////////////////////////


                  ////////////////////////////////////////// rehoboth
                  else if (code == 'rehobothc1') { Navigator.pushNamed(context, '/rehobothc1'); }
                  else if (code == 'rehobothc2') { Navigator.pushNamed(context, '/rehobothc2'); }
                  else if (code == 'rehobothc3') { Navigator.pushNamed(context, '/rehobothc3'); }
                  else if (code == 'rehobothc4') { Navigator.pushNamed(context, '/rehobothc4'); }
                  else if (code == 'rehobothc5') { Navigator.pushNamed(context, '/rehobothc5'); }
                  /////////////////////////////////////////////////////////////


                  ////////////////////////////////////////// shabach
                  else if (code == 'shabachc1') { Navigator.pushNamed(context, '/shabachc1'); }
                  else if (code == 'shabachc2') { Navigator.pushNamed(context, '/shabachc2'); }
                  else if (code == 'shabachc3') { Navigator.pushNamed(context, '/shabachc3'); }
                  else if (code == 'shabachc4') { Navigator.pushNamed(context, '/shabachc4'); }
                  else if (code == 'shabachc5') { Navigator.pushNamed(context, '/shabachc5'); }
                  /////////////////////////////////////////////////////////////


                  ////////////////////////////////////////// shekinah
                  else if (code == 'shekinahc1') { Navigator.pushNamed(context, '/shekinahc1'); }
                  else if (code == 'shekinahc2') { Navigator.pushNamed(context, '/shekinahc2'); }
                  else if (code == 'shekinahc3') { Navigator.pushNamed(context, '/shekinahc3'); }
                  else if (code == 'shekinahc4') { Navigator.pushNamed(context, '/shekinahc4'); }
                  else if (code == 'shekinahc5') { Navigator.pushNamed(context, '/shekinahc5'); }
                  /////////////////////////////////////////////////////////////





                  else {
                    // Handle invalid codes or display an error message
                    // For simplicity, we'll just show a snackbar
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Invalid code. Please try again.')),
                    );
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF455180)), // Set button color to red
                ),
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

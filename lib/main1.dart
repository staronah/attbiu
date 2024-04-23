import 'package:Sotonye/home.dart';

import 'package:flutter/material.dart';




void main() => runApp(Main1());

class Main1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
      debugShowCheckedModeBanner: false,
      routes: {

        '/att': (context) => HomePage(),




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
                  if (code == 'att6606') {
                    Navigator.pushNamed(context, '/att');
                  }
                  else if (code == 'l300') { Navigator.pushNamed(context, '/att'); }


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

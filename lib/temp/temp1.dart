import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Temp1 extends StatelessWidget {
  const Temp1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove the debug banner
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _textcontrol,
                          decoration: InputDecoration(
                            hintText: 'Search',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 55,
                          child: ElevatedButton(
                            onPressed: () {
                              _controller!.runJavascriptReturningResult(
                                  "self.find('${_textcontrol.text}')").then((value) => print(value));
                            },
                            child: Text("Search"),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MyHomePage(
                  title: '',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

WebViewController? _controller;
var _textcontrol = TextEditingController();

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return controller();
  }

  WebView controller() {
    return WebView(
      javascriptMode: JavascriptMode.unrestricted,
      initialUrl: 'https://www.biuportal.net/LogIn.aspx',
      onWebViewCreated: (WebViewController webViewController) {
        _controller = webViewController;
      },
      navigationDelegate: (NavigationRequest request) {
        // Redirect to google.com when a new page is loaded
        if (request.url != 'https://www.biuportal.net/LogIn.aspx') {
          _controller!.loadUrl('https://www.google.com');
          return NavigationDecision.prevent;
        }

        return NavigationDecision.navigate;
      },
    );
  }
}

void main() {
  runApp(Temp1());
}

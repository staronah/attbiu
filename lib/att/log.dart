import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(WebViewPages());

class WebViewPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WebView'),
        backgroundColor: Color(0xFF455180),
      ),
      body: WebView(
        initialUrl: 'https://staronah.github.io/genesisbiu/attendance', // Replace with your URL
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

InAppLocalhostServer localhostServer = new InAppLocalhostServer();

void main() async{
  await localhostServer.start();
  runApp(
      MaterialApp(
        home: MyApp(),
      )
  );
}



class MyApp extends StatelessWidget {
  final Completer<InAppWebViewController> _controller =
  Completer<InAppWebViewController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
              height: MediaQuery.of(context).size.height,
              child: InAppWebView(
                  initialUrlRequest: URLRequest(
                      url: Uri.parse('http:localhost:8080/assets/chat.html')
                  ),
                  onWebViewCreated: (InAppWebViewController webViewController) {
                    _controller.complete(webViewController);
                    webViewController.addJavaScriptHandler(handlerName: 'closechannelHandler', callback: (args){
                      Navigator.pop(context);
                    });
                  },
                  onLoadStop: (InAppWebViewController webViewController, url){
                    String data = jsonEncode({
                      'token' : 'your-fresh-chat-token',
                      'id' : 0,
                      'firstname' : 'Firstname',
                      'lastName' : 'Lastname',
                    });
                    webViewController.evaluateJavascript(source: 'initialiseChart('+data+')');
                  }
              )
          ),
        ),
      ),
    );
  }
}
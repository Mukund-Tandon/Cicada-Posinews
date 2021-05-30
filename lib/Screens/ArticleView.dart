import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';
class articleView extends StatefulWidget {
String url;
articleView({this.url=''});

  @override
  _articleViewState createState() => _articleViewState();
}

class _articleViewState extends State<articleView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black26,
        title: Text(
          'PosiNews',
          style: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
        ),
      ),
      body: Container(
        child: WebView(
          initialUrl: widget.url,
        ),
      ),
    );
  }
}

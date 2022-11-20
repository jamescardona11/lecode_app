import 'package:easy_web_view/easy_web_view.dart';
import 'package:flutter/material.dart';

class WebViewExample extends StatefulWidget {
  const WebViewExample({
    super.key,
    required this.url,
  });

  final String url;

  @override
  WebViewExampleState createState() => WebViewExampleState();
}

class WebViewExampleState extends State<WebViewExample> {
  var loadingPercentage = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return EasyWebView(
      src: widget.url,
    );
  }
}

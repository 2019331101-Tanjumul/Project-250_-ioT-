import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Screen extends StatefulWidget {
  final bool _isScreenOn;
  const Screen(this._isScreenOn, {super.key});
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {

  late WebViewController controller;

  @override
  void initState() {
    controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..setBackgroundColor(const Color(0x00000000))
  ..setNavigationDelegate(
    NavigationDelegate(
      onProgress: (int progress) {
        // Update loading bar.
      },
      onPageStarted: (String url) {},
      onPageFinished: (String url) {},
      onWebResourceError: (WebResourceError error) {},
      onNavigationRequest: (NavigationRequest request) {
        if (request.url.startsWith('https://www.youtube.com/')) {
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      },
    ),
  )
  //insert your url here
  ..loadRequest(Uri.parse('http://192.168.225.97/'));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Neumorphic(
        style: const NeumorphicStyle(
            shape: NeumorphicShape.flat,
            depth: -3,
            surfaceIntensity: 10,
            shadowDarkColor: Colors.black,
            border: NeumorphicBorder(
              color: Color(0x33000000),
              width: 2,
            )),
        child: widget._isScreenOn
            ? SizedBox(
                height: 240,
                width: 320,
                child: WebViewWidget(
                  controller: controller,
                ))
            : const SizedBox(
                height: 240,
                width: 320,
              ));
  }
}

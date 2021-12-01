import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TermsConditions extends StatelessWidget {
  const TermsConditions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebView(
          initialUrl: 'https://www.fenmo.app/terms',
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}

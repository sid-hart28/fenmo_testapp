import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'dart:io';

class InAppWebViewPage extends StatefulWidget {
  @override
  _InAppWebViewPageState createState() => new _InAppWebViewPageState();
}

        

String html = """
<html>
<body>
<iframe id="iFrame0"    
   src="https://speed.mogiio.com/embed3/61803529ff9fdf229cae8b93" 
   style="width: 100%;height: 100%;" allow="accelerometer; autoplay; 
   encrypted-media;gyroscope; picture-in-picture" allowfullscreen>
</iframe>
<script>
document.getElementById("iFrame0").contentWindow.postMessage(JSON.stringify({'activate': true }) , '*')
</script>
</body>
</html>
  """;

  String html3 = """
<html>
<head>
  <title>fd</title>
</head>
<body>
<iframe src="https://player.vimeo.com/video/648018751?h=4ecfff0a2c&amp;autoplay=1&amp;app_id=122963" width="100%" height="100%" 
frameborder="0" allow="autoplay; fullscreen; picture-in-picture" allowfullscreen title="Squid Game"></iframe>
</body>
</html>
""";

class _InAppWebViewPageState extends State<InAppWebViewPage> {

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
    }
  }

  @override
  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController? webViewController;
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("InAppWebView")),
      body: Container(
        child: InAppWebView(
          key: webViewKey,
          initialUrlRequest:
              URLRequest(url: Uri.dataFromString(html, mimeType: 'text/html')),
          onWebViewCreated: (controller) {
            webViewController = controller;
          },
          androidOnPermissionRequest: (controller, origin, resources) async {
            return PermissionRequestResponse(
                resources: resources,
                action: PermissionRequestResponseAction.GRANT);
          },
          onConsoleMessage: (controller, consoleMessage) {
            print(consoleMessage);
          },
        ),
      ),
    );
  }
}

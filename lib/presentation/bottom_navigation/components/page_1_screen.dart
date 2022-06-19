import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// class Page1Screen extends StatefulWidget {
//   const Page1Screen({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<Page1Screen> createState() => _Page1ScreenState();
// }
//
// class _Page1ScreenState extends State<Page1Screen> {
//   bool isLoading = true;
//   final _key = UniqueKey();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Stack(
//           children: <Widget>[
//             WebView(
//               key: _key,
//               initialUrl: 'https://flutter-ko.dev/',
//               javascriptMode: JavascriptMode.unrestricted,
//               onPageFinished: (finish) {
//                 setState(() {
//                   isLoading = false;
//                 });
//               },
//             ),
//             isLoading
//                 ? const Center(child: CircularProgressIndicator())
//                 : Stack(),
//           ],
//         ),
//       ),
//     );
//   }
// }

//
class Page1Screen extends StatefulWidget {
  const Page1Screen({
    Key? key,
  }) : super(key: key);

  @override
  State<Page1Screen> createState() => _Page1ScreenState();
}

class _Page1ScreenState extends State<Page1Screen>
    with AutomaticKeepAliveClientMixin {

  final Completer<WebViewController> _controller =
  Completer<WebViewController>();
  bool isLoading = true;
  final _key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: const Text('Flutter WebView example'),
        // This drop down menu demonstrates that Flutter widgets can be shown over the web view.
        actions: <Widget>[
        ],
      ),
      body: WebView(
        initialUrl: 'https://flutter.dev',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
        onProgress: (int progress) {
          print('WebView is loading (progress : $progress%)');
        },
        javascriptChannels: <JavascriptChannel>{
          _toasterJavascriptChannel(context),
        },
        navigationDelegate: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            print('blocking navigation to $request}');
            return NavigationDecision.prevent;
          }
          print('allowing navigation to $request');
          return NavigationDecision.navigate;
        },
        onPageStarted: (String url) {
          print('Page started loading: $url');
        },
        onPageFinished: (String url) {
          print('Page finished loading: $url');
        },
        gestureNavigationEnabled: true,
        backgroundColor: const Color(0x00000000),
      ),
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

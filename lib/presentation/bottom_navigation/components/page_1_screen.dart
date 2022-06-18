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
  bool isLoading = true;
  final _key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            WebView(
              key: _key,
              initialUrl: 'https://flutter-ko.dev/',
              javascriptMode: JavascriptMode.unrestricted,
              onPageFinished: (finish) {
                setState(() {
                  isLoading = false;
                });
              },
            ),
            isLoading
                ? const Center(
                child: CircularProgressIndicator()
            )
                : Stack(),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

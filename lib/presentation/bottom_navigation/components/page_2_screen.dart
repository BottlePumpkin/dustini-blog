import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Page2Screen extends StatelessWidget {
  const Page2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 10,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () async {
            if (await canLaunchUrlString('https://www.vogue.co.kr/')) {
            await launchUrlString('https://www.vogue.co.kr/');
            }

          },
          child: Image.asset(
            'assets/images/${index + 1}.jpeg',
            fit: BoxFit.fill,
          ),
        );
      },
    );
  }
}

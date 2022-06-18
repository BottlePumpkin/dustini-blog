import 'package:dustini_blog/presentation/bottom_navigation/components/page_1_screen.dart';
import 'package:dustini_blog/presentation/bottom_navigation/components/page_2_screen.dart';
import 'package:flutter/material.dart';

class BottomNavigationView extends StatefulWidget {
  const BottomNavigationView({Key? key}) : super(key: key);

  @override
  State<BottomNavigationView> createState() => _BottomNavigationViewState();
}

class _BottomNavigationViewState extends State<BottomNavigationView> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  PageController pageController = PageController();
  List<Widget> screens = [
    Page1Screen(),
    Page2Screen()
  ];

  bool visiblePopUpMenu = false;

  @override
  void initState() {
    super.initState();
  }

  int screenIndex = 0;

  // Initial index of the screen

  int get fetchCurrentScreenIndex {
    return screenIndex;
  }

  void updateScreenIndex(int newIndex) {
    screenIndex = newIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _key,
      body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          children: screens,
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              updateScreenIndex(index);
            });
          }),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: screenIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            updateScreenIndex(index);
            pageController.jumpToPage(index);
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: 'page1',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'page2',
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}

import 'package:dustini_blog/app/resource/padding.dart';
import 'package:dustini_blog/app/resource/sized_box.dart';
import 'package:dustini_blog/presentation/bottom_navigation/bottom_navigation_screen.dart';
import 'package:dustini_blog/presentation/grid_view/components/grid_view_builder_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> list = ['Bottom Navigation','Grid View'];
  List<Widget> widgets = [BottomNavigationView(),GridViewBuilderScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: horizontal16,
          child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => widgets[index]),
                    );


                  },
                  child: Row(
                    children: [
                      Text(
                        '${index + 1}',
                        style: const TextStyle(fontSize: 20),
                      ),
                      size20,
                      Text(
                        list[index],
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}

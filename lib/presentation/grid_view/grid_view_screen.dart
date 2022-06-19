import 'package:dustini_blog/app/resource/padding.dart';
import 'package:dustini_blog/app/resource/sized_box.dart';
import 'package:dustini_blog/presentation/grid_view/components/grid_view_builder_screen.dart';
import 'package:flutter/material.dart';


class GridViewScreen extends StatefulWidget {
  const GridViewScreen({Key? key}) : super(key: key);

  @override
  State<GridViewScreen> createState() => _GridViewScreenState();
}

class _GridViewScreenState extends State<GridViewScreen> {
  List<String> list = ['grid view builder'];

  List<Widget> widgets = [GridViewBuilderScreen()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
    );
  }
}

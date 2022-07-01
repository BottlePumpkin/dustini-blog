import 'package:flutter/material.dart';

class FirebaseScreen extends StatelessWidget {
  const FirebaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase'),
      ),
      floatingActionButton: TextButton(
        onPressed: () => throw Exception(),
        child: const Text("Throw Test Exception"),
      ),
    );
  }
}

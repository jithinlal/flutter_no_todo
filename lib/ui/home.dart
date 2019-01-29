import 'package:flutter/material.dart';
import 'package:todo/ui/notodo_screen.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo'),
        backgroundColor: Colors.black54,
      ),
      body: NoToDoScreen(),
    );
  }
}

import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Splash AppBar"),
      ),
      body: Row(
        children: [
          Text("Splash body"),
          ElevatedButton(
            onPressed: () => Navigator.pushReplacementNamed(context, "/home"),
            child: Text("go home"),
          )
        ],
      ),
    );
  }
}

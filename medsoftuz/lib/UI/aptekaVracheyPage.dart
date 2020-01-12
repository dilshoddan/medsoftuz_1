import 'package:flutter/material.dart';

class AptekaVrachey extends StatefulWidget {

  String data;
  AptekaVrachey({this.data});

  @override
  _AptekaVracheyState createState() => _AptekaVracheyState();
}

class _AptekaVracheyState extends State<AptekaVrachey> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Apteka Vrachey",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Colors.black),

      ),
    );
  }
}

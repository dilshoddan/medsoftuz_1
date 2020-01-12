import 'package:flutter/material.dart';

class Apteka extends StatefulWidget {

  String data;
  Apteka({this.data});

  @override
  _AptekaState createState() => _AptekaState();
}

class _AptekaState extends State<Apteka> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Apteka",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Colors.black),

      ),
    );
  }
}

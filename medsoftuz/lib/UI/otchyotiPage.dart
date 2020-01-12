import 'package:flutter/material.dart';

class Otchyoti extends StatefulWidget {

  String data;
  Otchyoti({this.data});

  @override
  _OtchyotiState createState() => _OtchyotiState();
}

class _OtchyotiState extends State<Otchyoti> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Otchyoti",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Colors.black),

      ),
    );
  }
}

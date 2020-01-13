import 'package:flutter/material.dart';

class UserDocuments extends StatefulWidget {

  String data;
  UserDocuments({this.data});

  @override
  _UserDocumentsState createState() => _UserDocumentsState();
}

class _UserDocumentsState extends State<UserDocuments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Документы",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Colors.black),

      ),

      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Flexible(
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Название: "),
                          Text("Дата создания: "),
                          Text("Состояние: "),
                          Text("..."),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text("ИС001 УЗС почек"),
                          Text("26.11.2016"),
                          Text("подписан"),
                          Text("..."),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(

            backgroundColor: Colors.black,
            icon: Icon(
              Icons.assignment,
              size: 15,
            ),
            title: Text(
              "Документы",
              style: TextStyle(fontSize: 15),
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(
              Icons.add_shopping_cart,
              size: 15,
            ),
            title: Text(
              "Медикаменты",
              style: TextStyle(fontSize: 15),
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(
              Icons.attach_money,
              size: 15,
            ),
            title: Text(
              "Платежи",
              style: TextStyle(fontSize: 15),
            ),
          )
        ],
      ),
    );
  }
}

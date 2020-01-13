import 'package:flutter/material.dart';

class UserMedicaments extends StatefulWidget {

  String data;
  UserMedicaments({this.data});

  @override
  _UserMedicamentsState createState() => _UserMedicamentsState();
}

class _UserMedicamentsState extends State<UserMedicaments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Медикаменты",
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
                          Text("Кто выписал медикамент: "),
                          Text("Код медикамента: "),
                          Text("Наименования: "),
                          Text("Дата выписки"),
                          Text("..."),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text("Ким Евгений Олегович"),
                          Text("000086"),
                          Text("ДС-1 0,5л (концентрат)"),
                          Text("26.11.2019 08:14"),
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
        currentIndex: 1,
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

import 'package:flutter/material.dart';

class UserPayments extends StatefulWidget {

  String data;
  UserPayments({this.data});

  @override
  _UserPaymentsState createState() => _UserPaymentsState();
}

class _UserPaymentsState extends State<UserPayments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Платежи",
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
                          Text("Дата платежей: "),
                          Text("Сумма: "),
                          Text("ФИО кассира: "),
                          Text("Тип платежа: "),
                          Text("..."),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text("16.08.2019 08:50"),
                          Text("7 400 000 сум"),
                          Text("Ким Евгений Олегович"),
                          Text("Наличный расчёт "),
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
        currentIndex: 2,
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

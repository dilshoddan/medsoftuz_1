import 'package:flutter/material.dart';
import 'package:medsoftuz/UI/documents.dart';
import 'package:medsoftuz/UI/medikamenti.dart';
import 'package:medsoftuz/UI/plateji.dart';

class Profil extends StatefulWidget {

  String data;
  Profil({this.data});

  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {

  openTab(int index) {
    switch(index) {
      case 0:
        {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  UserDocuments(
                    data: index.toString(),
                  )));
          break;
        }
      case 1: {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                UserMedicaments(
                  data: index.toString(),
                )));
        break;
      }
      case 2: {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                UserPayments(
                  data: index.toString(),
                )));
        break;
      }

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Профиль",
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
                         Text("Фамилия: "),
                         Text("Имя: "),
                         Text("Отчества: "),
                         Text("Дата пождения: "),
                         Text("Дата регистрация: "),
                         Text("№ Договор.н: "),
                         Text("№ Ш.Фактура: "),
                         Text("Дата.Ш.Фактура: "),
                         Text("..."),
                       ],
                     ),
                     Column(
                       children: <Widget>[
                         Text("Бахтиер"),
                         Text("Алимов"),
                         Text("Умаралиевич"),
                         Text("16.12.1966"),
                         Text("23-01-2006"),
                         Text("13845"),
                         Text("785"),
                         Text("16-10-2018"),
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
        onTap: (int index) {
          openTab(index);
        },
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

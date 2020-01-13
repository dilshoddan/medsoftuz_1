import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:medsoftuz/DataLayer/models/TokenAuth/UserAuth.dart';
import 'package:medsoftuz/UI/aptekaPage.dart';
import 'package:medsoftuz/UI/aptekaVracheyPage.dart';
import 'package:medsoftuz/UI/otchyotiPage.dart';
import 'package:medsoftuz/UI/Profil.dart';
import 'package:medsoftuz/DataLayer/models/patient/patients.dart';
import 'package:medsoftuz/DataLayer/Posts/patientPost.dart';
import 'package:http/http.dart' as http;
import 'package:medsoftuz/DataLayer/models/samplePost.dart';

Future<UserAuth> fetchTokenPost() async {
  Map<String, String> headers = {
    'Authorization': '7d4c6ba8619344ae5d50d69cbe8868d9',
    'Content-Type': 'application/json',
  };

 var header = {
   HttpHeaders.authorizationHeader: "7d4c6ba8619344ae5d50d69cbe8868d9",
   HttpHeaders.contentTypeHeader: "application/json"
 };

  Map<String, String> params = {"email": "admin@gx.uz", "password": "123456"};

  var body = json.encode(
      {"id": 123, "jsonrpc": "2.0", "method": "users.auth", "params": params});


  final response =
  await http.post('http://rscu.gx.uz/app', headers: header, body: body);

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return UserAuth.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

Future<Patients> fetchPost(String code) async {
  Map<String, String> headers = {
    HttpHeaders.authorizationHeader : '7d4c6ba8619344ae5d50d69cbe8868d9',
    HttpHeaders.contentTypeHeader: 'application/json'
  };

//  'Authorization': '7d4c6ba8619344ae5d50d69cbe8868d9',
//  'Content-Type': 'application/json',

  var params = json.encode(
      {"person_id": "$code", "token": "378130d7734a06977bbf251e6deae9a8"});

  var bodyOld = json.encode(
      {"id": 123, "jsonrpc": "2.0", "method": "person.info", "params": params});

  var body = '''
          {
            "id" : 123,
            "jsonrpc" : "2.0",
            "method" : "person.info",
            "params" : {
                        "person_id" : "$code",
                        "token" : "378130d7734a06977bbf251e6deae9a8"
            }
          }
  ''';


  final response =
      await http.post('http://rscu.gx.uz/app', headers: headers, body: body);

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return Patients.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

Future<Post> sampleFetchPost(String code) async {
  final response =
      await http.get('https://jsonplaceholder.typicode.com/posts/$code');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return Post.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<Patients> patients;
  Future<Post> post;
  Future<UserAuth> userAuth;

  final myController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    patients = fetchPost("3333");
    post = sampleFetchPost("2");
  }

  openApteka(String data) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Apteka(
              data: data,
            )));
  }

  openAptekaVrachey(String data) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => AptekaVrachey(
              data: data,
            )));
  }

  openOtchyoti(String data) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Otchyoti(
              data: data,
            )));
  }

  openProfil(String data) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Profil(
          data: data,
        )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Пациенты",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          iconTheme: new IconThemeData(color: Colors.black),
          actions: <Widget>[
            IconButton(
                color: Colors.black,
                icon: Icon(Icons.add),
                onPressed: () => debugPrint("Add Patient"))
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text(
                  "Пациенты",
                  style: TextStyle(fontSize: 18.0),
                ),
                leading: Icon(
                  Icons.accessibility,
                  color: Colors.black,
                  size: 35.0,
                ),
              ),
              ListTile(
                title: Text(
                  "Аптека",
                  style: TextStyle(fontSize: 18.0),
                ),
                leading: Icon(
                  Icons.add_shopping_cart,
                  color: Colors.black,
                  size: 35.0,
                ),
                onTap: () => openApteka("Open Apteka"),
              ),
              ListTile(
                title: Text(
                  "Аптека врачей",
                  style: TextStyle(fontSize: 18.0),
                ),
                leading: Icon(
                  Icons.border_color,
                  color: Colors.black,
                  size: 35.0,
                ),
                onTap: () => openAptekaVrachey("Open Apteka Vrachey"),
              ),
              ListTile(
                title: Text(
                  "Отчеты",
                  style: TextStyle(fontSize: 18.0),
                ),
                leading: Icon(
                  Icons.assessment,
                  color: Colors.black,
                  size: 35.0,
                ),
                onTap: () => openOtchyoti("Open Otchyoti"),
              ),
              Divider(
                height: 10.0,
                color: Colors.black,
              ),
              ListTile(
                title: Text(
                  "Закрыть",
                  style: TextStyle(fontSize: 18.0),
                ),
                leading: Icon(
                  Icons.close,
                  color: Colors.red,
                  size: 35.0,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
        body: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Flexible(
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    child: TextField(
                      controller: myController,
                      decoration: InputDecoration(hintText: "Введите код пациента"),
                      onEditingComplete: () {
                        debugPrint("Typed: ${myController.text}");
                        setState(() {
                          //userAuth = fetchTokenPost();
                          //post = sampleFetchPost(myController.text);
                          patients = fetchPost("3333");
                        });

                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Flexible(
                  child: Container(

                    margin: EdgeInsets.all(10.0),
                    child: Card(
                      elevation: 10.0,
                      margin: EdgeInsets.all(10.0),
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            CircleAvatar(
                              child: Text("A"),
                              backgroundColor: Colors.redAccent,
                              foregroundColor: Colors.white,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              width: 210.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  InkWell(
                                    child: Text(
                                      "Алимов Бахтиер Умаралиевич",
                                      style: TextStyle(
                                          fontSize: 14.0, color: Colors.green),
                                      maxLines: 1,
                                    ),
                                    onTap: () => openProfil("Open Profil")

                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "16.12.1966",
                                    maxLines: 2,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ),
                )
              ],
            ),
          ],
        ));
  }
}

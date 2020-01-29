import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:medsoftuz/DataLayer/models/TokenAuth/UserAuth.dart';
import 'package:medsoftuz/UI/aptekaPage.dart';
import 'package:medsoftuz/UI/aptekaVracheyPage.dart';
import 'package:medsoftuz/UI/otchyotiPage.dart';
import 'package:medsoftuz/DataLayer/models/patient/patients.dart';
import 'package:medsoftuz/DataLayer/Posts/patientPost.dart';
import 'package:http/http.dart' as http;
import 'package:medsoftuz/DataLayer/models/samplePost.dart';

Future<UserAuth> fetchTokenPost() async {
  Map<String, String> headers = {
    'Authorization': '',
    'Content-Type': 'application/json',
  };

 var header = {
   HttpHeaders.authorizationHeader: "",
   HttpHeaders.contentTypeHeader: "application/json"
 };

  Map<String, String> params = {"email": "", "password": ""};

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
    HttpHeaders.authorizationHeader : '',
    HttpHeaders.contentTypeHeader: 'application/json'
  };

//  'Authorization': '7d4c6ba8619344ae5d50d69cbe8868d9',
//  'Content-Type': 'application/json',

  var params = json.encode(
      {"person_id": "$code", "token": ""});

  var bodyOld = json.encode(
      {"id": 123, "jsonrpc": "2.0", "method": "person.info", "params": params});

  var body = '''
          {
            "id" : 123,
            "jsonrpc" : "2.0",
            "method" : "person.info",
            "params" : {
                        "person_id" : "$code",
                        "token" : ""
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Patsienti",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          iconTheme: new IconThemeData(color: Colors.black),
          actions: <Widget>[
            IconButton(
                color: Colors.black,
                icon: Icon(Icons.add),
                onPressed: () => debugPrint("add"))
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text(
                  "Patsienti",
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
                  "Apteka",
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
                  "Apteka vrachey",
                  style: TextStyle(fontSize: 18.0),
                ),
                leading: Icon(
                  Icons.border_color,
                  color: Colors.black,
                  size: 35.0,
                ),
                onTap: () => openAptekaVrachey("Open Apteka"),
              ),
              ListTile(
                title: Text(
                  "Otchyoti",
                  style: TextStyle(fontSize: 18.0),
                ),
                leading: Icon(
                  Icons.assessment,
                  color: Colors.black,
                  size: 35.0,
                ),
                onTap: () => openOtchyoti("Open Apteka"),
              ),
              Divider(
                height: 10.0,
                color: Colors.black,
              ),
              ListTile(
                title: Text(
                  "Zakrit",
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
                      decoration: InputDecoration(hintText: "Vvedite kod"),
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
                    width: 300.0,
                    margin: EdgeInsets.all(10.0),
                    child: FutureBuilder<Patients>(
                      future: patients,
                      builder: (context, snapshot) {
                        if (snapshot.hasData &&
                            (snapshot.connectionState ==
                                ConnectionState.done)) {
                          return Text(
                            snapshot.data.method,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 10,
                          );
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }

                        // By default, show a loading spinner.
                        return LinearProgressIndicator();
                      },
                    ),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}

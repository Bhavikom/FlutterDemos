import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<dynamic> createOrder(String signature,String timeStamp) async {

  Map data = {
    'merchant_id': '369364134701831',
    'access_token': '2C8F310305474ACE3DB2ED19B880F43D',
    'customer_name': 'Bhavik',
    'customer_email': 'bhavikmakvanaom@gmail.com',
    'customer_phone': '9624300677',
    'product_name': 'om10',
    'order_no': timeStamp,
    'amount': '10',
    'isLive': 'packageName',
    'package_name': '12345678901234567890',
    'timestamp': timeStamp,
    'signature': signature
  };

  dynamic result = await http.post('https://sandbox.paykun.com/order/create', body: data,
  );

  if (result is Map) {
    log(' response from server : $result');
  }

  return result;
  /*if (response.statusCode == 201) {
    //return Album.fromJson(json.decode(response.body));
    return response;
  } else {
    throw Exception('Failed to create album.');
  }*/
}

/*class Album {
  final int id;
  final String title;

  Album({this.id, this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      title: json['title'],
    );
  }
}*/

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _controller = TextEditingController();
 // Future<Album> _futureAlbum;
  dynamic respponseFromServer;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Paykun SDK',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Paykun SDK'),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _controller,
                decoration: InputDecoration(hintText: 'Enter Title'),
              ),
              RaisedButton(
                child: Text('Create Data'),
                onPressed: () {
                  setState(() {

                    int timeStamp = new DateTime.now().millisecondsSinceEpoch;
                    String signanture = "369364134701831" + "2C8F310305474ACE3DB2ED19B880F43D" + "Bhavik" + "bhavikmakvanaom@gmail.com"
                        + "9624300677" + "om10" + ""+timeStamp.toString() + "10" + "packageName" + timeStamp.toString();

                    Map data = {
                      'merchant_id': '369364134701831',
                      'access_token': '2C8F310305474ACE3DB2ED19B880F43D',
                      'customer_name': 'Bhavik',
                      'customer_email': 'bhavikmakvanaom@gmail.com',
                      'customer_phone': '9624300677',
                      'product_name': 'om10',
                      'order_no': timeStamp,
                      'amount': '10',
                      'isLive': 'packageName',
                      'package_name': '12345678901234567890',
                      'timestamp': timeStamp,
                      'signature': signanture
                    };

                    respponseFromServer = createOrder(signanture,timeStamp.toString());

                    log(' response from server 22 : $respponseFromServer');
                  });
                },
              ),
            ],
          )
        ),
      ),
    );
  }
}

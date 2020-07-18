import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Post {
  final String userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["userId"] = userId;
    map["title"] = title;
    map["body"] = body;

    return map;
  }
}

Future<http.Response> createPost(String url, {Map body}) async {
  return http.post(url, body: body).then((http.Response response) {
    final int statusCode = response.statusCode;

    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }
    return response;
  });
}

class MyAppServicecall extends StatelessWidget {
  final Future<Post> post;

  MyAppServicecall({Key key, this.post}) : super(key: key);
  static final CREATE_POST_URL = 'https://jsonplaceholder.typicode.com/posts';
  TextEditingController titleControler = new TextEditingController();
  TextEditingController bodyControler = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "WEB SERVICE",
      theme: ThemeData(
        primaryColor: Colors.deepOrange,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Create Post'),
          ),
          body: new Container(
            margin: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: new Column(
              children: <Widget>[
                new TextField(
                  controller: titleControler,
                  decoration: InputDecoration(
                      hintText: "title....", labelText: 'Post Title'),
                ),
                new TextField(
                  controller: bodyControler,
                  decoration: InputDecoration(
                      hintText: "body....", labelText: 'Post Body'),
                ),
                new RaisedButton(
                  onPressed: () async {

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

                    http.Response dynamicResponse = await createPost("https://sandbox.paykun.com/order/create",
                        body: data);
                    print(dynamicResponse.toString());
                  },
                  child: const Text("Create"),
                )
              ],
            ),
          )),
    );
  }
}

//void main() => runApp(MyApp());
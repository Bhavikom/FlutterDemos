
import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
Future<dynamic> createPost({Map body}) async {

  dynamic result = await http.post("https://sandbox.paykun.com/order/create", body: body);
  if(result is Map){
    log(' result is map  from server : $result');
  }
  return result;
  /*return http.post(url, body: body).then((http.Response response) {
    final int statusCode = response.statusCode;

    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }
    dynamic result = json.decode(response.body);
    return result;
  });*/
}

class MyAppPostMethod extends StatelessWidget {
  final Future<dynamic> post;

  MyAppPostMethod({Key key, this.post}) : super(key: key);
  static final String CREATE_POST_URL = 'https://sandbox.paykun.com/order/create';
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

                    log(' result is map  from server : $data["merchant_id"]');
                    http.post("https://sandbox.paykun.com/order/create", body: data).then((http.Response response) {

                      log(' result is map  from server : $response');
                      /*final int statusCode = response.statusCode;

                      if (statusCode < 200 || statusCode > 400 || json == null) {
                        throw new Exception("Error while fetching data");
                      }
                      return Post.fromJson(json.decode(response.body));*/
                    });

                    //dynamic response = await createPost(body: data);
                    //dynamic result = await http.post("https://sandbox.paykun.com/order/create", body: data);
                    //if(result is Map){
                      //log(' result is map  from server : $result');
                    //}

                    //log(' response from server 22 : $response');
                  },
                  child: const Text("Create"),
                )
              ],
            ),
          )),
    );
  }
}

//void main() => runApp(MyAppPostMethod());
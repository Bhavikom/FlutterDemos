import 'package:flutter/material.dart';

void main() => runApp(MyApp2());

class Second {

  void randomMSG() {

    print('Second Class Function Called.');

  }

  void printText(String holder) {

    print(holder);

  }

  double returnMSG(double a, double b){

    double c ;

    c = a + b ;

    return c ;
  }

}

class MyApp2 extends StatelessWidget {

  final second = Second();

  void fn_1() {

    second.randomMSG();

  }

  void fn_2() {

    second.printText('Function With Argument Called');

  }

  void fn_3(){

    double holder ;

    holder = second.returnMSG(12, 13);

    print(holder);

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      Container(
                          margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child:
                          RaisedButton(
                            onPressed: () => fn_1(),
                            child: Text('Call Another Class Function Without Argument',
                              textAlign: TextAlign.center,),
                            textColor: Colors.white,
                            color: Colors.green,
                            padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                          )
                      ),

                      Container(
                          margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child:
                          RaisedButton(
                            onPressed: () => fn_2(),
                            child: Text('Call Another Class Function With Argument',
                                textAlign: TextAlign.center),
                            textColor: Colors.white,
                            color: Colors.lightBlue,
                            padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                          )
                      ),

                      Container(
                          margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child:
                          RaisedButton(
                            onPressed: () => fn_3(),
                            child: Text('Call Another Class Function With Return Value',
                                textAlign: TextAlign.center),
                            textColor: Colors.white,
                            color: Colors.green,
                            padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                          )
                      ),
                    ])
            )
        )
    );
  }
}
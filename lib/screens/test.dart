import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Data'),
      ),
      body: Container(
        height: 150,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: Colors.blueGrey[50],
          elevation: 8,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Row(
            children: <Widget>[
              SizedBox(
                height: 5,
              ),
              Column(
                children: <Widget>[
                  Expanded(
                    child: Image(
                      width: 120,
                      image: AssetImage('assets/img/usa.jpg'),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Center(
                      child: Text(
                        'xxxx',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                    Text(
                      'Total Cases:33333333',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'Total Death: 21321321',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'Recovered: 123123123',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.green,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'Critical: 123123123',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
//Row(
//children: <Widget>[
//Expanded(
//child: Card(
//elevation: 5,
//clipBehavior: Clip.antiAliasWithSaveLayer,
//child: Row(
//crossAxisAlignment: CrossAxisAlignment.start,
//children: <Widget>[
//Text("111"),
//Center(
//child: Container(
//height: 100,
//width: 100,
//child: Image(
//image: AssetImage('assets/img/usa.jpg'),
//),
//),
//),
//Text("111"),
//Expanded(
//child: Column(
//mainAxisAlignment: MainAxisAlignment.start,
//children: <Widget>[
//Text("111"),
//Text("111"),
//Text("111"),
//Text("111"),
//],
//),
//),
//],
//),
//),
//),
//],
//),

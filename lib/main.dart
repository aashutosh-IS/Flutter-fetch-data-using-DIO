import 'package:covid19_status/screens/dashboard.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DashBoard(),
      debugShowCheckedModeBanner: false,
      title: 'Covid19Stats',
    );
  }
}

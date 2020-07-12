import 'package:covid19_status/network/api_service.dart';
import 'package:covid19_status/screens/all_data/view_all.dart';
import 'package:covid19_status/screens/faq/faq.dart';
import 'package:covid19_status/screens/global_data.dart';
import 'package:covid19_status/screens/most_affected.dart';
import 'package:covid19_status/widgets/bottom_app_bar_widget.dart';
import 'package:flutter/material.dart';

import 'nepal_data.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class BottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: 70.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            BottomAppBarWidget(
              title: "All Data",
              iconName: Icons.dashboard,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ViewAll()));
              },
            ),
            BottomAppBarWidget(
              title: "FAQ's",
              iconName: Icons.question_answer,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => FAQPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _DashBoardState extends State<DashBoard> {
  ApiService apiService = ApiService();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid19 Statistics'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GlobalData(),
            NepalData(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Text(
                'Most affected Countries',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MostAffectedPannel(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}

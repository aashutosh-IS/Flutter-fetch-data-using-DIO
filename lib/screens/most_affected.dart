import 'package:covid19_status/network/api_service.dart';
import 'package:flutter/material.dart';

class MostAffectedPannel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ApiService apiService = ApiService();
    return FutureBuilder<dynamic>(
      future: apiService.getAllData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox(
            width: 20,
          );
        }
        if (snapshot.hasData) {
          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 5,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(7.0),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Image.network(
                            snapshot.data[index]['countryInfo']['flag'],
                            height: 30,
                            width: 50,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            snapshot.data[index]['country'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Text(
                        'Affected:' + snapshot.data[index]['cases'].toString(),
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Deaths:' + snapshot.data[index]['deaths'].toString(),
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        } else {
          return Text("Please try again Later!");
        }
      },
    );
  }
}

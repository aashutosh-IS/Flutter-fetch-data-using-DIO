import 'package:covid19_status/network/api_service.dart';
import 'package:flutter/material.dart';

class GlobalData extends StatefulWidget {
  @override
  _GlobalDataState createState() => _GlobalDataState();
}

class _GlobalDataState extends State<GlobalData> {
  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: apiService.getData(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: SizedBox(
                height: 350, child: Center(child: CircularProgressIndicator())),
          );
        } else {
          if (snapshot.hasData) {
            print(snapshot.data.toString());
            return Container(
              margin: EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 15.0,
              ),
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 210.0,
                    margin: EdgeInsets.only(left: 35.0),
                    decoration: BoxDecoration(
                      color: Colors.white60,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.blueGrey[100],
                          blurRadius: 5.0,
                          offset: Offset(0.0, 5.0),
                        ),
                      ],
                    ),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                            child: Text(
                              "Today's Global Data",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 9.0,
                          ),
                          Expanded(
                            child: Text(
                              "Total Cases : ${snapshot.data['cases']} ",
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Expanded(
                            child: Text(
                              "Total Recovered : ${snapshot.data['recovered']} ",
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Expanded(
                            child: Text(
                              "Total Death : ${snapshot.data['deaths']} ",
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(vertical: 8.0),
                              height: 2.0,
                              width: 100.0,
                              color: Colors.blueGrey),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  "Active Cases in ${snapshot.data['affectedCountries']} country: ${snapshot.data['active']} ",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 40.0),
                    alignment: FractionalOffset.centerLeft,
                    child: Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage("assets/img/earth.png"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Text("N/A");
          }
        }
      },
    );
  }
}

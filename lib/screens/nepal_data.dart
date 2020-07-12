import 'package:covid19_status/network/api_service.dart';
import 'package:flutter/material.dart';

class NepalData extends StatefulWidget {
  @override
  _NepalDataState createState() => _NepalDataState();
}

class _NepalDataState extends State<NepalData> {
  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: apiService.getNepalsData('nepal'),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox(
            height: 0,
          );
//          return Center(
//            child: SizedBox(
//                height: 350, child: Center(child: CircularProgressIndicator())),
//          );
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
                    height: 190.0,
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
                              "Cases in Nepal till date: ",
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
                                  "Today: ${snapshot.data['todayCases']} ",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "Active : ${snapshot.data['active']} ",
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
                      child: Image(image: AssetImage("assets/img/nepal.png")),
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

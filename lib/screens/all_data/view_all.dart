import 'package:covid19_status/network/api_service.dart';
import 'package:flutter/material.dart';

class ViewAll extends StatefulWidget {
  @override
  _ViewAllState createState() => _ViewAllState();
}

class _ViewAllState extends State<ViewAll> {
  ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cases World Wide'),
      ),
      body: Container(
        child: FutureBuilder<dynamic>(
          future: apiService.getAllData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child:
                    SizedBox(child: Center(child: CircularProgressIndicator())),
              );
            }
            if (snapshot.hasData) {
              return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 130,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Colors.blueGrey[50],
                      elevation: 8,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.network(
                                    snapshot.data[index]['countryInfo']['flag'],
                                    width: 110,
                                  ),
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
                              children: <Widget>[
                                SizedBox(
                                  height: 5,
                                ),
                                Center(
                                  child: Text(
                                    snapshot.data[index]['country'],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black),
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  'Total: ${snapshot.data[index]['cases'].toString()}',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'Deaths: ${snapshot.data[index]['deaths'].toString()}',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.red,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'Recovered: ${snapshot.data[index]['recovered'].toString()}',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.green,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'Critical: ${snapshot.data[index]['critical'].toString()}',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.blueAccent,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 10,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(
                  child: Text('Some Error Occured Please try again Later!'));
            }
          },
        ),
      ),
    );
  }
}

class GetAllData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

import 'package:dio/dio.dart';

class ApiService {
  Dio _dio = Dio();
  Response response;

  Future<dynamic> getData() async {
    response = await _dio.get("https://corona.lmao.ninja/all");
    return response.data;
  }

  Future<dynamic> getNepalsData(String countryName) async {
    response =
        await _dio.get("https://corona.lmao.ninja/countries/$countryName");
    return response.data;
  }

  Future<dynamic> getAllData() async {
    response = await _dio.get("https://corona.lmao.ninja/countries");
    return response.data;
  }
}

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_application/Models/OverViewModel.dart';
import 'package:flutter_application/Models/PerformanceModel.dart';
import 'package:http/http.dart' as http;

Future<List<OverViewModel>> overViewData(String api) async {
  Response response;

  var dio = Dio();

  response = await dio.get(api);
  // print(jsonDecode(response.toString()));
  return [OverViewModel.fromJson(jsonDecode(response.toString()))];
}

Future<List<PerformanceModel>> performanceApi(String api) async {
  Response response;
  var dio = Dio();

  response = await dio.get(api);

  // return [PerformanceModel.fromJson(jsonDecode(response.toString()))];
  return [PerformanceModel.fromJson(jsonDecode(response.toString()))];
}

Future<List<PerformanceModel>> fetchDat(api) async {
  List<PerformanceModel> objList = [];

  // Response response;
  Dio dio = Dio();
  // response = await dio.get(api);

  final response = await http.get(Uri.parse(api));

  if (response.statusCode == 200) {
    List<dynamic> values = [];

    values = json.decode(response.body);
    if (values.length > 0) {
      for (int i = 0; i < values.length; i++) {
        if (values[i] != null) {
          Map<String, dynamic> map = values[i];
          objList.add(PerformanceModel.fromJson(map));
        }
      }
    }

    return objList;
  } else {
    throw Exception("Failed to load coins");
  }
}

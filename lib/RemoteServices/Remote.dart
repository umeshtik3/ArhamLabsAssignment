import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:assignment1/Models/ContentHome.dart';
import 'package:http/http.dart' as http;

class Remote {
  static getContentHome() async {
    try {
      final response =
          await Dio().get('https://demo2142051.mockable.io/content_home');

      var jsonString = response.data;

      return jsonString;
    } on Exception catch (e) {
      print(e);
    }
  }

  static getContentDetails() async {
    try {
      final response =
          await Dio().get('http://demo2142051.mockable.io/content_detail');

      var jsonString = response.data;
      print(response.statusCode);
      if (response.statusCode == 200) {
        return jsonString;
      }
      return null;
    } on Exception catch (e) {
      // TODO
    }
  }
}

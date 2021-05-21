import 'package:assignment1/Models/ContentHome.dart';
import 'package:dio/dio.dart';

class Remote {
  static getContentHome() async {
    try {
      final response =
          await Dio().get(' http://demo2142051.mockable.io/content_home');

      var jsonString = response.data;
      var temp = contenthomeFromJson(jsonString);
      if (response.statusCode == 200) {
        return temp;
      } else {
        print('Error');
      }
    } on Exception catch (e) {
      print(e);
    }
  }
}

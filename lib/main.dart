import 'package:assignment1/Screens/DashBoard.dart';
import 'package:flutter/material.dart';
import 'Controllers/RegistrationController.dart';
import 'Screens/RegistrationScreen.dart';
import 'Screens/LoginScreen.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    RegistrationController registrationController =
        Get.put(RegistrationController());
    print(registrationController.userCreated);
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: registrationController.userLoggedIn
          ? DashBoard()
          : registrationController.userCreated
              ? LoginScreen()
              : RegistrationScreen(),
    );
  }
}

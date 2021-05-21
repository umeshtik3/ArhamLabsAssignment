import 'package:assignment1/Controllers/RegistrationController.dart';
import 'package:assignment1/Screens/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashBoard extends StatelessWidget {
  RegistrationController registrationController =
      Get.put(RegistrationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.remove('userEmailAddress');
            prefs.remove('userPassword');

            Get.to(() => LoginScreen());
            registrationController.userLoggedIn = false;
          },
          child: Text('Logout'),
        ),
      ),
    );
  }
}

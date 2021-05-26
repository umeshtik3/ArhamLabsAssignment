import 'package:assignment1/Screens/RegistrationScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Screens/LoginScreen.dart';
import '../Screens/DashBoard.dart';

class RegistrationController extends GetxController {
  String? emailSaved;

  @override
  void onInit() {
   
    isInstalled();
    super.onInit();
  }

  Future<bool> chekingLocalStorage() async {
    bool result = false;
    SharedPreferences pref = await SharedPreferences.getInstance();
    Set<String> keys = pref.getKeys();
    if (keys.length == 0) {
      // print(keys);
      //No local Storage
      RegistrationScreen();
      result = true;
    } else {
      //Navigate to login
      LoginScreen();
      result = false;
    }
    // print('---->$result');
    return result;
  }

  final formKey = GlobalKey<FormState>();
  final TextEditingController registrationEmailController =
      TextEditingController();
  final TextEditingController registrationPasswordController =
      TextEditingController();

  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();
  bool userLoggedIn = false;
  bool userCreated = false;

  userRegistration() async {
    String email = registrationEmailController.text;
    String password = registrationPasswordController.text;
    print(email);
    print(password);
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('userEmailAddress', email);
    pref.setString('userPassword', password);
    registrationEmailController.clear();
    registrationPasswordController.clear();
    Get.to(() => LoginScreen());
    userCreated = true;
  }

  isLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    var e = pref.getString('userEmailAddress');
    var p = pref.getString('userPassword');
    print(e);
    print(p);
    if (e == loginEmailController.text && p == loginPasswordController.text) {
      Get.to(() => DashBoard());
      userLoggedIn = true;
    }
  }

  // Future isInstalled() async {

  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   var email = pref.getString('userEmailAddress');
  //   print(pref.getString('userEmailAddress'));
  //   // print(pref.getString('userPassword'));

  // }
  Future isInstalled() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? email = pref.getString('userEmailAddress');

    if (email == null) {
      RegistrationScreen();
    } else {
      DashBoard();
    }

    print(pref.getString('userEmailAddress'));
    // print(pref.getString('userPassword'));
  }
}

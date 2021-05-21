import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Screens/LoginScreen.dart';
import '../Screens/DashBoard.dart';

class RegistrationController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final TextEditingController registrationEmailController =
      TextEditingController();
  final TextEditingController registrationPasswordController =
      TextEditingController();

  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();
  bool userLoggedIn = false;
  bool userCreated= false;
  
  @override
  void onInit() {
    super.onInit();
  }

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
    userCreated= true;
  }

  // Future<bool> get isRegistered async {
  // //  if(userCreated){ return true;}
  //  return false;
  // }

  isLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    // pref.clear();
    var e = pref.getString('userEmailAddress');
    var p = pref.getString('userPassword');
    if (e == loginEmailController.text && p == loginPasswordController.text) {
      Get.to(() => DashBoard());
      userLoggedIn = true;
    }
  }
}

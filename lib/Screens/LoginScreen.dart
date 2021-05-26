import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'DashBoard.dart';
import 'RegistrationScreen.dart';
import 'package:get/get.dart';
import '../Controllers/RegistrationController.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  RegistrationController registrationController =
      Get.put(RegistrationController());

  @override
  void initState() {
    // registrationController.userLoggedIn ? DashBoard():LoginScreen();
    // print('HO');
    // getLoginDetails();
  

    super.initState();
  }

  // getLoginDetails() async {
  //   return FutureBuilder(
  //       future: registrationController.isInstalled(),
  //       builder: (context, AsyncSnapshot<bool> snapshot) {
  //         print(registrationController
  //             .isInstalled()
  //             .then((value) => print(value)));
  //         Widget returnWidet;
  //         if (true) {
  //          Get.to(()=>DashBoard());
  //         }
  //         returnWidet = LoginScreen();
  //         return returnWidet;
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            TextButton(
                onPressed: () => Get.to(LoginScreen()),
                child: Text(
                  'Login ',
                  style: TextStyle(color: Colors.black),
                )),
            TextButton(
                onPressed: () => Get.to(RegistrationScreen()),
                child: Text('Signup', style: TextStyle(color: Colors.black)))
          ],
        ),
        actions: [
          Container(
              margin: EdgeInsets.all(2),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.pink,
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.person),
                  onPressed: () => null))
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  'User',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    onFieldSubmitted: (value) =>
                        registrationController.loginPasswordController.text,
                    controller: registrationController.loginEmailController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => EmailValidator.validate(value!)
                        ? null
                        : "Please enter a valid email",
                    decoration: InputDecoration(labelText: 'Email Address'),
                  ),
                  TextFormField(
                    onFieldSubmitted: (value) =>
                        registrationController.loginPasswordController.text,
                    controller: registrationController.loginPasswordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      if (value.length < 5) {
                        return 'Password must be greater 5';
                      }
                      return null;
                    },
                    decoration: InputDecoration(labelText: 'Passwaord'),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  color: Colors.black,
                  onPressed: () => null,
                  icon: Icon(Icons.face),
                ),
                IconButton(
                  color: Colors.black,
                  onPressed: () => null,
                  icon: Icon(Icons.g_translate),
                )
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow[400],
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            // If the form is valid, display a snackbar. In the real world,
            // you'd often call a server or save the information in a database.
            // ignore: unnecessary_statements
            registrationController.isLogin();

            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Login  Data')));
          }
        },
        child: Icon(
          Icons.arrow_forward,
          size: 20,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
      ),
    );
  }
}

import 'package:assignment1/Screens/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/RegistrationController.dart';
import 'package:email_validator/email_validator.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();

  RegistrationController registrationController =
      Get.put(RegistrationController());

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
      body: getBody(context),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red[300],
        onPressed: () {
          print('hi');
          if (_formKey.currentState!.validate()) {
            // If the form is valid, display a snackbar. In the real world,
            // you'd often call a server or save the information in a database.
            // ignore: unnecessary_statements
          
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Registring  Data')));
          }
            registrationController.userRegistration();
        },
        child: Icon(
          Icons.arrow_forward,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
      ),
    );
  }

  Container getBody(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
              'Hello Beautiful Enter Your Information below or login with your social account'),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: registrationController.registrationEmailController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => EmailValidator.validate(value!)
                      ? null
                      : "Please enter a valid email",
                  decoration: InputDecoration(labelText: 'Email Address'),
                ),
                TextFormField(
                  controller: registrationController.registrationPasswordController,
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
                TextFormField(
                  validator: (value) {
                    if (value !=
                        registrationController.registrationPasswordController.text) {
                      return 'Password should be same';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Password Again'),
                 
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
    );
  }
}

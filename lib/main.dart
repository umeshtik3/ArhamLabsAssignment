import 'dart:async';

import 'package:assignment1/Screens/DashBoard.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Controllers/RegistrationController.dart';
import 'Screens/RegistrationScreen.dart';
import 'Screens/LoginScreen.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late String emailSaved;
  get registrationController => registrationController;

  @override
  void initState() {
    
    isInstalled().whenComplete(() async => Timer(
        Duration(seconds: 2),
        () => Get.to(emailSaved == null
            ? buildFutureBuilder(registrationController)
            : DashBoard(user:emailSaved))));

    super.initState();
  }

  Future isInstalled() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    var email = pref.getString('userEmailAddress');
    setState(() {
      emailSaved = email!;
    });
    print(pref.getString('userEmailAddress'));
    // print(pref.getString('userPassword'));
  }

  @override
  Widget build(BuildContext context) {
    RegistrationController registrationController =
        Get.put(RegistrationController());

    // print(registrationController
    //     .chekingLocalStorage()
    //     .then((value) => print('<><>$value')));

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
        home: buildFutureBuilder(registrationController));

    // registrationController.chekingLocalStorage()
    //     ? RegistrationScreen()
    //     : LoginScreen());
  }

  FutureBuilder<bool> buildFutureBuilder(
      RegistrationController registrationController) {
    return FutureBuilder(
        future: registrationController.chekingLocalStorage(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          Widget returnWidget;
          if (true) {
            returnWidget = RegistrationScreen();
          }
          returnWidget = LoginScreen();
          return returnWidget;
        });
  }
}

    // buildColumn(
                      //   title: 'Videos',
                      //     indexCount: dashboardController.videoList.length,
                      //     url: 'thumbnail_url',
                      //     dataList: dashboardController.videoList),

                      // buildColumn(
                      //   title: 'Blogs',
                      //   indexCount: dashboardController.blogsList.length,
                      //   url: 'thumbnail_url',
                      //   dataList: dashboardController.blogsList,
                      // ),

                      // buildColumn(
                      //  title :  'Podcasts',
                      //   indexCount: dashboardController.podcastList.length,
                      //   url: 'thumbnail_url',
                      //   dataList: dashboardController.podcastList,
                        
                      // ),

                      // buildColumn(
                      //   title: 'Mini-course',
                      //     indexCount: dashboardController.miniCourseList.length,
                      //        url: 'thumbnail_url',
                      //     dataList: dashboardController.miniCourseList,
                      //    ),

                      //   Column buildColumn({String? title, int? indexCount, String? url, required List dataList}) {
//     return Column(
//       children: [
//         Text(title!),
//         Container(
//           height: 200,
//           width: double.infinity,
//           child: Obx(
//             () => ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: indexCount,
//                 // dashboardController.videoList.length,
//                 itemBuilder: (_, int index) {
//                   return Card(
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 10, vertical: 10),
//                       child: Container(
//                         child: Image.network(dataList[index][url]),
//                       ),
//                     ),
//                   );
//                 }),
//           ),
//         ),
//       ],
//     );
//   }

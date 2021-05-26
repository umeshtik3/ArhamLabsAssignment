import 'package:assignment1/Controllers/DashboardController.dart';
import 'package:assignment1/Controllers/RegistrationController.dart';
import 'package:assignment1/Screens/ContentDetails.dart';
import 'package:assignment1/Screens/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashBoard extends StatefulWidget {
  final user;

  DashBoard({Key? key, this.user}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  DashboardController dashboardController = Get.put(DashboardController());
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Search Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Profile Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(dashboardController.isLoading.value);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
                backgroundColor: Colors.grey),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                title: Text('Fourm'),
                backgroundColor: Colors.grey),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Content'),
              backgroundColor: Colors.grey,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.donut_small_outlined),
              title: Text('Trainer'),
              backgroundColor: Colors.grey,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.dangerous),
              title: Text('More'),
              backgroundColor: Colors.grey,
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Dashboard'),
        actions: [
          IconButton(
            autofocus: true,
            tooltip: 'Logout',
            icon: Icon(Icons.forward),
            onPressed: () {
              Get.to(() => ContentDetails());
            },
          ),
          IconButton(
            autofocus: true,
            tooltip: 'Logout',
            icon: Icon(Icons.logout),
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.remove('userEmailAddress');
              prefs.remove('userPassword');

              Get.to(() => LoginScreen());
            },
          )
        ],
      ),
      // bottomNavigationBar: Container(
      //   padding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
      //   height: 150,
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: [
      //       Text('Mini Courses'),
      //       Container(
      //         height: 100,
      //         child: ListView.builder(
      //             scrollDirection: Axis.horizontal,
      //             itemCount: 12,
      //             itemBuilder: (_, int index) {
      //               return Card(
      //                 child: Padding(
      //                   padding: const EdgeInsets.symmetric(horizontal: 145),
      //                   child: Text('Hi $index'),
      //                 ),
      //               );
      //             }),
      //       ),
      //     ],
      //   ),
      // ),

      body: dashboardController.isLoading.value
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Text(user),
                      Column(
                        children: [
                          Text('Videos'),
                          Container(
                            height: 200,
                            width: double.infinity,
                            child: Obx(
                              () => ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: dashboardController.videoList.length,
                                  itemBuilder: (_, int index) {
                                    return Card(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 10),
                                        child: Container(
                                          child: Image.network(dashboardController
                                              .videoList[index]['thumbnail_url']),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ),
                        ],
                      ),
                      Text('Blogs'),
                      Container(
                        height: 200,
                        width: double.infinity,
                        child: Obx(
                          () => ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: dashboardController.blogsList.length,
                              itemBuilder: (_, int index) {
                                return Card(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    child: Container(
                                      child: Image.network(dashboardController
                                          .blogsList[index]['thumbnail_url']),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                      Text('Podcasts'),
                      Container(
                        height: 200,
                        width: double.infinity,
                        child: Obx(
                          () => ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: dashboardController.podcastList.length,
                              itemBuilder: (_, int index) {
                                return Card(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    child: Container(
                                      child: Image.network(dashboardController
                                          .podcastList[index]['thumbnail_url']),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                      Text('Mini Courses'),
                      Container(
                        height: 100,
                        child: Obx(
                          () => ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  dashboardController.miniCourseList.length,
                              itemBuilder: (_, int index) {
                                return Card(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    child: Container(
                                      child: Image.network(dashboardController
                                              .miniCourseList[index]
                                          ['thumbnail_url']),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );

   
  }
}

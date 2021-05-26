import 'package:assignment1/Controllers/DashboardController.dart';
import 'package:assignment1/Screens/DashBoard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContentDetails extends StatefulWidget {
  @override
  _ContentDetailsState createState() => _ContentDetailsState();
}

class _ContentDetailsState extends State<ContentDetails> {
  DashboardController dashboardController = Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {
    dashboardController.fetchContentDetails();
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SafeArea(
              child: Container(
                width: double.infinity,
                child: Stack(
                  children: [
                    Image.network(
                      'https://picsum.photos/250?image=9',
                    ),
                    Positioned(
                      child: IconButton(
                        autofocus: true,
                        icon: Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Get.to(() => DashBoard());
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            ListTile(
              title: Text('How to prevent workout injuries'),
              subtitle: Text('category : 12/31/2020  00:00'),
              trailing: IconButton(
                autofocus: true,
                icon: Icon(
                  Icons.share,
                  color: Colors.grey,
                ),
                onPressed: () => null,
              ),
            ),
            Text(
              'What is Lorem Ipsum?',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
            Text(
              'Why it is used ?',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:assignment1/Models/ContentHome.dart';
import 'package:assignment1/RemoteServices/Remote.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  // ignore: deprecated_member_use
  var videoList = [].obs;
  var miniCourseList = [].obs;
  var podcastList = [].obs;
  var blogsList = [].obs;
  var isLoading = true.obs;
  @override
  void onInit() {
    fetchContentHome();
      


    super.onInit();
  }

  void fetchContentHome() async {
  
         
          // update();

      var contentHome = await Remote.getContentHome();
      if (contentHome != null) {
        // print(contentHome);
        List<dynamic> temp_video = contentHome['videos'];
        List<dynamic> temp_mini_course = contentHome['mini_courses'];
        List<dynamic> temp_podcast = contentHome['podcasts'];
        List<dynamic> temp_blogs = contentHome['blogs'];


         videoList.value = temp_video;
      miniCourseList.value = temp_mini_course;
      podcastList.value = temp_podcast;
      blogsList.value = temp_blogs;
        
      }
// // print(temp_video);
//       print(temp_mini_course);
// // print(temp_podcast);
// // print(temp_blogs);
     

//       print('List of length ${temp_video.length}');

    
  //     print('finaaly');
   isLoading(false);
  //  update();

    
  }
  

  fetchContentDetails() async {
    try {
      var contentDetails = await Remote.getContentDetails();

      print(contentDetails);
    } catch (e) {}
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:investorapp/controllers/profile_controller.dart';

// class SwippingScreen extends StatefulWidget {
//   const SwippingScreen({super.key});

//   @override
//   State<SwippingScreen> createState() => _SwippingScreenState();
// }

// class _SwippingScreenState extends State<SwippingScreen> {
//   // we write like this to get access to get mthod we created in profile_controllers under controller folder
//   ProfileController profileController = Get.put(ProfileController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         //in controller inital page 0 represents start and 1 in
//         //viewportFraction means display one item at a time
//         body: Obx(() {
//           return
//           PageView.builder(
//       itemCount: profileController.getAllUsersProfileList.length,
//       controller: PageController(initialPage: 0, viewportFraction: 1),
//       //it means direction in which we want to swipe
//       scrollDirection: Axis.horizontal,
//       itemBuilder: (context, index) {
//         final eachProfileInfo = profileController.getAllUsersProfileList[index];
//         return DecoratedBox(
//           decoration: BoxDecoration(
//               image: DecorationImage(
//                   image: NetworkImage(
//                     eachProfileInfo.imageProfile.toString(),
//                   ),
//                   fit: BoxFit.cover)),
//         );

//         }),

//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investorapp/controllers/profile_controller.dart';

class SwippingScreen extends StatefulWidget {
  const SwippingScreen({Key? key}) : super(key: key);

  @override
  State<SwippingScreen> createState() => _SwippingScreenState();
}

class _SwippingScreenState extends State<SwippingScreen> {
  // we write like this to get access to get method we created in profile_controllers under controller folder
  ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //in controller initial page 0 represents start and 1 in
      //viewportFraction means display one item at a time
      // the reason to wrap the page view builder in Obx is because we are using
      // GetXContoller in profile_controller.dart to access and display values we must
      // wrap the PageView Builder in Obx
      body: Obx(
        () {
          return PageView.builder(
            itemCount: profileController.getAllUsersProfileList.length,
            controller: PageController(initialPage: 0, viewportFraction: 1),
            //it means direction in which we want to swipe
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final eachProfileInfo =
                  profileController.getAllUsersProfileList[index];
              return DecoratedBox(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      eachProfileInfo.imageProfile.toString(),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

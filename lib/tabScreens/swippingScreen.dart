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
                  //we write this code to allow a icon appear on top right side of the image
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(children: [
                      //Filter icon button
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.filter_list,
                                size: 30,
                              )),
                        ),
                      )
                      // viewing user data by clicking on it
                      ,
                      //we write this to move the data to bottom of the image
                      const Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              //name
                              Text(
                                eachProfileInfo.name.toString(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    letterSpacing: 4,
                                    fontWeight: FontWeight.bold),
                              ),
                              //age and city
                              Text(
                                "${eachProfileInfo.age.toString()} ⦿ ${eachProfileInfo.city.toString()}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  letterSpacing: 4,
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              // we are writing this for styling
                              Row(
                                //to make the widget in childern appear in center, use mainAxisAlignment
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  //profession
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white30,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                    ),
                                    child: Text(
                                      eachProfileInfo.profession.toString(),
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 14),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  //religion
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white30,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                    ),
                                    child: Text(
                                      eachProfileInfo.religion.toString(),
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 14),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Row(
                                //to make the widget in childern appear in center, use mainAxisAlignment
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  //country
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white30,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                    ),
                                    child: Text(
                                      eachProfileInfo.country.toString(),
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 14),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  //ethnicity
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white30,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                    ),
                                    child: Text(
                                      eachProfileInfo.ethnicity.toString(),
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 14),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 14,
                              ),
                              //image button - favourite - chat - live
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  // heart shape
                                  GestureDetector(
                                    onTap: () {},
                                    child: Image.asset(
                                      "assets/images/heart.png",
                                      width: 50,
                                    ),
                                  ),
                                  //chat shape
                                  GestureDetector(
                                    onTap: () {},
                                    child: Image.asset(
                                      "assets/images/chat.png",
                                      width: 50,
                                    ),
                                  ),
                                  //star shape
                                  GestureDetector(
                                    onTap: () {},
                                    child: Image.asset(
                                      "assets/images/star.png",
                                      width: 50,
                                    ),
                                  )
                                ],
                              )
                            ]),
                      )
                    ]),
                  ));
            },
          );
        },
      ),
    );
  }
}

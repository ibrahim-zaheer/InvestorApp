import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_image_slider/carousel.dart';

// ignore: must_be_immutable
class UserDetailScreen extends StatefulWidget {
  String? userID;
  UserDetailScreen({super.key, this.userID});

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  String email = "";
  // String imageProfile = "";
  String name = "";
  String phoneNumber = "";
  String age = "";
  String city = "";
  String country = "";
  String lookingForInAPartner = "";
  String profileHeading = "";
  String publishedDateTime = "";
  String height = "";
  String weight = "";
  String bodyType = "";
  String drink = "";
  String smoke = "";
  String maritalStatus = "";
  String haveChildren = "";
  String numberOfChildren = "";
  String profession = "";
  String income = "";
  String livingSituation = "";
  String willingToRelocate = "";
  String relationshipYouAreLookingFor = "";
  String nationality = "";
  String education = "";
  String language = "";
  String religion = "";
  String ethnicity = "";

  String ImageAddress =
      "https://firebasestorage.googleapis.com/v0/b/investor-9bc34.appspot.com/o/ImageProfile%2Fprofile%20image.jpg?alt=media&token=06dfaddb-f634-4fc8-a458-116033114283";

  String urlImage1 =
      "https://firebasestorage.googleapis.com/v0/b/investor-9bc34.appspot.com/o/ImageProfile%2Fprofile%20image.jpg?alt=media&token=06dfaddb-f634-4fc8-a458-116033114283";
  String urlImage2 =
      "https://firebasestorage.googleapis.com/v0/b/investor-9bc34.appspot.com/o/ImageProfile%2Fprofile%20image.jpg?alt=media&token=06dfaddb-f634-4fc8-a458-116033114283";
  String urlImage3 =
      "https://firebasestorage.googleapis.com/v0/b/investor-9bc34.appspot.com/o/ImageProfile%2Fprofile%20image.jpg?alt=media&token=06dfaddb-f634-4fc8-a458-116033114283";
  String urlImage4 =
      "https://firebasestorage.googleapis.com/v0/b/investor-9bc34.appspot.com/o/ImageProfile%2Fprofile%20image.jpg?alt=media&token=06dfaddb-f634-4fc8-a458-116033114283";
  String urlImage5 =
      "https://firebasestorage.googleapis.com/v0/b/investor-9bc34.appspot.com/o/ImageProfile%2Fprofile%20image.jpg?alt=media&token=06dfaddb-f634-4fc8-a458-116033114283";

  retrieveUserInfo() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(widget.userID)
        .get()
        .then((snapshot) {
      if (snapshot.exists) {
        if (snapshot.data()!["urlImage1"] != null) {
          setState(() {
            urlImage1 = snapshot.data()!["urlImage1"];
            urlImage2 = snapshot.data()!["urlImage2"];
            urlImage3 = snapshot.data()!["urlImage3"];
            urlImage4 = snapshot.data()!["urlImage4"];
            urlImage5 = snapshot.data()!["urlImage5"];
          });
        }
        setState(() {
          name = snapshot.data()!['name'];
          // imageProfile= snapshot.data()!['imageProfile'];
          email = snapshot.data()!['email'];
          phoneNumber = snapshot.data()!['phoneNumber'];
          // password= snapshot.data()!['password'];
          // age = int.parse(snapshot.data()!['age']).toString();
          // age = snapshot.data()!['age'].toString();

          city = snapshot.data()!['city'];
          country = snapshot.data()!['country'];
          lookingForInAPartner = snapshot.data()!['lookingForInAPartner'];
          profileHeading = snapshot.data()!['profileHeading'];
          // publishedDateTime = snapshot.data()!['publishedDateTime'].toString();
//appearance
          height = snapshot.data()!['height'];
          weight = snapshot.data()!['weight'];
          bodyType = snapshot.data()!['bodyType'];

// LifeStyle
          drink = snapshot.data()!['drink'];
          smoke = snapshot.data()!['smoke'];
          maritalStatus = snapshot.data()!['maritalStatus'];
          haveChildren = snapshot.data()!['haveChildren'];
          numberOfChildren = snapshot.data()!['numberOfChildren'];
          profession = snapshot.data()!['profession'];
          income = snapshot.data()!['income'];
          livingSituation = snapshot.data()!['livingSituation'];
          willingToRelocate = snapshot.data()!['willingToRelocate'];
          relationshipYouAreLookingFor =
              snapshot.data()!['relationshipYouAreLookingFor'];

          // Cultural Choices
          nationality = snapshot.data()!['nationality'];
          education = snapshot.data()!['education'];
          language = snapshot.data()!['language'];
          religion = snapshot.data()!['religion'];
          ethnicity = snapshot.data()!['ethnicity'];
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    retrieveUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "User Profile",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          // for setting the default backward button to disappear
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: const Icon(
                Icons.logout,
                size: 30,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
                //Image Area
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: EdgeInsets.all(2),
                    child: Carousel(
                      indicatorBarColor: Colors.black.withOpacity(0.3),
                      autoScrollDuration: const Duration(seconds: 3),
                      animationPageDuration: const Duration(milliseconds: 500),
                      activateIndicatorColor: Colors.black,
                      animationPageCurve: Curves.easeIn,
                      indicatorBarHeight: 30,
                      indicatorWidth: 10,
                      indicatorHeight: 10,
                      unActivatedIndicatorColor: Colors.grey,
                      stopAtEnd: false,
                      autoScroll: true,
                      items: [
                        Container(
                          color: Colors.blue,
                        ),
                        Container(
                          color: Colors.green,
                        ),
                        Container(
                          color: Colors.yellow,
                        ),
                        Image.network(
                          urlImage1,
                          fit: BoxFit.cover,
                        ),
                        Image.network(
                          urlImage2,
                          fit: BoxFit.cover,
                        ),
                        Image.network(
                          urlImage3,
                          fit: BoxFit.cover,
                        ),
                        Image.network(
                          urlImage4,
                          fit: BoxFit.cover,
                        ),
                        Image.network(
                          urlImage5,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                //Personal Info
                const SizedBox(
                  height: 30.0,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Personal Info:",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                //we will write this to add a line
                const Divider(
                  color: Colors.white,
                  thickness: 2,
                ),
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(20.0),
                  child: Table(
                    children: [
                      TableRow(children: [
                        const Text(
                          "Name:",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          name,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ]),
                      //use this table row to add extra space
                      const TableRow(children: [Text(""), Text("")]),
                      //Email
                      TableRow(children: [
                        const Text(
                          "Email:",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          email,
                          style: const TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ]),
                      //use this table row to add extra space
                      const TableRow(children: [Text(""), Text("")]),
                      //Phone Number
                      TableRow(children: [
                        const Text(
                          "Phone Number:",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          phoneNumber,
                          style: const TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ]),
                      //use this table row to add extra space
                      const TableRow(children: [Text(""), Text("")]),
                      //Seeking
                      TableRow(children: [
                        const Text(
                          "Seeking:",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          lookingForInAPartner,
                          style: const TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ]),
                    ],
                  ),
                ),

                //Apperance

                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Appearance:",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                //we will write this to add a line
                const Divider(
                  color: Colors.white,
                  thickness: 2,
                ),
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(20.0),
                  child: Table(
                    children: [
                      TableRow(children: [
                        const Text(
                          "Height:",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          height,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ]),
                      //use this table row to add extra space
                      const TableRow(children: [Text(""), Text("")]),
                      //Email
                      TableRow(children: [
                        const Text(
                          "Weight",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          weight,
                          style: const TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ]),
                      //use this table row to add extra space
                      const TableRow(children: [Text(""), Text("")]),
                      //Phone Number
                      TableRow(children: [
                        const Text(
                          "Body Type:",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          bodyType,
                          style: const TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ]),
                      //use this table row to add extra space
                      const TableRow(children: [Text(""), Text("")]),
                    ],
                  ),
                ),

                //LifeStyle
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Life Style:",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                //we will write this to add a line
                const Divider(
                  color: Colors.white,
                  thickness: 2,
                ),
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(20.0),
                  child: Table(
                    children: [
                      TableRow(children: [
                        const Text(
                          "Drink",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          drink,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ]),
                      //use this table row to add extra space
                      const TableRow(children: [Text(""), Text("")]),
                      //Smoke
                      TableRow(children: [
                        const Text(
                          "Smoke:",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          smoke,
                          style: const TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ]),
                      //use this table row to add extra space
                      const TableRow(children: [Text(""), Text("")]),
                      //Martial Status
                      TableRow(children: [
                        const Text(
                          "Martial Status:",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          maritalStatus,
                          style: const TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ]),
                      //use this table row to add extra space
                      const TableRow(children: [Text(""), Text("")]),
                      //Have children
                      TableRow(children: [
                        const Text(
                          "Have Children:",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          haveChildren,
                          style: const TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ]),
                      //use this table row to add extra space
                      const TableRow(children: [Text(""), Text("")]),
                      //Number of children
                      TableRow(children: [
                        const Text(
                          "Number of children",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          numberOfChildren,
                          style: const TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ]),
                      //use this table row to add extra space
                      const TableRow(children: [Text(""), Text("")]),
                      //Profession
                      TableRow(children: [
                        const Text(
                          "Profession:",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          profession,
                          style: const TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ]),
                      //use this table row to add extra space
                      const TableRow(children: [Text(""), Text("")]),
                      //Income
                      TableRow(children: [
                        const Text(
                          "Income:",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          income,
                          style: const TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ]),
                      //use this table row to add extra space
                      const TableRow(children: [Text(""), Text("")]),
                      //Living Situation
                      TableRow(children: [
                        const Text(
                          "Living Situation:",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          livingSituation,
                          style: const TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ]),
                      //use this table row to add extra space
                      const TableRow(children: [Text(""), Text("")]),
                      //Willing to relocate
                      TableRow(children: [
                        const Text(
                          "Willing to relocate:",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          willingToRelocate,
                          style: const TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ]),
                      //use this table row to add extra space
                      const TableRow(children: [Text(""), Text("")]),
                      //Relationship you are looking for
                      TableRow(children: [
                        const Text(
                          "Relationship you are looking for:",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          relationshipYouAreLookingFor,
                          style: const TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ]),
                    ],
                  ),
                ),

                //Cultural Background

                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Cultural Background",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                //we will write this to add a line
                const Divider(
                  color: Colors.white,
                  thickness: 2,
                ),
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(20.0),
                  child: Table(
                    children: [
                      TableRow(children: [
                        const Text(
                          "Nationality:",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          nationality,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ]),
                      //use this table row to add extra space
                      const TableRow(children: [Text(""), Text("")]),
                      //education
                      TableRow(children: [
                        const Text(
                          "Education",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          education,
                          style: const TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ]),
                      //use this table row to add extra space
                      const TableRow(children: [Text(""), Text("")]),
                      //language
                      TableRow(children: [
                        const Text(
                          "Language:",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          language,
                          style: const TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ]),
                      //use this table row to add extra space
                      const TableRow(children: [Text(""), Text("")]),
                      //religion
                      TableRow(children: [
                        const Text(
                          "Religion:",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          religion,
                          style: const TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ]),
                      //use this table row to add extra space
                      const TableRow(children: [Text(""), Text("")]),
                      //ethnicity
                      TableRow(children: [
                        const Text(
                          "Ethnicity:",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          ethnicity,
                          style: const TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ]),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

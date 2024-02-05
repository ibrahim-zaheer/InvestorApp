import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:investorapp/models/person.dart';

class ProfileController extends GetxController {
  final Rx<List<Person>> userProfileList = Rx<List<Person>>([]);
// we write like this to tell that values of userProfileList will be accessed by getAllUsersProfileList and
// so that we can easily use the list in other widget go to swipping screen to find it;
  List<Person> get getAllUsersProfileList => userProfileList.value;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    //we write this to display all users profile except for the profile of the current user
    // in the map part where we use querydatasnapsot we have access to all the data in firestore

    userProfileList.bindStream(FirebaseFirestore.instance
        .collection('users')
        .where('uid', isNotEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots()
        .map((QuerySnapshot queryDataSnapShot) {
      List<Person> userProfileList = [];
      for (var eachProfile in queryDataSnapShot.docs) {
        userProfileList.add(Person.fromdataSnapshot(eachProfile));
      }
      return userProfileList;
    }));
  }
}

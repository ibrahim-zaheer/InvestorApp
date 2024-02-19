import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:investorapp/global.dart';
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

  favouriteSentFavouriteRecieved(String toUserId, String senderName) async {
    //so in easyh words we are checking that user id we want to set favourite is already done favourite by us or
    // not if we have already done it, it will be shown
    var document = await FirebaseFirestore.instance
        .collection("users")
        .doc(toUserId)
        .collection("favouriteRecieved")
        .doc(currentUserId)
        .get();
// remove the favourite from database
    if (document.exists) {
      //favourite will be removed from the B person or 2nd User
      await FirebaseFirestore.instance
          .collection("users")
          .doc(toUserId)
          .collection("favouriteRecieved")
          .doc(currentUserId)
          .delete();
      //favourite will be removed from the A person or 1st User
      await FirebaseFirestore.instance
          .collection("users")
          .doc(currentUserId)
          .collection("favouriteSent")
          .doc(toUserId)
          .delete();
    }

    //mark as favourite in database

    else {
      //favourite will be added to the B person or 2nd User
      await FirebaseFirestore.instance
          .collection("users")
          .doc(toUserId)
          .collection("favouriteRecieved")
          .doc(currentUserId)
          .set({});
      //favourite will be added to the A person or 1st User
      await FirebaseFirestore.instance
          .collection("users")
          .doc(currentUserId)
          .collection("favouriteSent")
          .doc(toUserId)
          .set({});
    }
    update();
  }

  //like sent and like recieved
  likeSentLikeRecieved(String toUserId, String senderName) async {
    //so in easyh words we are checking that user id we want to set favourite is already done favourite by us or
    // not if we have already done it, it will be shown
    var document = await FirebaseFirestore.instance
        .collection("users")
        .doc(toUserId)
        .collection("likeRecieved")
        .doc(currentUserId)
        .get();
// remove the like from database
    if (document.exists) {
      //like will be removed from the B person or 2nd User
      await FirebaseFirestore.instance
          .collection("users")
          .doc(toUserId)
          .collection("likeRecieved")
          .doc(currentUserId)
          .delete();
      //like will be removed from the A person or 1st User
      await FirebaseFirestore.instance
          .collection("users")
          .doc(currentUserId)
          .collection("likeSent")
          .doc(toUserId)
          .delete();
    }

    //mark as like in database

    else {
      //like will be added to the B person or 2nd User
      await FirebaseFirestore.instance
          .collection("users")
          .doc(toUserId)
          .collection("likeRecieved")
          .doc(currentUserId)
          .set({});
      //like will be added to the A person or 1st User
      await FirebaseFirestore.instance
          .collection("users")
          .doc(currentUserId)
          .collection("likeSent")
          .doc(toUserId)
          .set({});
    }
    update();
  }

  //view sent view recieved screen

  viewSentViewRecieved(String toUserId, String senderName) async {
    //so in easyh words we are checking that user id we want to set view is already done  by us or
    // not if we have already done it, it will be shown
    var document = await FirebaseFirestore.instance
        .collection("users")
        .doc(toUserId)
        .collection("viewRecieved")
        .doc(currentUserId)
        .get();
// since view will happen when we view someone's profile while swipping
    if (document.exists) {
      print("Already in view list");
    }

    //mark as like in database

    else {
      //like will be added to the B person or 2nd User
      await FirebaseFirestore.instance
          .collection("users")
          .doc(toUserId)
          .collection("viewRecieved")
          .doc(currentUserId)
          .set({});
      //like will be added to the A person or 1st User
      await FirebaseFirestore.instance
          .collection("users")
          .doc(currentUserId)
          .collection("viewSent")
          .doc(toUserId)
          .set({});
    }
    update();
  }
}

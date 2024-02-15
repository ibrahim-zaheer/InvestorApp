import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:investorapp/global.dart';

class FavouriteSentFavouriteRecievedScreen extends StatefulWidget {
  const FavouriteSentFavouriteRecievedScreen({super.key});

  @override
  State<FavouriteSentFavouriteRecievedScreen> createState() =>
      _FavouriteSentFavouriteRecievedScreenState();
}

class _FavouriteSentFavouriteRecievedScreenState
    extends State<FavouriteSentFavouriteRecievedScreen> {
  bool isFavouriteSentCLicked = true;
  List<String> favouriteSentList = [];
  List<String> favouriteRecieveList = [];

  List favouriteList = [];
  //we write this code to access the sub collection from a collection in firebase
  //favourite sent screen
  getFavouriteListKeys() async {
    if (isFavouriteSentCLicked) {
      var favouriteSentDocument = await FirebaseFirestore.instance
          .collection("users")
          .doc(currentUserId)
          .collection("favouriteSent")
          .get();
//  then we write this code to store id  values of subcollection in the list
      for (int i = 0; i < favouriteSentDocument.docs.length; i++) {
        favouriteSentList.add(favouriteSentDocument.docs[i].id);
      }
      getKeysDataFromUsersCollection(favouriteSentList);
    } else {
      //favourite recieved screen
      var favouriteRecieveDocument = await FirebaseFirestore.instance
          .collection("users")
          .doc(currentUserId)
          .collection("favouriteRecieved")
          .get();
      //  then we write this code to store id  values of subcollection in the list
      for (int i = 0; i < favouriteRecieveDocument.docs.length; i++) {
        favouriteRecieveList.add(favouriteRecieveDocument.docs[i].id);
      }
      getKeysDataFromUsersCollection(favouriteRecieveList);
    }
  }
  // we write this code to display list of users who have set us favourite or we set them favourite it
  //the keyList parameter represents the list we sent in if else condition ofgetFavouriteListKeys

  getKeysDataFromUsersCollection(List<String> keysList) async {
    //we get list of all users
    var allUsersDocument =
        await FirebaseFirestore.instance.collection("users").get();
// we pick one user at a time
    for (int i = 0; i < allUsersDocument.docs.length; i++) {
// then we pick one user from the list we sent
      for (int k = 0; k < keysList.length; k++) {
        // then we compare users from both list and if mashes, it will be added in the list
        if ((allUsersDocument.docs[i].data() as dynamic)["uid"] ==
            keysList[k]) {
          favouriteList.add(allUsersDocument.docs[i].data());
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextButton(
              onPressed: () {
                setState(() {
                  // in the code as we know the list is going to be used again and again
                  // when rendering the data so when button is clicked we will make sure that list is empty
                  favouriteSentList.clear();
                  favouriteSentList = [];
                  favouriteRecieveList.clear();
                  favouriteRecieveList = [];
                  favouriteList.clear();
                  favouriteList = [];
                  isFavouriteSentCLicked = true;
                });
                getFavouriteListKeys();
              },
              child: Text(
                "My Favourites",
                style: TextStyle(
                    color: isFavouriteSentCLicked ? Colors.white : Colors.grey,
                    fontWeight: isFavouriteSentCLicked
                        ? FontWeight.bold
                        : FontWeight.normal,
                    fontSize: 14),
              ),
            ),
            const Text(
              "   |   ",
              style: TextStyle(color: Colors.grey),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  // in the code as we know the list is going to be used again and again
                  // when rendering the data so when button is clicked we will make sure that list is empty
                  favouriteSentList.clear();
                  favouriteSentList = [];
                  favouriteRecieveList.clear();
                  favouriteRecieveList = [];
                  favouriteList.clear();
                  favouriteList = [];
                  isFavouriteSentCLicked = false;
                });
                getFavouriteListKeys();
              },
              child: Text(
                "I'm their Favourites",
                style: TextStyle(
                    color: isFavouriteSentCLicked ? Colors.white : Colors.grey,
                    fontWeight: isFavouriteSentCLicked
                        ? FontWeight.bold
                        : FontWeight.normal,
                    fontSize: 14),
              ),
            ),
          ]),
        ),
        body: favouriteList.isEmpty
            ? const Center(
                child: Icon(
                  Icons.person_off,
                  color: Colors.white,
                  size: 60,
                ),
              )
            // we use grid view to help us display the number of  data such as image,video or text in column form
            : GridView.count(
                crossAxisCount: 2,
                padding: const EdgeInsets.all(8),
                children: List.generate(favouriteList.length, (index) {
                  return GridTile(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Card(
                        color: Colors.blue.shade200,
                        child: GestureDetector(
                          onTap: () {},
                          child: DecoratedBox(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        favouriteList[index]['imageProfile'],
                                      ),
                                      fit: BoxFit.cover))),
                        ),
                      ),
                    ),
                  );
                }),
              ));
  }
}

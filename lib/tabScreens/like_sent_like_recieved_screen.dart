import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:investorapp/global.dart';

class LikeSentLikeRecievedScreen extends StatefulWidget {
  const LikeSentLikeRecievedScreen({super.key});

  @override
  State<LikeSentLikeRecievedScreen> createState() =>
      _LikeSentLikeRecievedScreenState();
}

class _LikeSentLikeRecievedScreenState
    extends State<LikeSentLikeRecievedScreen> {
  bool isLikeSentCLicked = true;
  List<String> likeSentList = [];
  List<String> likeRecieveList = [];

  List favouriteList = [];
  //we write this code to access the sub collection from a collection in firebase
  //favourite sent screen
  getLikeListKeys() async {
    if (isLikeSentCLicked) {
      var favouriteSentDocument = await FirebaseFirestore.instance
          .collection("users")
          .doc(currentUserId)
          .collection("likeSent")
          .get();
//  then we write this code to store id  values of subcollection in the list
      for (int i = 0; i < favouriteSentDocument.docs.length; i++) {
        likeSentList.add(favouriteSentDocument.docs[i].id);
      }
      getKeysDataFromUsersCollection(likeSentList);
    } else {
      //favourite recieved screen
      var likeRecieveDocument = await FirebaseFirestore.instance
          .collection("users")
          .doc(currentUserId)
          .collection("likeRecieved")
          .get();
      //  then we write this code to store id  values of subcollection in the list
      for (int i = 0; i < likeRecieveDocument.docs.length; i++) {
        likeRecieveList.add(likeRecieveDocument.docs[i].id);
      }
      print("Favourite Recieve List :" + likeRecieveList.toString());
      getKeysDataFromUsersCollection(likeRecieveList);
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
    setState(() {
      favouriteList;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLikeListKeys();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextButton(
              onPressed: () {
                setState(() {
                  // in the code as we know the list is going to be used again and again
                  // when rendering the data so when button is clicked we will make sure that list is empty
                  likeSentList.clear();
                  likeSentList = [];
                  likeRecieveList.clear();
                  likeRecieveList = [];
                  favouriteList.clear();
                  favouriteList = [];
                  isLikeSentCLicked = true;
                });
                getLikeListKeys();
              },
              child: Text(
                "My Likes",
                style: TextStyle(
                    color: isLikeSentCLicked ? Colors.grey : Colors.white,
                    fontWeight:
                        isLikeSentCLicked ? FontWeight.normal : FontWeight.bold,
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
                  likeSentList.clear();
                  likeSentList = [];
                  likeRecieveList.clear();
                  likeRecieveList = [];
                  favouriteList.clear();
                  favouriteList = [];
                  isLikeSentCLicked = false;
                });
                getLikeListKeys();
              },
              child: Text(
                "I'm their Likes",
                style: TextStyle(
                    color: isLikeSentCLicked ? Colors.white : Colors.grey,
                    fontWeight:
                        isLikeSentCLicked ? FontWeight.bold : FontWeight.normal,
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
                                    fit: BoxFit.cover)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Spacer(),
                                    Text(
                                      "${favouriteList[index]['name']} . ${favouriteList[index]['age']}",
                                      maxLines: 2,
                                      style: const TextStyle(
                                          // we write this code to adjust the screen size in case the text overflows
                                          //for this we wrap the Text with Expanded widget
                                          overflow: TextOverflow.ellipsis,
                                          color: Colors.grey,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.location_city_outlined,
                                          color: Colors.grey,
                                          size: 16,
                                        ),
                                        Expanded(
                                          child: Text(
                                            "${favouriteList[index]['city']} . ${favouriteList[index]['country']}",
                                            maxLines: 2,
                                            style: const TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              color: Colors.grey,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ));
  }
}

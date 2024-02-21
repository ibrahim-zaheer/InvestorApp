import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:investorapp/global.dart';

class ViewSentViewRecievedScreen extends StatefulWidget {
  const ViewSentViewRecievedScreen({super.key});

  @override
  State<ViewSentViewRecievedScreen> createState() =>
      _ViewSentViewRecievedScreenState();
}

class _ViewSentViewRecievedScreenState
    extends State<ViewSentViewRecievedScreen> {
  bool isViewSentCLicked = true;
  List<String> viewSentList = [];
  List<String> viewRecieveList = [];

  List favouriteList = [];
  //we write this code to access the sub collection from a collection in firebase
  //favourite sent screen
  getViewListKeys() async {
    if (isViewSentCLicked) {
      var viewSentDocument = await FirebaseFirestore.instance
          .collection("users")
          .doc(currentUserId)
          .collection("viewSent")
          .get();
//  then we write this code to store id  values of subcollection in the list
      for (int i = 0; i < viewSentDocument.docs.length; i++) {
        viewSentList.add(viewSentDocument.docs[i].id);
      }
      getKeysDataFromUsersCollection(viewSentList);
    } else {
      //favourite recieved screen
      var viewRecieveDocument = await FirebaseFirestore.instance
          .collection("users")
          .doc(currentUserId)
          .collection("viewRecieved")
          .get();
      //  then we write this code to store id  values of subcollection in the list
      for (int i = 0; i < viewRecieveDocument.docs.length; i++) {
        viewRecieveList.add(viewRecieveDocument.docs[i].id);
      }
      print("Favourite Recieve List :" + viewRecieveList.toString());
      getKeysDataFromUsersCollection(viewRecieveList);
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
    getViewListKeys();
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
                  viewSentList.clear();
                  viewSentList = [];
                  viewRecieveList.clear();
                  viewRecieveList = [];
                  favouriteList.clear();
                  favouriteList = [];
                  isViewSentCLicked = true;
                });
                getViewListKeys();
              },
              child: Text(
                "Profile I Viewed",
                style: TextStyle(
                    color: isViewSentCLicked ? Colors.grey : Colors.white,
                    fontWeight:
                        isViewSentCLicked ? FontWeight.normal : FontWeight.bold,
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
                  viewSentList.clear();
                  viewSentList = [];
                  viewRecieveList.clear();
                  viewRecieveList = [];
                  favouriteList.clear();
                  favouriteList = [];
                  isViewSentCLicked = false;
                });
                getViewListKeys();
              },
              child: Text(
                "Profile they Viewed",
                style: TextStyle(
                    color: isViewSentCLicked ? Colors.white : Colors.grey,
                    fontWeight:
                        isViewSentCLicked ? FontWeight.bold : FontWeight.normal,
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

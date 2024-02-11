import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:investorapp/tabScreens/favourite_sent_favourite_recieved_screen.dart';
import 'package:investorapp/tabScreens/like_sent_like_recieved_screen.dart';
import 'package:investorapp/tabScreens/swippingScreen.dart';
import 'package:investorapp/tabScreens/user_detail_screen.dart';
import 'package:investorapp/tabScreens/view_sent_view_recieved_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int screenIndex = 0;
  List tabScreenList = [
    SwippingScreen(), //1st index
    ViewSentViewRecievedScreen(), //2nd index
    FavouriteSentFavouriteRecievedScreen(), //3rd index and so on
    LikeSentLikeRecievedScreen(),
    UserDetailScreen(
      userID: FirebaseAuth.instance.currentUser!.uid,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: (indexNumber) {
            setState(() {
              screenIndex = indexNumber;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white12,
          currentIndex: screenIndex,
          items: const [
            //  SwippingScreen(),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 30,
                ),
                label: ""),
            // ViewSentViewRecievedScreen(),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.remove_red_eye,
                  size: 30,
                ),
                label: ""),
            // FavouriteSentFavouriteRecievedScreen(),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.star,
                  size: 30,
                ),
                label: ""),
            // LikeSentLikeRecievedScreen(),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                  size: 30,
                ),
                label: ""),
            // UserDetailScreen(),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  size: 30,
                ),
                label: ""),
          ],
        ),
        body: tabScreenList[screenIndex]);
  }
}

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
    UserDetailScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Welcome',
          style: TextStyle(fontSize: 20, color: Colors.green),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class FavouriteSentFavouriteRecievedScreen extends StatefulWidget {
  const FavouriteSentFavouriteRecievedScreen({super.key});

  @override
  State<FavouriteSentFavouriteRecievedScreen> createState() =>
      _FavouriteSentFavouriteRecievedScreenState();
}

class _FavouriteSentFavouriteRecievedScreenState
    extends State<FavouriteSentFavouriteRecievedScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Favourite Sent Favourite Recieved Screen',
          style: TextStyle(fontSize: 20, color: Colors.green),
        ),
      ),
    );
  }
}

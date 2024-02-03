import 'package:flutter/material.dart';

class LikeSentLikeRecievedScreen extends StatefulWidget {
  const LikeSentLikeRecievedScreen({super.key});

  @override
  State<LikeSentLikeRecievedScreen> createState() =>
      _LikeSentLikeRecievedScreenState();
}

class _LikeSentLikeRecievedScreenState
    extends State<LikeSentLikeRecievedScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Like Sent Like Recieved Screen',
          style: TextStyle(fontSize: 20, color: Colors.green),
        ),
      ),
    );
  }
}

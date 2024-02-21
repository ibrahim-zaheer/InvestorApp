import 'dart:io';

import 'package:flutter/material.dart';

class accountSettingScreen extends StatefulWidget {
  const accountSettingScreen({super.key});

  @override
  State<accountSettingScreen> createState() => _accountSettingScreenState();
}

class _accountSettingScreenState extends State<accountSettingScreen> {
  //we use next button to move from one page to another especially when user selects image and then click next to
  //go to next page
  bool uploading = false, next = false;
  final List<File> _image = [];
  List<String> urlList = [];
  double val = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          next ? "Profile Information" : "Choose 5 Images",
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
    );
  }
}

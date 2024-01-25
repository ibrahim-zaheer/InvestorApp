import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investorapp/authenticationscreen/login_screen.dart';

void main() {
  runApp(MyAPP());
}

class MyAPP extends StatelessWidget {
  const MyAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Investor App",
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

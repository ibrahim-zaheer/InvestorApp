import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investorapp/authenticationscreen/registration_screen.dart';
import 'package:investorapp/controllers/authentication_controller.dart';
import 'package:investorapp/widget/custom_text_field_widget.dart';
import '../components/text_Editing_controllers.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailTextEditingController = TextEditingController();

  TextEditingController _passwordTextEditingController =
      TextEditingController();

  bool showProgressBar = false;
  AuthenticatorController authenticatorController =
      new AuthenticatorController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 220,
              ),
              Image.asset(
                "assets/images/logo.jpeg",
                width: 200,
              ),
              const Text(
                "WELCOME",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              const Text(
                "PLEASE LOGIN NOW TO FIND THE BEST INVESTOR",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              //email
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width - 36,
                child: CustomTextFieldWidget(
                  editingController: _emailTextEditingController,
                  labelText: 'Email',
                  isHidden: false,
                  iconData: Icons.email_outlined,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //password
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width - 36,
                child: CustomTextFieldWidget(
                  editingController: _passwordTextEditingController,
                  labelText: 'Password',
                  isHidden: true,
                  iconData: Icons.password_outlined,
                ),
              ),
              //login button
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width - 36,
                decoration: const BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: InkWell(
                  onTap: () async {
                    if (_emailTextEditingController.text.trim().isNotEmpty &&
                        _passwordTextEditingController.text.trim().isNotEmpty) {
                      setState(() {
                        showProgressBar = true;
                      });
                      await authenticatorController.loginUser(
                          _emailTextEditingController.text.trim(),
                          _passwordTextEditingController.text.trim());
                      setState(() {
                        showProgressBar = false;
                      });
                    } else {
                      Get.snackbar("Field Empty", "Please Fill All The Field");
                    }
                  },
                  child: const Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              //dont have an account
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Dont have an account',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width - 36,
                    decoration: const BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: InkWell(
                      onTap: () {
                        Get.to(RegistrationScreen());
                      },
                      child: const Center(
                        child: Text(
                          'Click Here',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.pink),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              showProgressBar == true
                  ? CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
